<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% String path = request.getContextPath(); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/json2.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>

<script>
	var json = '{"job.jobId":"_jobId","job.stuId":"_stuId","job.company":"_company","job.jobTitle":"_jobTitle","job.salary":"_salary","job.welfare":"_welfare","job.address":"_address","job.comPhone":"_comPhone","job.hireDay":"_hireDay","job.status":"_status","job.stu.name":"_stuName","job.des":"_des"}';
	$(function() {
		setPagination("list");
	});
	
	function authority(methodName, jsonStr, method,index) {
		$.get("<%=path %>/aut/authority?methodName=" + methodName,
			function(data) {
				if (data.resu.request == "success") {
					if (method == "add") {
						$("#addForm").form("clear"); // 清除表单的内容
						$("#addWin").window("open"); // 打开窗口
					} else if (method == "edit") {
						$("#editForm").form("load", JSON.parse(jsonStr));
						$("#editWin").window("open");
					}else if(method == "disable"){
						var row = $('#job').datagrid('getData').rows[index];
						if(row){
							$.post("<%=path %>/job/jobDisable?id=" + row.jobId,
								function(data){
									getGradeId(gradeId);
							},"json");
						}
					}else if(method == "activate"){
						var row = $('#job').datagrid('getData').rows[index];
						if(row){
							$.post("<%=path %>/job/jobActivate?id=" + row.jobId,
								function(data){
									$.get("<%=path %>/job/gradeByPager?gradeId=" + gradeId,
										function(data) {
										getGradeId(gradeId);
									}, "json");
							},"json");
						}
					}
				} else if (data.resu.request == "fail") {
					$.messager.alert("提示", data.resu.message, "error");
				}
			}, "json");
	}	
	
	function showAddJobWin(){
		authority('com.oa.action.JobAction.addJob', "", "add",'');
	}
	function showEditJobWin(){
		var rows = $("#job").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的行","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = json.replace("_jobId",row.jobId).replace("_des",row.des).replace("_company",row.company).replace("_jobTitle",row.jobTitle).replace("_stuName",row.stu.name).replace("_stuId",row.stuId).replace("_status",row.status).replace("_salary",row.salary).replace("_hireDay",row.hireDay).
				replace("_comPhone",row.comPhone).replace("_address",row.address).replace("_welfare",row.welfare);
				authority('com.oa.action.JobAction.updateJob', json1, "edit",'');
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的学生就业","info");
		}
		
	}
	
	
	function addJob() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/job/addJob",
					$("#addForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#addWin").window("close"); // 关闭窗口
						$.messager.alert("提示",data.resu.message,"info");
					}else if(data.resu.reuqest == "fail"){
						$.messager.alert("提示",data.resu.message,"info");
					}
			},"json");
		}else{
			$.messager.alert("提示","请输人正确的数据","info");
		}
	}
	

	
	function editJob(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/job/updateJob",
					$("#editForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#editWin").window("close"); // 关闭窗口
						getGradeId(gradeId); // 重新加载指定数据网格数据
						$.messager.alert("提示",data.resu.message,"info");
					}else if(data.resu.reuqest == "fail"){
						$.messager.alert("提示",data.resu.message,"info");
					}
			},"json");
		}else{
			$.messager.alert("提示","请输人正确的数据","info");
		}
	
	}
	
	var gradeId = "";
	
	function getGradeId(gradeId){
		$.get("<%=path %>/job/gradeByPager?gradeId=" + gradeId,
				function(data) {
				$("#job").datagrid("loadData", data.rows);
			}, "json");
	}
	
	function showStuWin(){ // 某个班级下的所有学生就业
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班级","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				gradeId = row.gradeId;
				getGradeId(gradeId);
					$("#selectJobWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个班级","info");
		}
	}
	
	

	function selectGrade(){  // 选择班级
		$.get("<%=path %>/grade/gradePager", function(data) {
			$("#list1").datagrid("loadData", data.rows);
		}, "json");
		$("#selectWin").window("open");
	}
	function closeGradeWin(){ // 关闭班级窗口
		$("#selectWin").window("close");
	}
	
	function closeStudentWin(){ // 关学生窗口
		$("#selectGradeWin").window("close");
	}
	
	function openGradeWin(){  // 打开班级选择学生
		var rows = $("#list1").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班级","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$.get("<%=path %>/stu/stuGradeById?gradeId=" + row.gradeId,
					function(data) {
					$("#list2").datagrid("loadData", data.rows);
				}, "json");
				$("#selectGradeWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个班级","info");
		}
		
	}
	
	function submitGradeWin(){ // 选择完宿舍长
		var rows = $("#list2").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$("#studentId").val(row.stuId);
				$("#studentName").val(row.name);
				$("#selectWin").window("close");
				$("#selectGradeWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个学生","info");
		}
	}

	
	
	
	function disable(index){   // 禁用
		
		authority('com.oa.action.JobAction.jobDisable', '', "disable",index);
	}
		
	function activate(index){  // 启用
		
		authority('com.oa.action.JobAction.jobActivate', '', "activate",index);
	}
	
	
	function queryByName(){
		var stuName = $('#gradeName').textbox('getValue');
	    if (stuName != "") {
	    	$.get("<%=path %>/grade/pagerByName?gradeName=" + stuName,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
							$.messager.alert("提示",data.resu.message,"info");
						}else{
							$.messager.alert("提示",data.resu.message,"info");
						}
						
				}, "json");
	    } else {
	    	$.get("<%=path %>/grade/gradePager",
					function(data) {
					$("#list").datagrid("loadData", data.rows);
				}, "json");
	    }
	}

	var status = 0;
	function formatterOpt(value,row,index){ // 操作栏
		if(status == 1){
			return "<a href = 'javascript:;'onclick = 'disable("+index+")'>禁用</a>";
		}else if(status == 0){
			return "<a href = 'javascript:;'onclick = 'activate("+index+")'>启用</a>";
		}
		
	}
	
	function frozenActivate(value,row,index){  // 显示状态为可用或不可用
		if(value == 1){
			status = 1;
			return "可用";
		}else if(value == 0){
			status = 0;
			return "不可用";
		}
	}
	
	function showName(value) {
		return value.name;
	}
	
	function showEmpName(value) {
		return value.name;
	}
</script>
</head>
<body id = "body">
	<table id = "list"class="easyui-datagrid" 
			data-options="toolbar:'#tb',singleSelect:true,
			collapsible:true,
			url:'<%=path %>/grade/gradePager',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:100%;"
			>
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'name',align:'center'">班级名称</th>
				<th data-options="field:'empId1',align:'center'" formatter="showEmpName">班主任</th>
				<th data-options="field:'empId2',align:'center'" formatter="showEmpName">专业老师</th>
				<th data-options="field:'empId3',align:'center'" formatter="showEmpName">辅导老师</th>
				<th data-options="field:'des',align:'center'">班级描述</th>
				<th data-options="field:'quantity',align:'center'">班级最大人数</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">班级状态</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "showAddJobWin()"class="easyui-linkbutton" iconCls="icon-add" >添加</a>
				<a href="javascript:;" onclick = "showStuWin()" class="easyui-linkbutton" iconCls="icon-edit">学生就业</a>
		</div>
		<div>
			班级名称: <input class="easyui-textbox" id = "gradeName"style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	<div id="selectJobWin" class="easyui-window" title="查看学生就业信息" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:1000px;height:400px;padding:5px;">
		<table id = "job"class="easyui-datagrid" 
				data-options="toolbar:'#tb3',singleSelect:true,
				collapsible:true,
				rownumbers:true,
				autoRowHeight:true,
				pagination:true,
				pageSize:20"
				style = "height:100%;"
				>
			<thead>
				<tr>
					<th data-options="field:'jobId',checkbox:true"></th>
					<th data-options="field:'company',align:'center'">公司名字</th>
					<th data-options="field:'stu',align:'center'" formatter="showName">学生名字</th>
					<th data-options="field:'jobTitle',align:'center'">职位</th>
					<th data-options="field:'salary',width:100,align:'center'">月薪</th>
					<th data-options="field:'welfare',width:100,align:'center'">福利</th>
					<th data-options="field:'address',width:150,align:'center'">公司地址</th>
					<th data-options="field:'comPhone',width:100,align:'center'">公司电话</th>
					<th data-options="field:'hireDay',width:130,align:'center'" formatter="formatterDate">入职时间</th>
					<th data-options="field:'status',align:'center'" formatter="frozenActivate">状态</th>
					<th data-options="field:'caozuo',width:80,align:'center'" formatter="formatterOpt">操作</th>
				</tr>
			</thead>
		</table>
		<div id="tb3" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			
				<a href="javascript:;" onclick = "showEditJobWin()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
		
	</div>
	</div>
	<div id="addWin" class="easyui-window" title="添加学生就业信息" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:250px;padding:5px;">
		<form id = "addForm">
			<table>
					<tr><td><input type="hidden" name = "studentId" id = "studentId"/></td></tr>
				<tr>
					<td>学生名字</td>
					<td><input class="easyui-validatebox textbox" id = "studentName" name="studentName" data-options="required:true"/></td>
					<td><a  href="javascript:;" onclick = "selectGrade()">选择</a></td>
				</tr>
				<tr>
					<td>公司名字</td>
					<td><input class="easyui-validatebox textbox" name="job.company" data-options = "required:true" /></td>
					
				</tr>
				<tr>
					<td>工作职位</td>
					<td><input class="easyui-validatebox textbox" name="job.jobTitle" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>月薪</td>
					<td><input class="easyui-validatebox textbox" name="job.salary" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>公司福利</td>
					<td><input class="easyui-validatebox textbox" name="job.welfare" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>公司地址</td>
					<td><input class="easyui-validatebox textbox" name="job.address" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>公司电话</td>
					<td><input class="easyui-validatebox textbox" name="job.comPhone" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>入职时间</td>
					<td><input class="easyui-datetimebox" name="job.hireDay" /></td>
				</tr>	
				<tr>
					<td>
						<a href="javascript:;" onclick="addJob();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>

	
	<div id="editWin" class="easyui-window" title="修改工作内容" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:270px;padding:5px;">
		<form id = "editForm">
			<table>
			<tr><td><input type="hidden" name = "job.jobId"/></td></tr>
			<tr><td><input type="hidden" name = "job.stuId" /></td></tr>
				<tr>
					<td>学生名字</td>
					<td><input class="easyui-validatebox textbox" name="job.stu.name" data-options="required:true,'disabled':true"/></td>
				</tr>
				<tr>
					<td>公司名字</td>
					<td><input class="easyui-validatebox textbox" name="job.company" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>工作职位</td>
					<td><input class="easyui-validatebox textbox" name="job.jobTitle" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>月薪</td>
					<td><input class="easyui-validatebox textbox" name="job.salary" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>公司福利</td>
					<td><input class="easyui-validatebox textbox" name="job.welfare" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>公司地址</td>
					<td><input class="easyui-validatebox textbox" name="job.address" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>公司电话</td>
					<td><input class="easyui-validatebox textbox" name="job.comPhone" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>入职时间</td>
					<td><input class="easyui-datetimebox" name="job.hireDay" /></td>
				</tr>
				<tr>
					<td>状态更改</td>
					<td>
						<input type = "radio"  name="job.status" value= "1"/>激活
						<input type = "radio"  name="job.status" value= "0"/>冻结
					</td>
				</tr>
				<tr>
					<td> 
						<a href="javascript:;" onclick="editJob();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
		<div id="selectWin" class="easyui-window" title="选择班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
		<table id = "list1"class="easyui-datagrid" 
			data-options="toolbar:'#tb1',singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:80%;"
			>
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'name',align:'center'">班级名称</th>
				<th data-options="field:'empId1',align:'center'" formatter = "showEmpName">班主任</th>
				<th data-options="field:'empId2',align:'center'" formatter = "showEmpName">专业老师</th>
				<th data-options="field:'empId3',align:'center'" formatter = "showEmpName">辅导老师</th>
				<th data-options="field:'des',align:'center'">班级描述</th>
				<th data-options="field:'quantity',align:'center'">班级最大人数</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">班级状态</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "openGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				<a href="javascript:;" onclick = "closeGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
		</div>
	</div>
	</div>
	<div id="selectGradeWin" class="easyui-window" title="选择学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:500px;height:350px;padding:5px;">
		<table id = "list2"class="easyui-datagrid" 
			data-options="toolbar:'#tb2',singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:80%;"
			>
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'name',align:'center'">名称</th>
				</tr>
			</thead>
		</table>
		<div id="tb" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
					<a href="javascript:;" onclick = "submitGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
					<a href="javascript:;" onclick = "closeStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
			</div>
		</div>
	</div>
</body>
</html>