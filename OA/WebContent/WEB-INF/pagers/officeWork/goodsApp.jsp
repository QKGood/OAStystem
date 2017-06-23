<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ taglib prefix="s" uri="/struts-tags" %>
    
    <%
    	String path = request.getContextPath();
    %>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物品申购 	XMF</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script type="text/javascript">

	var jsonStr = '{"goodsApp.goodsAppId":"_goodsAppId","goodsApp.appDay":"_appDay"'
		+ ',"goodsApp.empName":"_empName","goodsApp.empId":"_empId","goodsApp.price":"_price"'
		+ ',"goodsApp.goodsName":"_goodsName","goodsApp.quantity":"_quantity","goodsApp.goodsTypeName":"_goodsTypeName"' 
		+ ',"goodsApp.des":"_des","goodsApp.status":"_status","goodsApp.appStatus":"_appStatus","goodsApp.goodsTypeId":"_goodsTypeId"}';
			
	var sessionEmp = "<%=session.getAttribute("employee") %>";
	var empId = '';
			
	function authority(methodName, jsonStr, method,index) {
		$.get("<%=path %>/aut/authority?methodName=" + methodName,
			function(data) {
				if (data.resu.request == "success") {
					if (method == "save") {
						$("#addForm").form("clear"); // 清除表单的内容
						$("#addWin").window("open"); // 打开窗口
					}else if(method == "disable"){
						var row = $('#list').datagrid('getData').rows[index];
						if(row){
							$.post("<%=path%>/goodsApp/gtDisable?gId=" + row.goodsAppId,
								function(data){
									$('#list').datagrid('reload');
							},"json");
						}
					}else if(method == "activate"){
						var row = $('#list').datagrid('getData').rows[index];
						if(row){
							$.post("<%=path%>/goodsApp/gtActivate?gId=" + row.goodsAppId,
								function(data){
									$('#list').datagrid('reload'); // 重新加载数据表
							},"json");
						}
					}else if(method == "appActivate"){
						var row = $('#list').datagrid('getData').rows[index];
						if(row){
							$.post("<%=path%>/goodsApp/gaActivate?gId=" + row.goodsAppId 
									+ "&gName=" + row.goodsName + "&quantity=" + row.quantity,
								function(data){
									$('#list').datagrid('reload'); // 重新加载数据表
							},"json");
						}
					}else if(method == "appDisable"){
						var row = $('#list').datagrid('getData').rows[index];
						if(row){
							$.post("<%=path%>/goodsApp/gaDisable?gId=" + row.goodsAppId,
								function(data){
									$('#list').datagrid('reload');
							},"json");
						}
					}
				} else if (data.resu.request == "fail") {
					$.messager.alert("提示", data.resu.message, "error");
				}
			}, "json");
	}

	$(function() {
		setPagination("list");
		for (var i = 16; i <= 47; i++) {
			empId += sessionEmp[i];
		}
	});

	function showAddGoodsAppWin() {
		authority('com.oa.action.GoodsAppAction.saveGoodsApp', "", "save",'');
		$("#addForm").form("clear"); // 清除表单里的所有数据
		$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		$.get("<%=path%>/goodsType/comboBox",function(data){
			$("#type").combobox("loadData", data.results);
		}, "json");
	}

	function addGoodsApp() {
		if ($("#addForm").form("validate")) {
			$.post("<%=path%>/goodsApp/saveGoodsApp", $("#addForm").serialize(),
					function(data) {
						if (data.regoodsApp.request == "success") {
							$("#addWin").window("close"); // 关闭指定的窗口
							$("#list").datagrid("reload"); // 重新加载指定数据网格数据
							$.messager.alert("提示", data.regoodsApp.message,"info");
						} else if (data.regoodsApp.request == "fail") {
							$.messager.alert("提示", data.regoodsApp.message,"info");
						}
					}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的数据", "info");
		}
	}

	function showEditGoodsAppWin() {
		// var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if (rows.length > 1) {
			$.messager.alert("提示", "请先选择一个需要修改的物品", "info");
		} else if (rows.length == 1) {
			var row = rows[0];
			if (row) { // 有选中的行
				var jsonStr1 = jsonStr.replace("_goodsAppId", row.goodsAppId).replace("_appDay",row.appDay)
					.replace("_empName", row.empName).replace("_empId", row.empId)
					.replace("_goodsName", row.goodsName).replace("_quantity", row.quantity)
					.replace("_des", row.des).replace("_status", row.status)
					.replace("_appStatus", row.appStatus).replace("_price",row.price);
				if(empId == row.emp.empId  || '${sessionScore.employee.role.name == "总经理"}'){
					$("#editForm").form("load", JSON.parse(jsonStr1));
					$("#editWin").window("open");
				}else{
					$.messager.alert("提示", "您没有权限", "error");
				 }
			}
		} else if (rows.length == 0) {
			$.messager.alert("提示", "请先选择一个需要修改的物品", "info");
		}
	}
	function editGoodsApp(index) {
		if ($("#editForm").form("validate")) {
			var row = "";
			if (index != null) {
				row = $('#list').datagrid('getData').rows[index];
			}
			row = $('#list').datagrid('getSelected');
			$.post("<%=path%>/goodsApp/updateGoodsApp?gId=" + row.goodsAppId,
				$("#editForm").serialize(), function(data) {
					if (data.regoodsApp.request == "success") {
						$("#editWin").window("close"); // 关闭指定的窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示", data.regoodsApp.message, "info");
					} else if (data.regoodsApp.request == "fail") {
						$.messager.alert("提示", data.regoodsApp.message, "info");
					}
				}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的表单数据", "info");
		}
	}
	
		
	function disable(index) { //冻结
		authority('com.oa.action.GoodsAppAction.gtDisable', "", "disable",index);
	}

	function activate(index) { // 激活
		authority('com.oa.action.GoodsAppAction.gtActivate', "", "activate",index);
	}

	function frozenActivate(value, row, index) { // 显示状态为可用或不可用
		if (value == 1) {
			status = 1;
			return "可用";
		} else if (value == 0) {
			status = 0;
			return "不可用";
		}
	}
	function Emp_Name(value){
		if(value == null){
			return "暂无";
		}else{
			return value.name;
		}
		
	}
	
	function formatterOpt(value, row, index) { // 操作栏
		var status = row.status;
		if (status == 1) {
			return "<a href = 'javascript:;'onclick = 'disable(" + index + ")'>冻结</a>";
		} else if (status == 0) {
			return "<a href = 'javascript:;'onclick = 'activate(" + index + ")'>激活</a>";
		}
	}
	
	function appSActivate(value, row, index) { // 显示状态为可用或不可用
		if (value == 1) {
			appStatus = 1;
			return "已同意";
		} else if (value == 0) {
			appStatus = 0;
			return "审核中";
		} else if(value == 2) {
			appStatus = 2;
			return "已拒绝";
		}
	}
	
	function disableApp(index) { //拒绝
		authority('com.oa.action.GoodsAppAction.gaDisable', "", "appDisable",index);
	}

	function activateApp(index) { // 同意
		console.log(jsonStr)
		authority('com.oa.action.GoodsAppAction.gaActivate', "", "appActivate",index);
	}
	
	function appFormatterOPT(value,row,index) {		// 申购审核操作
		var appStatus = row.appStatus;
		if(appStatus == 2) {
			/* return "已拒绝不能再操作"; */
			return "<a href = 'javascript:;' onclick = 'activateApp(" + index + ")'>同意</a>&nbsp;&nbsp;&nbsp;" +
				"<a href = 'javascript:;'onclick = 'disableApp(" + index + ")'>已拒绝</a>";
		} else if(appStatus == 1) {
			return "已同意&nbsp;&nbsp;&nbsp;" +
				"<a href = 'javascript:;'onclick = 'disableApp(" + index + ")'>拒绝</a>";
		} else {
			return "<a href = 'javascript:;' onclick = 'activateApp(" + index + ")'>同意</a>&nbsp;&nbsp;&nbsp;" +
				"<a href = 'javascript:;'onclick = 'disableApp(" + index + ")'>拒绝</a>";
		}
	}
	
</script>

</head>

<body style="height:100%;">

	<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/goodsApp/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:98%;">
		<thead>
			<tr>
				<!-- <th data-options="field:'ck',checkbox:true">编号</th> -->
				<th data-options="field:'goodsAppId',align:'center',checkbox:true"></th>
				<th data-options="field:'emp',align:'center',width:100" formatter="Emp_Name">申购人</th>
				<th data-options="field:'goodsName',align:'center',width:100">申购用品名称</th>
				<th data-options="field:'quantity',align:'center',width:100">申购总数</th>
				<th data-options="field:'des',align:'center',width:100">描述</th>
				<th data-options="field:'appDay',align:'center',width:150" formatter="formatterDate">申购时间</th>
				<!-- 此处状态表示此申购是否有效，和appStatus是不一样的意思 -->
				<th data-options="field:'status',align:'center',width:80" formatter="frozenActivate">状态</th>
				<th data-options="field:'operation',align:'center',width:100" formatter="formatterOpt">状态操作</th>
				<th data-options="field:'appStatus',align:'center',width:80" formatter="appSActivate">申购状态</th>
				<th data-options="field:'appStatusOPT',align:'center',width:120" formatter="appFormatterOPT">申购审核操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddGoodsAppWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditGoodsAppWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
	</div>
	
	<!-- 添加物品申购 -->
	<div id="addWin" class="easyui-window" title="添加物品申购" data-options="closed:true" style="width:400px;height:250px;">
		<form id="addForm">
			<table>
				<tr>
					<td>申购物品的名称</td>
					<td><input name="goodsApp.goodsName" onclick="showGT();" class="easyui-validatebox easyui-textbox" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>申购物品数量</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="goodsApp.quantity" data-options="min:0,precision:0"/></td>
				</tr>
				<tr>
					<td>申购此物品原因</td>
					<td><input class="easyui-textbox" name="goodsApp.des" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addGoodsApp();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 更新申购的物品 -->
	<div id="editWin" class="easyui-window" title="更新申购物品" data-options="closed:true" style="width:500px;height:300px;">
		<form id="editForm">
			<input type="hidden" name="goodsApp.goodsAppId" />
			<input type="hidden" name="goodsApp.empId" />
			<input type="hidden" name="goodsApp.appDay" />
			<table>
				<tr>
					<td>申购的物品的名称</td>
					<td><input name="goodsApp.goodsName" class="easyui-validatebox easyui-textbox" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>申购物品的数量</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="goodsApp.quantity" data-options="min:0"/></td>
				</tr>
				<tr>
					<td>申购此物品的原因</td>
					<td><input class="easyui-textbox" name="goodsApp.des" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>状态</td>	<!-- 此处状态表示此申购是否有效，和appStatus是不一样的意思 -->
					<td>
						<input type = "radio"  name="goodsApp.status" value= "0"/>冻结
						<input type = "radio"  name="goodsApp.status" value= "1"/>激活
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editGoodsApp();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>