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
	//var json = '{"gradeInfo.gradeId":"_gradeid","gradeInfo.name":"_name","gradeInfo.empName1":"_empName1","gradeInfo.empName2":"_empName2","gradeInfo.empName3":"_empName3","gradeInfo.quantity":"_quantity","gradeInfo.des":"_des","gradeInfo.status":"_status"}';
	  var json = '{"stuFeedback.feedbackId":"_feedbackId","stuFeedback.des":"_des","stuFeedback.feedbackDay":"_feedbackDay","stuFeedback.status":"_status"}';
	$(function() {
		setPagination("list");
	});
	
	
	function showAddGradeWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditGradeWin(){
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				//var json1 = json.replace("_gradeid",row.gradeId).replace("_name",row.name).replace("_empName1",row.empName1).replace("_empName2",row.empName2).replace("_empName3",row.empName3).replace("_des",row.des).replace("_quantity",row.quantity).replace("_status",row.status);
			   	var json1 = json.replace("_des",row.des).replace("_feedbackId",row.feedbackId).replace("_feedbackDay",row.feedbackDay).replace("_status",row.status);
				$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
				$("#editWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的反馈","info");
		}
		
	}
	
	
	function addGrade() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/grade/gradeSave",
					$("#addForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#addWin").window("close"); // 关闭窗口
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
	

	
	function editGrade(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/stu/studentUpdate",
					$("#editForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#editWin").window("close"); // 关闭窗口
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
	var gradeId = "";
	function showFeedbackWin(){
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班级","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				gradeId = row.gradeId;
				$.get("<%=path %>/stuFeedback/stuFeedbackPager?gradeId=" + row.gradeId,
						function(data) {
						$("#list2").datagrid("loadData", data.rows);
					}, "json");
					$("#feedbackWin").window("open");
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
	
	
	
	
	function addstufeedback() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/stuFeedback/stuSave",
					$("#addForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#addWin").window("close"); // 关闭窗口
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
	
	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			alert(row.feedbackId);
			$.post("<%=path %>/stuFeedback/feedbackDisable?id=" + row.feedbackId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			alert(row.feedbackId);
			$.post("<%=path %>/stuFeedback/feedbackActivate?id=" + row.feedbackId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload'); // 重新加载数据表
			},"json");
		}
		
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
	
	
	function getStuName(value){  
		return value.name;
	}
	
	function showEmpName(value){
		return value.name;
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
	
	function editEmpfeedback(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/stuFeedback/stufeedbackUpdate",
					$("#editForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#editWin").window("close"); // 关闭窗口
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
	
</script>
</head>
<body id = "body">
		<table id = "list" class="easyui-datagrid" 
					data-options="toolbar:'#tb',singleSelect:true,
					collapsible:true,
					url:'<%=path %>/stuFeedback/queryByGradeId',
					method:'get',
					rownumbers:true,
					autoRowHeight:true,
					pagination:true,
					pageSize:20"
					style = "height:100%;"
			>
			<thead>
				<tr>
					<th data-options="field:'feedbackId',checkbox:true"></th>
					<th data-options="field:'feedbackDay',align:'center'" style="width:100px;" formatter="formatterDate">反馈时间</th>
					<th data-options="field:'des',align:'center'" style="width:120px;">反馈详情</th>
					<th data-options="field:'status',align:'center'" formatter="frozenActivate">状态</th>
					<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
				</tr>
			</thead>
		</table>
		<div style="" id = "tb">
				<a href="javascript:;" onclick = "showAddGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">添加</a>
				<a href="javascript:;" onclick = "showEditGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
	
	
	<div id="addWin" class="easyui-window" title="添加反馈" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:350px;height:280px;padding:5px;">
		<form id = "addForm">
			<table>
				<tr>
					<td><input id="add_stuId" type="hidden" name="stuFeedback.stuId" /></td>
				</tr>
				<tr>
					<td>反馈时间</td>
					<td><input class="easyui-datetimebox" name="stuFeedback.feedbackDay" data-options=""/></td>
				</tr>
			
				<tr>
					<td>反馈详情</td>
					<td><input class="easyui-textbox" name="stuFeedback.des" data-options="multiline:true" style = "height:60px;"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addstufeedback();"class="easyui-linkbutton" data-options="iconCls:'icon-add'"  style="width:70px;height:28px;">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	
	
	<div id="editWin" class="easyui-window" title="修改反馈" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;padding:5px;">
		<form id = "editForm">
			<table>
				<tr>
					<td><input type="hidden" name="stuFeedback.feedbackId" /></td>
				</tr>
				<tr>
					<td>反馈详情</td>
					<td><input class="easyui-validatebox easyui-textbox" name="stuFeedback.des" data-options="multiline:true" style="height:60px;"/></td>
				</tr>
				<tr>
					<td>反馈时间</td>
					<td><input class="easyui-validatebox easyui-datetimebox" name="stuFeedback.feedbackDay" /></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>
						<input type = "radio"  name="stuFeedback.status" value= "1"/>启用
						<input type = "radio"  name="stuFeedback.status" value= "0"/>禁用
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editEmpfeedback();" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:60px;height:25px">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	<div id="selectGradeWin" class="easyui-window" title="选择学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:500px;height:350px;padding:5px;">
		<table id = "list3" class="easyui-datagrid" 
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
					<th data-options="field:'name',align:'center'">学生名称</th>
				</tr>
			</thead>
		</table>
		<div id="tb2" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
					<a href="javascript:;" onclick = "submitGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
					<a href="javascript:;" onclick = "closeStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
			</div>
		</div>
	</div>
	
	
</body>
</html>