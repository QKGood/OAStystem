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
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
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

</style>
<script>
	edit_win = 'upd_win';
	edit_form = 'upd_form';
	add_win = 'add_win';
	add_form = 'add_form';
	datagrid ='datagrid';

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

	selectEmps("empIds","<%=path%>");
</script>

<title>Insert title here</title>
</head>
<body id= "body">
	<table id="datagrid" class="easyui-datagrid"  data-options="
		url:'report/pager',
		method:'get',
		autoRowHeight:true,
		pagination:true,
		toolbar:'#toolbar'
	">  
	    <thead>  
	        <tr>  
	            <th data-options="field:'depId',hidden:true" ></th> 
	            <th data-options="field:'empId',hidden:true" ></th> 
	            <th data-options="field:'reportId',hidden:true" ></th> 
	            <th data-options="field:'empName',width:80" >员工名</th> 
	            <th data-options = "field:'depName',width:80" >部门名称</th>
	            <th data-options = "field:'reportday',width:80" formatter= "dateFormat">提交时间</th>
	            <th data-options="field:'des',width:80">描述</th>  
	        </tr>  
	    </thead>  
	</table>  
	<!-- 工具 -->
	<div id="toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<div style="display: inline-block;">员工姓名:<input id="empName" name="empName" /></div>
			<div style="display: inline-block;">开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date',formatter:myformatter,parser:myparser"></input></div>
			<div style="display: inline-block;">结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input></div>
			<a href="javascript:;" class= "easyui-linkbutton" onclick = "queryByWhe()">查询</a>
		</div>
		<div align="left">
	 		<a class= "easyui-linkbutton" iconCls="icon-add" onclick = "showAdd()">新增日志</a>
	 	</div>
	</div>
	
	<!-- 添加工作日志 -->
	<div id="add_win" class="easyui-window" title="工作日志" data-options="closed:true" style="width:500px;height:200px;padding:5px;">
				<h2>工作日志</h2>
				<form id="add_form" method="post">
		    	<table cellpadding="5">
		    		<tr>
		    			<td>今日工作日志:</td>
		    			<td><input class="easyui-textbox" type="text" name="report.des" data-options="required:true,validType:'length[10,255]', required:true,missingMessage:'请填写今日工作日志',invalidMessage:'字数应在10-255字符以内'"></input></td>
		    		</tr>
		    		<tr>
		    			<td><a class= "easyui-linkbutton" onclick = "add('<%=path%>/report/save')">提交</td>
		    		</tr>
		    	</table>
		    </form>
	</div>
</body>
</html>