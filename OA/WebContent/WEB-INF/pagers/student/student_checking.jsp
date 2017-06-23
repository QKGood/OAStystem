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
	var json = '{"stuChecking.checkingId":"_checkingid","stuChecking.stuId":"_stuId","stuChecking.checkingDay":"_checkingDay","stuChecking.checking1":"_checking1","stuChecking.checking2":"_checking2","stuChecking.checking3":"_checking3","stuChecking.stu.name":"_stuName"}';
	$(function() {
		setPagination("list");
	});
	
	
	var gradeId = "";
	
	function getGradeId(gradeId){
		$.get("<%=path %>/stuChecking/gradeByPager?gradeId=" + gradeId,
				function(data) {
				$("#list2").datagrid("loadData", data.rows);
			}, "json");
	}
	
	
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
					}
				} else if (data.resu.request == "fail") {
					$.messager.alert("提示", data.resu.message, "error");
				}
			}, "json");
	}	
	
	function showAddWin(){
		authority('com.oa.action.StudentCheckingAction.addChecking', "", "add",'');
	}
	
	function addChecking() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/stuChecking/addChecking",
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
	
	function showCheckingWin(){
		var rows = $("#list2").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = json.replace("_checkingid",row.checkingId).replace("_stuId",row.stuId).replace("_checkingDay",row.checkingDay).replace("_checking1",row.checking1).replace("_checking2",row.checking2).replace("_checking3",row.checking3).replace("_stuName",row.stu.name);
				authority('com.oa.action.StudentCheckingAction.updateChecking', json1, "edit",'');
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的考勤","info");
		}
		
	}
	
	

	

	
	function editChecking(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/stuChecking/updateChecking",
					$("#editForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#editWin").window("close"); // 关闭窗口
						getGradeId(gradeId);
						$.messager.alert("提示",data.resu.message,"info");
					}else if(data.resu.reuqest == "fail"){
						$.messager.alert("提示",data.resu.message,"info");
					}
			},"json");
		}else{
			$.messager.alert("提示","请输人正确的数据","info");
		}
	
	}

	function showStuWin(){ // 某个班级下的所有考勤信息
			var rows = $("#list").datagrid("getSelections");
			if(rows.length  > 1 ){
				$.messager.alert("提示","请选择一个班级","info");
			}else if(rows.length == 1){
				var row = rows[0];
				if(row){
					
					gradeId = row.gradeId;
					getGradeId(gradeId);
						$("#selectCheckingWin").window("open");
				}
			}else if(rows.length == 0){
				$.messager.alert("提示","请选择一个班级","info");
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
	

	function selectGrade(){  // 选择班级
		$.get("<%=path %>/grade/gradePager", function(data) {
			$("#list3").datagrid("loadData", data.rows);
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
		var rows = $("#list3").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班级","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$.get("<%=path %>/stu/stuGradeById?gradeId=" + row.gradeId,
					function(data) {
					$("#list4").datagrid("loadData", data.rows);
				}, "json");
				$("#selectGradeWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个班级","info");
		}
		
	}
	
	function submitGradeWin(){ // 选择完宿舍长
		var rows = $("#list4").datagrid("getSelections");
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
					<a href="javascript:;" onclick = "showAddWin()"class="easyui-linkbutton" iconCls="icon-add" >添加</a>
				<a href="javascript:;" onclick = "showStuWin()" class="easyui-linkbutton" iconCls="icon-edit">学生考勤</a>
		</div>
		<div>
			班级名称: <input class="easyui-textbox" id = "gradeName"style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
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
					<td>上午</td>
					<td>
						<select name="stuChecking.checking1" style="width:170px">
							<option value="正常">正常</option>
	   						<option value="迟到">迟到</option>
	   			 			<option value="旷课">旷课</option>
	   			 			<option value="请假">请假</option>
   			 				<option value="早退">早退</option>
   			 				<option value="缺勤">缺勤</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<td>中午</td>
					<td>
						<select name="stuChecking.checking2" style="width:170px">
							<option value="正常">正常</option>
	   						<option value="迟到">迟到</option>
	   			 			<option value="旷课">旷课</option>
	   			 			<option value="请假">请假</option>
   			 				<option value="早退">早退</option>
   			 				<option value="缺勤">缺勤</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>下午</td>
					<td>
						<select name="stuChecking.checking3" style="width:170px">
							<option value="正常">正常</option>
	   						<option value="迟到">迟到</option>
	   			 			<option value="旷课">旷课</option>
	   			 			<option value="请假">请假</option>
   			 				<option value="早退">早退</option>
   			 				<option value="缺勤">缺勤</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>考勤时间</td>
					<td><input class="easyui-datetimebox" name="stuChecking.checkingDay" /></td>
				</tr>	
				<tr>
					<td>
						<a href="javascript:;" onclick="addChecking();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	<div id="editWin" class="easyui-window" title="修改考勤" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;padding:5px;">
		<form id = "editForm">
				<table>
					<tr><td><input type="hidden" name = "stuChecking.stuId" /></td></tr>
					<tr><td><input type="hidden" name = "stuChecking.checkingId" /></td></tr>
				<tr>
					<td>学生名字</td>
					<td><input class="easyui-validatebox textbox"  name="stuChecking.stu.name" data-options="required:true,'disabled':true"/></td>
				</tr>
				<tr>
					<td>上午</td>
					<td>
						<select name="stuChecking.checking1" style="width:170px">
							<option value="正常">正常</option>
	   						<option value="迟到">迟到</option>
	   			 			<option value="旷课">旷课</option>
	   			 			<option value="请假">请假</option>
   			 				<option value="早退">早退</option>
   			 				<option value="缺勤">缺勤</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<td>中午</td>
					<td>
						<select name="stuChecking.checking2" style="width:170px">
							<option value="正常">正常</option>
	   						<option value="迟到">迟到</option>
	   			 			<option value="旷课">旷课</option>
	   			 			<option value="请假">请假</option>
   			 				<option value="早退">早退</option>
   			 				<option value="缺勤">缺勤</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>下午</td>
					<td>
						<select name="stuChecking.checking3" style="width:170px">
							<option value="正常">正常</option>
	   						<option value="迟到">迟到</option>
	   			 			<option value="旷课">旷课</option>
	   			 			<option value="请假">请假</option>
   			 				<option value="早退">早退</option>
   			 				<option value="缺勤">缺勤</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>考勤时间</td>
					<td><input class="easyui-datetimebox" name="stuChecking.checkingDay" /></td>
				</tr>	
				<tr>
					<td>
						<a href="javascript:;" onclick="editChecking();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	<div id="selectCheckingWin" class="easyui-window" title="查看学生考勤" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
		<table id="list2" class="easyui-datagrid"
			data-options="singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20,
			toolbar:'#tb2'" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'checkingId',checkbox:true">编号</th>
				<th data-options="field:'stu',width:100" formatter="showName">学生姓名</th>
				<th data-options="field:'checking1',width:100">上午</th>
				<th data-options="field:'checking2',width:80">中午</th>
				<th data-options="field:'checking3',width:80">下午</th>
				<th data-options="field:'checkingDay',width:120" formatter="formatterDate">考勤时间</th>
			</tr>
		</thead>
		
	</table>
	<div id="tb2" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "showCheckingWin()"class="easyui-linkbutton" iconCls="icon-add" >编辑</a>
		</div>
	</div>
	</div>
			<div id="selectWin" class="easyui-window" title="选择班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
		<table id = "list3"class="easyui-datagrid" 
			data-options="toolbar:'#tb3',singleSelect:true,
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
	<div id="tb3" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "openGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				<a href="javascript:;" onclick = "closeGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
		</div>
	</div>
	</div>
	<div id="selectGradeWin" class="easyui-window" title="选择学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:500px;height:350px;padding:5px;">
		<table id = "list4"class="easyui-datagrid" 
			data-options="toolbar:'#tb4',singleSelect:true,
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
		<div id="tb4" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
					<a href="javascript:;" onclick = "submitGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
					<a href="javascript:;" onclick = "closeStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
			</div>
		</div>
	</div>
</body>
</html>