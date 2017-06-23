package com.oa.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Course;
import com.oa.bean.Grade;
import com.oa.bean.Score;
import com.oa.bean.Student;
import com.oa.bean.info.ScoreInfo;
import com.oa.common.bean.Constants;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.ExcelUtil;
import com.oa.common.web.ExportExcel;
import com.oa.common.web.WebUtil;
import com.oa.service.GradeService;
import com.oa.service.ScoreService;
import com.opensymphony.xwork2.ActionSupport;

public class ScoreAction extends ActionSupport implements ServletRequestAware{

	
	private static final long serialVersionUID = 6766263173710525080L;

	private HttpServletRequest req;
	
	private List<Score> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	private Score score;		
	private String gradeId;
	
	private String course;
	private ScoreService scoreService;
	private GradeService gradeService;
	
	private int number; // 标识下载文件
	private String fileName; // 文件名
	private File file; // 用来保存上传的文件，file和表单file的name保持一致
	private String fileFileName; // 用来保存上传的文件名，表单的file+FileName
	
	
	public Score getScore() {
		return score;
	}

	public void setScore(Score score) {
		this.score = score;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	public InputStream getInputStream() throws Exception {
		FileInputStream inputStream = null;
		if (number == 1) {
			fileName = "score.xls";
			inputStream = new FileInputStream(new File(Constants.PATH_EXCEL + "score.xls"));
		}
		return inputStream;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}
	public List<Score> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	
	public String showScore(){
		return "showScore";
	}
	
	public String scoreInto(){
		return "";
	}
	
	public String scoreOutto(){
		return "";
	} 
	
	public String gradeByPager() {
		Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setTotal(scoreService.count("Score"));
		pager = scoreService.queryPagerByGradeId(pager, gradeId);
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	public String pagerByCourse(){
		Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = scoreService.queryBySearch(pager, course);
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows != null) {
			resu =  ControllerRequest.getSuccessRequest("查找成功");
		} 
		return "queryByCourse";
	}
	
	public String queryByGradeId(){
		Student stu = (Student) WebUtil.getSessionValue(req,"student");
		if(stu != null){
			Grade grade = gradeService.queryById(Grade.class, stu.getGradeId());
			Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
			pager.setPageNo(WebUtil.getPageNo(req));
			pager.setPageSize(WebUtil.getPageSize(req));
			pager.setTotal(scoreService.count("Score"));
			pager = scoreService.queryPagerByGradeId(pager, grade.getGradeId());
			rows = pager.getRows();
			total = pager.getTotal();
			return "queryBygradeid";
		}else{
			return ERROR;
		}
	}
	
	public String exportData() throws Exception {
		Pager4EasyUI<Score> pager = new Pager4EasyUI<Score>();
		String gradeName = req.getParameter("gradeName");
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setTotal(scoreService.count("Score"));
		pager = scoreService.queryPagerByGradeId(pager, gradeId);
		total = pager.getTotal();
		rows = pager.getRows();
		for(Score s: rows){
			s.setStuName(s.getStu().getName());
			s.setCourseName(s.getCourse().getName());
		}
		if (rows != null && rows.size() > 0) {
			Map<String,String> titleMap = new LinkedHashMap<String,String>();
			titleMap.put("stuName", "学生姓名");
			titleMap.put("courseName", "课程名称");
			titleMap.put("score", "成绩");
			titleMap.put("testDay", "考试时间");
			String sheetName = gradeName+"学生成绩";
			File file = new File(Constants.PATH_EXCEL);
			if (!file.exists()) {
				file.mkdir();
			}
			ExportExcel.excelExport(pager.getRows(), titleMap, sheetName, gradeName+"score", Constants.PATH_EXCEL);
			resu = ControllerRequest.getSuccessRequest("导出成功,请到"+Constants.PATH_EXCEL+"查看");
		} else {
			resu = ControllerRequest.getFailRequest("导出失败");
		}
		return "excelIn";
	}
	
	public String importData() {
		System.out.println("进入action");
		mkUpload(); // 调用创建上传文件的文件夹
		if (file != null) { // 表示用户有选择文件
			fileFileName = "score.xls";
			String path = Constants.UPLOAD_PATH + "\\" + fileFileName;
			try {
				FileUtils.copyFile(file, new File(path)); // 保存文件
				@SuppressWarnings("unchecked")
				List<ScoreInfo> scis = ExcelUtil.excleIn(ScoreInfo.class, path);
				System.out.println(scis);
				for (ScoreInfo sci : scis) {
					System.out.println(sci.getStuId());
					Score s = setScoreInfo(sci);
					scoreService.save(s);
				}
				resu = ControllerRequest.getSuccessRequest("成功导入");
			} catch (IOException e) {
				e.printStackTrace();
			} 
		} else {
			resu = ControllerRequest.getFailRequest("文件上传失败，请选择你要上传的文件");
		}
		return "importData";
	}
	
	
	private Score setScoreInfo(ScoreInfo si) {
		Score s = new Score();
		
		Student stu = new Student();
		stu.setStuId(si.getStuId());
		s.setStu(stu);
		
		Course c = new Course();
		c.setCourseId(si.getCourseId());
		s.setCourse(c);
		
		s.setScore(si.getScore());
		s.setTestDay(si.getTestDay())
		;
		return s;
	}
	
	/**
	 * 用于新建文件夹来接收上传的文件
	 */
	private void mkUpload() {
		File file = new File(Constants.UPLOAD_PATH); // 根据这个路径来创建一个文件夹
		if (!file.exists()) { // 判断文件夹是否存在
			file.mkdir(); // 创建文件夹，用于存放上传的文件
		}
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}

}
