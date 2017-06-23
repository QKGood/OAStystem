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
<script type="text/javascript" src="<%=path %>/js/jquery.form.js"></script>

<script>
	var json = '{"gradeInfo.gradeId":"_gradeid","gradeInfo.name":"_name","gradeInfo.empName1":"_empName1","gradeInfo.empName2":"_empName2","gradeInfo.empName3":"_empName3","gradeInfo.quantity":"_quantity","gradeInfo.des":"_des","gradeInfo.status":"_status"}';
	$(function() {
		setPagination("list");
	});
	
	function authority(methodName, jsonStr, method,index) {
		$.get("<%=path %>/aut/authority?methodName=" + methodName,
			function(data) {
				if (data.resu.request == "success") {
					if (method == "outto") {
						var grid = $('#list2');  // 获取datagrid
						var options = grid.datagrid('getPager').data("pagination").options;  // 获取数据
						var curr = options.pageNumber;  // 获取当前第几页
						var total = options.total;  // 获取总页数
						$.get("<%=path %>/score/exportData?curr=" + curr + "&total1=" + total + "&gradeId=" + gradeId + "&gradeName="+gradeName,
									function(data) {
										if (data.resu.request == "success") {
											$.messager.alert("提示", data.resu.message, "info");
										} else if (data.resu.request == "fail") {
											$.messager.alert("提示", data.resu.message, "error");
										}
								}, "json");
						
						
					} else if (method == "into") {
						var file = $("#file").filebox('getValue');
						if (file != null && file != "") {
							 // 判断是否是Excel格式
				            var reg = /^.*\.(?:xls|xlsx)$/i;//文件名可以带空格
				            if (reg.test(file)) {
				    			$('#importForm').ajaxSubmit({
				                		url: '<%=path%>/score/importData',
				                 		type: 'post',
				                        dataType: 'json',
				                        beforeSend: function () {
				                        },
				                        success: function (data) {
				                        	if (data.resu.request == "success") {
				                              	$("#list2").datagrid("reload"); // 更新表格
				                               	$.messager.alert("提示", data.resu.message, "info");
				                             } else {
				                                $.messager.alert("提示", data.resu.message, "error");
				                             }
				                       },
				                        complete: function () {
				                       	}
				    			 });
				            } else {
				            	$.messager.alert("提示", "请上传Excel格式的文件", "error");
				            }
							
						} else {
							$.messager.alert("提示", "请选择你要导入的文件", "error");
						}
					}
				} else if (data.resu.request == "fail") {
					$.messager.alert("提示", data.resu.message, "error");
				}
			}, "json");
	}	
	
	
	function showIntoWin(){
		authority('com.oa.action.ScoreAction.scoreInto', '', "into",'');
	}
	
	
	var gradeId = ""
	var gradeName = "";
	function showStuWin(){ // 某个班级下的所有学生成绩
				var rows = $("#list").datagrid("getSelections");
				if(rows.length  > 1 ){
					$.messager.alert("提示","请选择一个班级","info");
				}else if(rows.length == 1){
					var row = rows[0];
					if(row){
						gradeId = row.gradeId;
						gradeName = row.name;
						$.get("<%=path %>/score/gradeByPager?gradeId=" + row.gradeId,
								function(data) {
								$("#list2").datagrid("loadData", data.rows);
							}, "json");
							$("#selectGradeWin").window("open");
					}
				}else if(rows.length == 0){
					$.messager.alert("提示","请选择一个班级","info");
				}
		}
	
	
	
	
	function queryByName(){ // 根据班级名称查询
		var stuName = $('#gradeName').textbox('getValue');
	    if (stuName != "") {
	    	$.get("<%=path %>/score/pagerBy?gradeName=" + stuName,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list2").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
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
	
	function queryByCourse(){ // 根据课程名称查询
		var stuName = $('#course').textbox('getValue');
	    if (stuName != "") {
	    	$.get("<%=path %>/score/pagerByCourse?course=" + stuName,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list2").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
							$.messager.alert("提示",data.resu.message,"info");
						}else{
							$.messager.alert("提示",data.resu.message,"info");
						}
						
				}, "json");
	    } else {
	    	$.get("<%=path %>/score/gradeByPager?gradeId=" + gradeId,
					function(data) {
					$("#list2").datagrid("loadData", data.rows);
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
	
	
	function outExcel() {
		authority('com.oa.action.ScoreAction.scoreOutto', '', "outto",'');
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
			
				<a href="javascript:;" onclick = "showStuWin()" class="easyui-linkbutton" iconCls="icon-edit">学生成绩</a>
		</div>
		<div>
			班级名称: <input class="easyui-textbox" id = "gradeName"style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<div id="editWin" class="easyui-window" title="修改班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;padding:5px;">
		
	</div>
	
	<div id="addWin" class="easyui-window" title="修改班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;padding:5px;">
		
	</div>
	
	<div id="selectGradeWin" class="easyui-window" title="查看学生成绩" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:400px;padding:5px;">
		<table id="list2" class="easyui-datagrid"
			data-options="singleSelect:false,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20,
			toolbar:'#tb1'" style="height:100%;">
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
		<div id = "tb1">
				<form id="importForm" enctype="multipart/form-data">
					<a href="javascript:;" onclick="showIntoWin()" class="easyui-linkbutton" iconCls="icon-redo" plain="true">导入成绩</a>
					<input class="easyui-filebox" id="file" name="file" data-options="prompt:'请选择文件',buttonText:'选择文件'" style="width:250;">
					<a href="javascript:;" onclick = "outExcel()" class="easyui-linkbutton" >导出成绩</a>
				</form>
			<div>			
			课程名称: <input class="easyui-textbox" id = "course"style="width:80px">
				<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByCourse()" iconCls="icon-search">搜索</a>
			</div>
		</div>
	</div>
	<iframe id="download" name="download" height="0px" width="0px"></iframe>
</body>
</html>