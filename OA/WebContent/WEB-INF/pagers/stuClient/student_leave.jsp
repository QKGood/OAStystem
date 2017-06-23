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
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>

<script>
	var json = '{"gradeInfo.gradeId":"_gradeid","gradeInfo.name":"_name","gradeInfo.empName1":"_empName1","gradeInfo.empName2":"_empName2","gradeInfo.empName3":"_empName3","gradeInfo.quantity":"_quantity","gradeInfo.des":"_des","gradeInfo.status":"_status"}';
	
	var pass = ''
	$(function() {
		setPagination("list");
		
	});
	
	
	function showLeaveWin(){
		$("#leaveForm").form("clear");
		$("#leaveWin").window("open");
	}
	
	
	
	function addLeave(){
		if($("#leaveForm").form("validate")){
			$.post("<%=path %>/stuLeave/save",
					$("#leaveForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#leaveWin").window("close"); // 关闭窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示",data.resu.message,"info");
					}else if(data.resu.reuqest == "fail"){
						$.messager.alert("提示",data.resu.message,"info");
					}
			},"json");
		}else{
			$.messager.alert("提示","请输人正确的数据","info");
		}
	}

	function showStuWin(){ // 某个班级下的所有请假信息
			var rows = $("#list").datagrid("getSelections");
			if(rows.length  > 1 ){
				$.messager.alert("提示","请选择一个班级","info");
			}else if(rows.length == 1){
				var row = rows[0];
				if(row){
					$.get("<%=path %>/stuLeave/gradeByPager?gradeId=" + row.gradeId,
							function(data) {
							$("#list2").datagrid("loadData", data.rows);
						}, "json");
						$("#selectGradeWin").window("open");
				}
			}else if(rows.length == 0){
				$.messager.alert("提示","请选择一个班级","info");
			}
	}

	function queryLeaveWin(){
		pass = "0"
			$.get("<%=path %>/stuLeave/queryByLeaveId?pass=" + pass,
					function(data) {
					$("#list").datagrid("loadData", data.rows);
				}, "json");
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
	
	function showPass(value) {
		if(value == 0){
			return "未通过";
		}else if(value == 1){
			return "通过";
		}
		
	}
	function showLeave(value) {
		if(value == 0){
			return "待审核";
		}else if(value == 1){
			return "已审核";
		}
		
	}
	function refreshWin(){
		pass = "1"
		$.get("<%=path %>/stuLeave/queryByLeaveId?pass=" + pass,
				function(data) {
				$("#list").datagrid("loadData", data.rows);
			}, "json");
	}
</script>
</head>
<body id = "body">
		<table id="list" class="easyui-datagrid"
			data-options="singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20,
			toolbar:'#tb'" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'leaveId',checkbox:true">编号</th>
				<th data-options="field:'stu',align:'center'" formatter="showName">姓名</th>
				<th data-options="field:'startTime',width:150,align:'center'" formatter="formatterDate">申请时间</th>
				<th data-options="field:'endTime',width:150,align:'center'" formatter="formatterDate">结束时间</th>
				<th data-options="field:'des',width:200,align:'center'">请假说明</th>
				<th data-options="field:'firLevel',align:'center'" formatter = "showLeave">任课老师审核</th>
				<th data-options="field:'secondLevel',align:'center'" formatter = "showLeave">班主任审核</th>
				<th data-options="field:'pass',align:'center'" formatter = "showPass">审核进度</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick = "showLeaveWin()" class="easyui-linkbutton" iconCls="icon-edit">请假申请</a>
			<a href="javascript:;" onclick = "queryLeaveWin()" class="easyui-linkbutton" iconCls="icon-edit">未通过请假</a>
			<a href="javascript:;" onclick = "refreshWin()" class="easyui-linkbutton" iconCls="icon-edit">已通过请假</a>
		</div>
		<div>
			名称: <input class="easyui-textbox" id = "gradeName"style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<div id="leaveWin" class="easyui-window" title="请假申请" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:200px;padding:5px;">
		<form id = "leaveForm">
			<table>
				<tr>
		    		<td>请假起止时间:</td>
		    		<td><input id="startDate"class="easyui-datetimebox" name="stuLeave.startTime"  data-options="validType:'date' , required:true,missingMessage:'请输选择请假开始时间',invalidMessage:'日期格式出错,请选择正确的格式', formatter:myformatter1,parser:myparser1"></input></td>
		    		<td><input id="endDate"class="easyui-datetimebox" name="stuLeave.endTime"  data-options="validType:'date' ,required:true,missingMessage:'请输选择请假结束时间',invalidMessage:'日期格式出错,请选择正确的格式', formatter:myformatter1,parser:myparser1"></input></td>
		    	</tr>
		    	<tr>
		    		<td>请假原由:</td>
		    		<td><input class="easyui-textbox" type="text" name="stuLeave.des" data-options="required:true,validType:'length[3,255]', required:true,missingMessage:'请填写请假原由',invalidMessage:'字数应在10-255字符以内'"></input></td>
		    	</tr>
		    	<tr>
		    		<td><a class= "easyui-linkbutton" onclick ="addLeave()">提交</a></td>
		    	</tr>
			</table>
		</form>	
	</div>
	
</body>
</html>