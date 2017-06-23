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
	
	
	var jsonStr = '{"student.stuId":"_stuId","student.stuNo":"_stuNo",' +
	'"student.name":"_name","student.pwd":"_pwd","student.idCard":"_idCard",'+
	'"student.phone":"_phone","student.qq":"_qq","student.weChat":"_weChat",' +
	'"student.school":"_school","student.age":"_age","student.birthday":"_birthday",'+
	'"student.gender":"_gender", "student.address":"_address","student.nation":"_nation",' +
	'"student.resIdence":"_resIdence","student.gradeId":"_gradeId","student.roomId":"_roomId",' +
	'"student.parentName":"_parentName", "student.parentPhone":"_praentPhone","student.startDay":"_startDay", ' +
	'"student.stuStatus":"_stuStatus", "student.des":"_des", "student.status":"_status","student.role":"_role","student.empId":"_empid"}';
	
	var sessionEmp = "<%=session.getAttribute("employee")%>";
	var empId = '';
	
	function originalJSONStr(array) {
		var jsonStr = '{';
		for (key in array) {
			jsonStr += '"' + key + '":"' + array[key] + '",'
		}
		jsonStr.substring(jsonStr.length - 2, jsonStr.length) + '}';
		return jsonStr;
	}
	
	function replaceJSONStr(array) {
		for (key in array) {
			jsonStr.replace(array[key]); // {'_stuId':row.stuId, '_stuNo':row.stuNo}
		}
	}
	
	function authority(methodName, jsonStr, method,index) {
		$.get("<%=path %>/aut/authority?methodName=" + methodName,
			function(data) {
				if (data.resu.request == "success") {
					if (method == "comitUpdatePay") {
						$("#purposePayForm").form("clear"); // 清除表单数据
						$("#purposePayWin").window("open"); // 打开窗口
					} else if (method == "comitOfficialPay") {
						$("#officialPayForm").form("clear"); // 清除表单数据
						$("#officialPayWin").window("open");
					}
				} else if (data.resu.request == "fail") {
					$.messager.alert("提示", data.resu.message, "error");
				}
			}, "json");
	}
	
	$(function() {
		setPagination("list");
		for(var i = 16; i <= 47; i++ ){
			empId += sessionEmp[i];
		}
		/* alert(originalJSONStr({'student.stuId':'_stuId','student.stuNo':'_stuNo','student.name':'_name','student.pwd':'_pwd'})); */
	});
	
	function showAddStudentWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditStudentWin(){
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = jsonStr.replace("_stuId", row.stuId).replace("_stuNo", row.stuNo).
				replace("_name", row.name).replace("_pwd", row.pwd).replace("_idCard", row.idCard).
				replace("_phone", row.phone).replace("_qq", row.qq).replace("_weChat", row.weChat).
				replace("_school", row.school).replace("_age", row.age).replace("_birthday", row.birthday).
				replace("_gender", row.gender).replace("_address", row.address).replace("_nation", row.nation).
				replace("_resIdence", row.resIdence).replace("_gradeId",row.gradeId).replace("_roomId",row.roomId).
				replace("_parentName",row.parentName).replace("_parentPhone",row.parentPhone).replace("_startDay",row.startDay).
				replace("_stuStatus",row.stuStatus).replace("_des",row.des).replace("_status",row.status).replace("_role",row.role).replace("_empid",row.empId);
				if(empId == row.emp.empId || row.empId == 'null' || '${sessionScore.employee.role.name == "总经理"}'){
					$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
					$("#editWin").window("open");
				}else{
					$.messager.alert("提示", "您没有权限", "error");
				}
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}
		
	}
	
	
	function addStudent() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/stu/stuPurposeSave",
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
	
	function editStudent(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/stu/stuPurposeUpdate",
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

	
	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			
			if(empId == row.emp.empId || row.empId == 'null'  || '${sessionScore.employee.role.name == "总经理"}'){
				$.post("<%=path %>/stu/stuPurposeDisable?id=" + row.stuId,
				function(data){
					$('#list').datagrid('reload');
				},"json");
			}else{
				$.messager.alert("提示", "您没有权限", "error");
			}
		}
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			if(empId == row.emp.empId || row.empId == 'null' || '${sessionScore.employee.role.name == "总经理"}'){
				$.post("<%=path %>/stu/stuPurposeActivate?id=" + row.stuId,
					function(data){
						$('#list').datagrid('reload'); // 重新加载数据表
				},"json");
			}else{
				$.messager.alert("提示", "您没有权限", "error");
			}
		}
	}
	
	var stuId = '';
	function showEditReservationsWin(){   // 显示转为预定学生窗口
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要转为预定的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				stuId = row.stuId;
				authority('com.oa.action.StudentAction.comitUpdatePay', "", "comitUpdatePay",'');
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要转为预定的学生","info");
		}
		
	}
	
	function showEditofficialWin(){   // 显示转为正式学生窗口
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要转为正式的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				stuId = row.stuId;
				authority('com.oa.action.StudentAction.comitOfficialPay', "", "comitOfficialPay",'');
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要转为正式的学生","info");
		}
		
	}
	function comitUpdatePay(){ // 提交预定学费，修改学生状态为预定
		if($("#purposePayWin").form("validate")){
			$.post("<%=path %>/stu/comitUpdatePay?stuId=" + stuId,
					$("#purposePayForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#purposePayWin").window("close"); // 关闭窗口
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
	
	function comitOfficialPay(){ //提交正式学费，修改学生状态为正式
		if($("#officialPayWin").form("validate")){
			$.post("<%=path %>/stu/comitOfficialPay?stuId=" + stuId,
					$("#officialPayForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#officialPayWin").window("close"); // 关闭窗口
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
	

	function queryByName(){
		var stuName = $('#stuName').textbox('getValue');
		var stuStatus = '意向';
	    if (stuName != "") {
	    	$.get("<%=path %>/stu/pagerByStuName?stuName=" + stuName + "&stuStatus="+stuStatus,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
							$.messager.alert("提示",data.resu.message,"info");
						}else{
							$.messager.alert("提示",data.resu.message,"info");
						}
						
				}, "json");
	    } else {
	    	$.post("<%=path %>/stu/stuPurposePager",
					function(data){
						$('#list').datagrid('reload'); // 重新加载数据表
				},"json");
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
	function showName(value){
		if(value == null){
			return "暂无";
		}else{
			return value.name;
		}
		
	}
</script>
</head>
<body id = "body">
	<table id = "list"class="easyui-datagrid" 
			data-options="toolbar:'#tb',singleSelect:true,
			collapsible:true,
			url:'<%=path %>/stu/stuPurposePager',
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
				<th data-options="field:'name',align:'center'">名称</th>
				<th data-options="field:'idCard',align:'center'">身份证</th>
				<th data-options="field:'phone',align:'center'">手机号</th>
				<th data-options="field:'qq',align:'center'">qq</th>
				<th data-options="field:'weChat',align:'center'">微信</th>
				<th data-options="field:'school',align:'center'">毕业学校</th>
				<th data-options="field:'age',align:'center'">年龄</th>
				<th data-options="field:'birthday',align:'center'" formatter="formatterDate">生日</th>
				<th data-options="field:'gender',align:'center'">性别</th>
				<th data-options="field:'address',align:'center'">地址</th>
				<th data-options="field:'nation',align:'center'">籍贯</th>
				<th data-options="field:'residence',align:'center'">户口性质</th>
				<th data-options="field:'emp',align:'center',width:80" formatter = "showName">招生老师</th>
				<th data-options="field:'stuStatus',align:'center'">学生状态</th>
				<th data-options="field:'status',align:'center'"  formatter="frozenActivate">状态</th>
				<th data-options="field:'des',align:'center'">描述</th>
				<th data-options="field:'parentPhone',align:'center'">家长手机号</th>
				<th data-options="field:'parentName',align:'center'">家长名称</th>
				<th data-options="field:'caozuo',align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "showAddStudentWin()"class="easyui-linkbutton" iconCls="icon-add" >添加</a>
				<a href="javascript:;" onclick = "showEditStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
				<a href="javascript:;" onclick = "showEditReservationsWin()" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:110px">转为预定学生</a>
				<a href="javascript:;" onclick = "showEditofficialWin()" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:110px">转为正式学生</a>
		</div>
		<div>
			学生姓名: <input class="easyui-textbox" id = "stuName"style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	<div id="addWin" class="easyui-window" title="添加意向学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:380px;height:250px;padding:5px;">
		<form id = "addForm">
			<table>

				<tr>
					<td>学生姓名</td>
					<td><input class="easyui-validatebox textbox" name="student.name" data-options="required:true,validType:'length[2,10]'"/></td>
				</tr>
				<tr>
					<td>手机号</td>
					<td><input class="easyui-validatebox textbox"  name="student.phone" data-options = "required:true,validType:'length[11,11]'" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td>
						<input type = "radio"  name="student.gender" value= "男"/>男
						<input type = "radio"  name="student.gender" value= "女"/>女
					</td>
					
				</tr>
				<tr>
					<td>微信</td>
					<td><input class="easyui-validatebox textbox" name="student.weChat" /></td>
				</tr>
				<tr>
					<td>毕业学校</td>
					<td><input class="easyui-validatebox textbox" name="student.school" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>qq</td>
					<td><input class="easyui-validatebox textbox"  name="student.qq" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input class="easyui-validatebox textbox" name="student.age" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addStudent();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	<div id="editWin" class="easyui-window" title="修改意向学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:380px;height:250px;padding:5px;">
		<form id = "editForm">
			<table>
			<tr><td><input type="hidden" name = "student.stuId"/></td></tr>
			<tr><td><input type="hidden" name = "student.empId"/></td></tr>
				<tr>
					<td>学生姓名</td>
					<td><input class="easyui-validatebox textbox" name="student.name" data-options="required:true,validType:'length[2,10]'"/></td>
				</tr>
				<tr>
					<td>手机号</td>
					<td><input class="easyui-validatebox textbox"  name="student.phone" data-options = "required:true,validType:'length[11,11]'" /></td>
				</tr>
				<tr>
					<td>毕业学校</td>
					<td><input class="easyui-validatebox textbox" name="student.school" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td>
						<input type = "radio"  name="student.gender" value= "男"/>男
						<input type = "radio"  name="student.gender" value= "女"/>女
					</td>
				</tr>
				
				<tr>
					<td>状态</td>
					<td>
						<input type = "radio"  name="student.status" value= "0"/>禁用
						<input type = "radio"  name="student.status" value= "1"/>启用
					</td>
					
				</tr>
				<tr>
					<td>qq</td>
					<td><input class="easyui-validatebox textbox"  name="student.qq" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input class="easyui-validatebox textbox" name="student.age" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>微信</td>
					<td><input class="easyui-validatebox textbox" name="student.weChat" /></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editStudent();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	<div id="purposePayWin" class="easyui-window" title="转为预定学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:230px;height:150px;padding:5px;">
		<form id = "purposePayForm">
			<table>
				<tr>
					<td>请交转为预定学生的费用。报名费用为300</td>
				</tr>
				<tr>
					<td><input class="easyui-validatebox textbox" name="reserveMoney" style = "height:30px;"  data-options = "required:true" /></td>
				</tr>
			
				<tr>
					<td>
						<a href="javascript:;" onclick="comitUpdatePay();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			
			
			</table>
		</form>	
	</div>
	
	<div id="officialPayWin" class="easyui-window" title="转为正式学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:230px;height:150px;padding:5px;">
		<form id = "officialPayForm">
			<table>
				<tr>
					<td>请交转为正式学生的费用。报名费用为6000</td>
				</tr>
				<tr>
					<td><input class="easyui-validatebox textbox" name="officialMoney" style = "height:30px;"  data-options = "required:true" /></td>
				</tr>
			
				<tr>
					<td>
						<a href="javascript:;" onclick="comitOfficialPay();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			
			
			</table>
		</form>	
	</div>
</body>
</html>