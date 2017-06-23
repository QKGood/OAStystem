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
	$(function() {
		setPagination("list");
	});
	
	

	

	

	
	

	
	
	function queryByCourse(){ // 根据课程名称查询
		var stuName = $('#course').textbox('getValue');
	    if (stuName != "") {
	    	$.get("<%=path %>/score/pagerByCourse?course=" + stuName,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
							$.messager.alert("提示",data.resu.message,"info");
						}else{
							$.messager.alert("提示",data.resu.message,"info");
						}
						
				}, "json");
	    } else {
	    	$.get("<%=path %>/score/queryByGradeId",
					function(data) {
					$("#list").datagrid("loadData", data.rows);
				}, "json");
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
	<table id="list" class="easyui-datagrid"
			data-options="singleSelect:true,
			url:'<%=path %>/score/queryByGradeId',
			method:'get',
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20,
			toolbar:'#tb'" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'scoreId',checkbox:true">编号</th>
				<th data-options="field:'stu',width:100" formatter="showName">学生姓名</th>
				<th data-options="field:'course',width:100" formatter="showName">课程</th>
				<th data-options="field:'score',width:80">成绩</th>
				<th data-options="field:'testDay',width:120" formatter="formatterDate">考试时间</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div>			
			课程名称: <input class="easyui-textbox" id = "course"style="width:80px">
				<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByCourse()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	
</body>
</html>