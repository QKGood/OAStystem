<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/full_text.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<style type="text/css">
.message{
	 width:300px;
	 height:100px;
	 z-index:100;
	 position:absolute;
	 color:#fff;
	 left:30%;
	 background:rgba(0,0,0,0.3);
	 float:left"
 }
  #div{
		border:1px solid red;
		border-radiu:5px;
	}
 
 	#fullToolbar div.edui_box{
		width:20px;height:20px;
		display:inline-block !important;
		background-image:url(<%=path%>/image/full_text.png)
	}
	.reportDes{
		margin-left:20px;
		martgin-top:20px;
	}
	.reportEmpName{
		font-size:14px;
		position:absolute;
		display:inline;
		bottom: 40px;
		right:50px;
	}
	.reportDate{
		font-size:14px;
		position:absolute;
		display:inline;
		bottom: 20px;
		right:50px;
	}
</style>
<script>
	edit_win = 'upd_win';
	edit_form = 'upd_form';
	add_win = 'add_win';
	add_form = 'add_form';
	datagrid ='datagrid';
	var sessionEmp = str2JsonStr("${session.employee}");
		sessionEmp.role = str2JsonStr("${session.employee.role}");
		sessionEmp.department = str2JsonStr("${session.employee.department}");
	function queryByWhe(){
		console.log($('#beginDate').datebox('getValue'))
		$("#datagrid").datagrid({
			queryParams: {
				beginDate:$('#beginDate').datebox('getValue'),
				endDate:$('#endDate').datebox('getValue'),
				empName:$('#empName').val()
			}
		})
	}
	function saveDiv(){
		
		console.log(text);
	}
	function addReport(url){
		var iframe = frames['full'];
		var htmlText= iframe.document.body.innerHTML;
		var textLength = iframe.document.body.innerText;
		if(textLength.length>100 || textLength.length<10){
			alert("字数超出100,请输入10-100字符的日志");
		}else{
			$("#reportDes").val(htmlText);
			$.post(url,$("#"+add_form).serialize(),
					function(data) {
						if(data.reqMsg!=null){
							if(data.reqMsg.code==200){
								$("#"+add_win).window("close");
								$("#"+add_form).form("clear");
								$("#"+datagrid).datagrid("reload");
							}else{
							}
							alertMsg(data.reqMsg.message);
						}
					},"json"		
			)
			$("#"+add_form).form("clear");
		}
	}
	function reportInfo(value,row,index){
		value = value.replace(/<.*?>/ig,"");
		if(value.length > 12){
			var a = "<a onclick = 'showReportInfo("+index+")' style='color:green'>查看详情</a>"
			return value.substr(0,12) + ".. " + a;
		}else{
			return value;
		}
	}
	function showReportInfo(index){
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var reportDay = dateFormat(row.reportday);
		$("#reportInfo_Win").window("open");
		$(".reportDes").html(row.des);
		$(".reportEmpName").text(row.empName);
		$(".reportDate").text(reportDay);
	}
	
	function showAdd(){
		var iframe = frames['full'];
		iframe.document.body.innerHTML ="";
		$("#"+add_win).window("open");
		
	}
	
	selectEmps("empIds","<%=path%>");
</script>

<title>工作日志</title>
</head>
<body id= "body">
	<table id="datagrid" class="easyui-datagrid" style="height:100%;" data-options="
		url:'report/pager',
		method:'get',
		autoRowHeight:true,
		rownumbers:true,
		collapsible:true,
		singleSelect:true,
		pagination:true,
		fit:true,
		fitColumns:true,<!-- 表格面积是否全部占满 -->
		toolbar:'#toolbar'
	">  
	    <thead>  
	        <tr>  
	            <th data-options="field:'empName',width:80" >员工名</th> 
	            <th data-options = "field:'depName',width:80" >部门名称</th>
	            <th data-options = "field:'reportday',width:80" formatter= "dateFormat" sortable="true">提交时间</th>
	            <th data-options="field:'des',width:80" formatter = "reportInfo">描述</th>  
	        </tr>  
	    </thead>  
	</table>  
	<!-- 工具 -->
	<div id="toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<div style="display: inline-block;" id="checkEmpName">员工姓名:<input id="empName" name="empName" /></div>
			<div style="display: inline-block;">开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date',formatter:myformatter,parser:myparser"></input></div>
			<div style="display: inline-block;">结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input></div>
			<a href="javascript:;" class= "easyui-linkbutton" onclick = "queryByWhe()">查询</a>
		</div>
		<div align="left">
	 		<a class= "easyui-linkbutton" iconCls="icon-add" onclick = "showAdd()">新增日志</a>
	 	</div>
	</div>
	
	<!-- 添加工作日志 -->
	<div id="add_win" class="easyui-window" title="工作日志" data-options="closed:true" style="width:550px;height:250px;padding:5px;">
				<h2>工作日志</h2>
				<form id="add_form" method="post">
					<input id="reportDes"    type="hidden" name="report.des" ></input>
		    	<table cellpadding="5">
		    		<tr>
		    			<td>今日工作日志:</td>
		    			<td>
		    			<!-- 富文本测试 开始 -->
		    				<div class= "outBox" style="width:400px;height:150px;">
								<div style="width:100%; height:22px;border-bottom:1px solid rgba(0,0,0,0.2)" id="fullToolbar" class= "innerBox" >
									<div class= "edui_box edui_default bold"  onclick="func('bold',false,null);"></div>
									<div class= "edui_box edui_default italic"  onclick="func('italic',false,null);"></div>
									<div class= "edui_box edui_default underline"  onclick="func('underline',false,null);"></div>
									<div class= "edui_box edui_default justifyleft"  onclick="func('justifyleft',false,null);"></div>
									<div class= "edui_box edui_default justifycenter"  onclick="func('justifycenter',false,null);"></div>
									<div class= "edui_box edui_default justifyright"  onclick="func('justifyright',false,null);"></div>
								</div>
								<div class= "innerBox iframe" style="width:100%;height:208px">
									<iframe style="border:0px" name="full" style="width:100%;height:100%;"></iframe>
								</div>
							</div>
							<script>
								$(function(){
									var iframe = frames['full'];
									iframe.document.designMode = "on";
								})
								
							</script>
						<!-- 富文本测试 结束 -->
		    			
		    			</td>
		    		</tr>
		    		<tr>
		    			<td><a class= "easyui-linkbutton" onclick = "addReport('<%=path%>/report/save')">提交</a></td>
		    		</tr>
		    	</table>
		    </form>
	</div>
	
	<!-- 日志信息页面 -->
	<div id="reportInfo_Win"  class="easyui-window" title="日志详情" data-options="closed:true" style="width:400px;height:350px;padding:5px;">
		<div class= "reportDes"></div>
		<div class= "reportEmpName"></div>
		<div class= "reportDate"></div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			var useRole = sessionEmp.role.name;
			if(useRole=="行政部主任"||useRole=="财务部主任"||useRole=="后勤部主任"||useRole=="教务部主任"||useRole=="招生部主任"||useRole=="总经理"){
			}else{
				$("#checkEmpName").remove();
			}
		})
		
	</script>
</body>
</html>