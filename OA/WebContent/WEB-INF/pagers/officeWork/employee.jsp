<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
   <%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href ="http://static.hdslb.com/images/favicon.ico" />

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/datagrid-groupview.js"></script>
<style type="text/css">
	#msg  input {
		border:0px;
		background-color:#fff;
		margin-bottom:5px;
	}
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
 .selMsg{
 	font-size: 12px;
 	color:red;
 }
 .show{
 	display: inline-block;
 }
 .none{
 	display: none;
 }
</style>
<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
jsonStr =	'{"employee.department.depId":"_depId","employee.department.name":"_depName","employee.pwd":"_pwd","employee.role.roleId":"_roleId","employee.empId":"_empId","employee.name":"_name","employee.idCard":"_idCard","employee.nation":"_nation","employee.gender":"_gender","employee.fingerNo":"_fingerNo","birthday":"_birthday","employee.email":"_email","employee.phone":"_phone","employee.qq":"_qq","employee.weChat":"_weChat","employee.married":"_married","employee.contactName":"_contactName","employee.contactPhone":"_contactPhone","employee.college":"_college","employee.major":"_major","employee.eduBack":"_eduBack","employee.bankName":"_bankName","employee.accountName":"_accountName","employee.accountNo":"_accountNo","employee.alipay":"_alipay","hireDay":"_hireDay","resignDay":"_resignDay","employee.status":"_status","employee.address":"_address","employee.role.name":"_roleName","employee.hireDay":"_empHireDay","employee.birthday":"_birthday"}';
var sessionEmp = str2JsonStr("${session.employee}");
sessionEmp.role = str2JsonStr("${session.employee.role}");
sessionEmp.department = str2JsonStr("${session.employee.department}");
	
$(function(){
	setPagination(datagrid)
})

function updStatus(index){
		var row = $("#datagrid").datagrid("getData").rows[index];
		if(row) {
			$.messager.confirm("提示","确定要修改该用户的活动状态吗?" ,function(r){
				if(r) {
					$.post("<%=path%>/employee/delete",{
						"employee.empId":row.empId,
						"employee.status":row.status,
						"employee.department.depId":row.depId
					},
						function(data){
						$("#"+datagrid).datagrid("reload");
					},"json" )
				}
			})
		}
	}
function add(url){
	$.post(url,$("#"+add_form).serialize(),
			function(data) {
				$("#"+add_win).window("close");
				$("#"+datagrid).datagrid("reload");
				$("#"+add_form).form("clear");
				$("#successMsg").html("<p align='center' >默认密码为'123456'</p>");
				$("#successMsg").slideDown(500);
				setTimeout("$('#successMsg').slideUp(500)",1500)
				$("#"+datagrid).datagrid("reload");
				console.log("reload")
			},"json")
}


function showEdit(index){
	var row = $("#"+datagrid).datagrid("getSelected");
	if((index+1)) {
		row = null;
		$("#"+datagrid).datagrid("selectRow",index);
		row = $("#"+datagrid).datagrid("getData").rows[index];
	}
	if(row){
		$.getJSON("<%=path%>/employee/queryEmp?empId="+row.empId,function(data) {
			var employee = data.employee;
			 if(employee.empId==null){employee.empId=""}
			 if(employee.department.depId==null){employee.department.depId=""}
			 if(employee.role.roleId==null){employee.role.roleId=""}
			 if(employee.name==null){employee.name=""}
			 if(employee.contactName==null){employee.contactName=""}
			 if(employee.contactPhone==null){employee.contactPhone=""}
			 if(employee.bankName==null){employee.bankName=""}
			 if(employee.accountNo==null){employee.accountNo=""}
			 if(employee.accountName==null){employee.accountName=""}
			 if(employee.alipay==null){employee.alipay=""}
			 if(employee.status==null){employee.status=""}
			 if(employee.department.name==null){employee.department.name=""}
			 if(employee.role.name==null){employee.role.name=""}
			 var jsonStr1 = jsonStr.
			 replace("_empId",employee.empId).
			 replace("_depId", employee.department.depId). 
			 replace("_roleId",employee.role.roleId).
			 replace("_name", employee.name).
			 replace("_contactName",employee.contactName).
			 replace("_contactPhone",employee.contactPhone).
			 replace("_bankName",employee.bankName).
			 replace("_accountName",employee.accountName).
			 replace("_accountNo",employee.accountNo).
			 replace("_alipay",employee.alipay).
			 replace("_status",employee.status).
			 replace("_depName",employee.department.name).
			 replace("_roleName",employee.role.name) ;
			var roleName = employee.role.name;
			 var roleSel = document.getElementById("updRoleSel");
				 roleSel.options.length=0;
				 roleSel.onchange=null;
			 $.get("<%=path%>/json/depRole",function(data) {
				 for(var i = 0,len=data.length;i<len;i++){
					 if(data[i].name == employee.department.name){
					 	 var dataArray = data[i].role;
						 for(var j=0,lenj=dataArray.length; j<lenj; j++ ){
							 var option = document.createElement("OPTION");
							 	option.innerText = dataArray[j];
							 	option.value=dataArray[j];
							 	roleSel.options.add(option);
						 }
					 }
				 }
				 for(var i = 0; i<roleSel.length;i++){
			 			if(roleSel.options[i].value==employee.role.name){
			 				roleSel.selectedIndex=i;
			 				return;
			 			}
			 		}
			 })
			$("#"+edit_form).form("load",JSON.parse(jsonStr1));
			var empIdInput = $("#empEmpId");
			if(sessionEmp.empId == empIdInput.val()){
				$("#updRoleSel").attr("disabled",true);
			}
		})
		 
			
		$("#"+edit_win).window("open");
	}else {
		if(!(index+1)) {
			$.messager.alert("提示","请选择要修改的商品","info");
		}
	} 
}

	function selectBox(url,idd) {
		$.get(url,function(data){
			$("#"+idd).combobox({
				data:data.roles,
				textField:"value",
				valueField:"key"
			})
		},"json")
	}
	
	function queryMsg(value,row,index){
		var query = "<a href='javascript:;' onclick='showAll("+index+ ")'>查看详情</a>";
		return query;
	}
	function showAll(index){
		showEmpAllMsg("<%=path%>/employee/queryEmp",index);
	}
	function qAEdit(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var edit = "<a href='javascript:;' onclick= 'showEdit(" +index + ")' style='color:green'>修改 </a>";
		var del ="";
		if(sessionEmp.empId==row.empId){
			return edit;
		}else{
			if(row.status == 0){
				return  "<p style='color:#666'>已离职</p>";
			}else {
				if(row.depName!="总部"){
					var del = "<a href='havascript:;' onclick ='updStatus(" + index + ")' style='color:red'>辞退</a>";
				}
			}
			return   del +edit  ;
		}
	}
	
	function queryEmps() {
			$("#datagrid").datagrid({
				queryParams: {
					empName: $('#names').val(),
					beginDate:$('#beginDate').datebox('getValue'),
					endDate:$('#endDate').datebox('getValue'),
					status:$('#hasPass').val(),
					depId:$("#depId").val()
				}
			})
	}

	function bir2ageFormatter(value,row, index){
		return bir2age(value);
	}
	function closeSave(){
		$("#"+add_win).window("close");
	}
	function updEmp(url){
		$("#updRoleSel").attr("disabled",false);
		$.post(url,$("#"+edit_form).serialize(),
				function(data) {
					$("#"+edit_win).window("close");
					$("#"+datagrid).datagrid("reload");
				},"json"		
				)
	}
</script>

<title>员工管理</title>
</head>
<body id = "body">
	<div id="successMsg" style="display:none" class= "message"></div>
	<table id="datagrid" class="easyui-datagrid" style="height:100%;width:100%" data-options="
			url:'employee/pager',
			method:'get',
			autoRowHeight:true,
			singleSelect:true,
			rownumbers:true,
			pagination:true,
			toolbar:'#toolbar',
			fit:true,
			fitColumns:true,<!-- 表格面积是否全部占满 -->
			groupField:'depName',
			view:groupview,
			groupFormatter:function(value, rows){
				return value ;
		    },
		    rowStyler: function(index,row){
					if (row.status == 0){
						return 'color:#ccc';
					}
			}
		"
		>  
	    <thead>  
	        <tr>  
	            <th data-options="field:'name',align:'center',width:80" >姓名</th>  
	            <th data-options="field:'depName',align:'center',width:80">所在部门</th>
	            <th data-options="field:'roleName',align:'center',width:80">角色</th>
	            <th data-options="field:'nation',align:'center',width:80">籍贯</th>  
	            <th data-options="field:'gender',align:'center',width:80">性别</th>  
	            <th data-options="field:'birthday',align:'center',width:80" formatter="bir2ageFormatter">年龄</th>  
	            <th data-options="field:'email',align:'center',width:80">邮箱</th>  
	            <th data-options="field:'hireDay',align:'center',width:80" formatter= "dateFormat" sortable="true">入职时间</th>  
	            <th data-options="field:'resignDay',align:'center',width:80" formatter= "dateFormat" >离职时间</th>  
	            <th data-options="field:'status',align:'center',width:80" formatter="frostEdit">状态</th>
	            <th data-options="field:'msg',align:'center',width:80" formatter="queryMsg">详情</th>
	            <th data-options="field:'editde',align:'center',width:80" formatter="qAEdit">操作</tr>
	        </tr>  
	    </thead>  
	</table>  
	
	
	<!-- 其它工具 -->
	<div id="toolbar" style="padding:5px;height:auto;width:100%" >
	
		<div left:10px">
				<div style="display:inline-block" class="dep_YoN"> <s:select label = "所在部门"  value="" list = "departments" id="depId" /></div>
				<div style="display:inline-block">		员工名称:<input id="names" />				</div>
				<div style="display:inline-block">状态:<select id="hasPass">
					<option value="" selected="selected" ></option>
					<option value="1" >在职</option>
					<option value="0">离职</option></select></div>
			入职时间:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser">-
			<input id="endDate" class="easyui-datebox" name="endDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser">
			<a href="javascript:;" class= "easyui-linkbutton" onclick = "queryEmps()">查询</a>
			<br />
		</div>
		<div align="left" id="addBtn" >
			<a href="javascript:;" class= "easyui-linkbutton" iconCls="icon-add" onclick="showAdd()" >添加</a>
		</div>
	</div>
	
	<!-- 添改表 -->
		<!-- 加 -->
	<div id="add_win" class= "easyui-window" title="添加员工" data-options="iconCls:'icon-add',closed:true" style="width:450px;height:400px;padding:5px">
		<h2 style="font:'italic arial,sans-serif'">添加员工</h2>
		<div class="selMsg" style="diaplay:none"></div>
		<form id="add_form" >
		<input name="employee.status" value="1" type="hidden" />
		<table>
			<tr><td>名字:</td><td><input name="employee.name" class="easyui-validatebox" data-options="required:true,validType:'length[2,4]',missingMessage:'请输入员工姓名'" /></td></tr>
			<tr><td>性别 :</td><td>	<select name="employee.gender"><option value="男">男</option><option value="女">女</option></select>
			</td></tr>
			<tr><td>身份证号 :</td><td> <input name="employee.idCard" class="easyui-validatebox" data-options="required:true,validType:'length[18,18]',missingMessage:'请输入身份证号',invalidMessage:'身份证号格式错误,请检查'"/></td></tr>
			<tr><td>邮箱 :</td><td><input name="employee.email" class="easyui-validatebox" data-options="required:true,validType:'email',missingMessage:'请输入邮箱',invalidMessage:'请输入正确格式的邮箱'" /></td></tr>
			<tr><td>手机: </td><td><input name="employee.phone" id="phone" class="easyui-validatebox" data-options="required:true,validType:'length[11,11]',missingMessage:'请输入手机号',invalidMessage:'请输入正确格式的手机号'" /></td></tr>
			<tr><td></td><td id="checkPhoneMsg" style="color:red"></td></tr>
			<tr><td>指纹编号 :</td><td><input name="employee.fingerNo" /></td></tr>
 			<tr class= "dep_YoN"><td>部门分配</td><td><select  id = "depSel" name="employee.department.name" ></select></td></tr>
 			<tr><td>角色分配</td><td><select id = "roleSel" name="employee.role.name" ></select></td></tr>
			<tr><td>籍贯:</td><td><select id="province" name="province"></select>  
    			<select id="city" name="city"></select>  
    			<select id="area" name="area"></select>  </td></tr>	
    		<tr><td>住址:</td><td><input  name = "employee.address"  class="easyui-validatebox"  data-options="required:true,validType:'length[0,50]',missingMessage:'请输入居住地址'" /></td></tr>
 			<tr><td>出生日期:</td><td><input  class="easyui-datebox" name = "birthday" data-options="required:true,missingMessage:'请选择出生日期',formatter:myformatter,parser:myparser"></td></tr>
			<tr><td>开户行名称:</td><td><input class="easyui-validatebox"  name = "employee.bankName" data-options="required:true,validType:'length[0,25]',missingMessage:'请输入银行卡所在银行'" /></td></tr>
			<tr><td>银行卡帐号:</td><td><input class="easyui-validatebox"  name = "employee.accountNo" data-options="required:true,validType:'length[19,19]',missingMessage:'请输入银行卡号',invalidMessage:'请输入正确的银行卡'" /></td></tr>
			<tr><td>银行卡姓名:</td><td><input class="easyui-validatebox"  name = "employee.accountName" data-options="required:true,validType:'length[2,4]',missingMessage:'请输入持卡人姓名',invalidMessage:'请输入合法的用户姓名'" /></td></tr>
			<tr><td><a href="javascript:;" onclick="add('<%=path %>/employee/save')" class="easyui-linkbutton" >确认</a></td>
				<td><a href="javascript:;" onclick="closeSave()" class="easyui-linkbutton" >取消</a></td>
			</tr>
		</table>
		</form>
	</div>
	<!-- 加表结束 -->
	<script type="text/javascript">
		$("#phone").bind("focusout",{url:"<%=path%>/employee/checkEmpPhone",inputId:"phone",msgTagId:"checkPhoneMsg"},checkPhone);
	</script>
		<!-- 改 -->
	<div id="upd_win" class= "easyui-window" title="修改员工信息" data-options="iconCls:'icon-add',closed:true" style="width:500px;height:400px;padding:5px">
		<form id="upd_form" >
			<input name="employee.empId" id="empEmpId" type="hidden"/> 
			<input name="employee.status" type="hidden"/> 
	 		<input hidden="true" id = "updDepSel" name="employee.department.name" />
			<table>
				<tr><td>名字</td><td><input name="employee.name" disabled="disabled" style="background-color:#fff;border:0px" /></td></tr>
 				<tr><td>角色分配</td><td><select id = "updRoleSel" name="employee.role.name" ></select></td></tr>
				<tr><td>联系人姓名</td><td><input   name="employee.contactName" /></td></tr>				 
				<tr><td>联系人手机号</td><td><input  name="employee.contactPhone" /></td></tr>				 
				<tr><td>开户行</td><td><input  name="employee.bankName" /></td></tr>				 
				<tr><td>银行卡帐号</td><td><input   name="employee.accountNo" /></td></tr>				 
				<tr><td>银行卡姓名</td><td><input   name="employee.accountName" /></td></tr>				 
				<tr><td>支付宝帐号</td><td><input  name="employee.alipay" /></td></tr>				 
				<tr>
					<td><a href="javascript:;" onclick="updEmp('<%=path %>/employee/update')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a></td>
					<td><a href="javascript:;" onclick="exitWin('upd_win')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 查看 -->
	<div id="show_win" class= "easyui-window"  title="员工详细信息" data-options="closed:true" >
		<form id="msg">
			<table>
				<tr><td>名字:</td><td><input name="employee.name" disabled="disabled" /></td><td>指纹编号: </td><td><input name="employee.fingerNo" disabled="disabled" style="bakcground-color:#fff,border:0px"/></td></tr>
				<tr><td>部门:</td><td><input name="employee.department.name" disabled="disabled" /></td><td>角色:</td><td><input name="employee.role.name" disabled="disabled"/></td></tr>
				<tr><td>性别: </td><td><input name="employee.gender" disabled="disabled"/></td><td>出生日期:</td><td><input  name = "employee.birthday" disabled="disabled"/></td></tr>
	 			<tr><td>QQ:</td><td><input name="employee.qq" disabled="disabled" /></td><td>微信:</td><td><input name="employee.weChat"  disabled="disabled"/><td></tr>
				<tr><td>手机号:</td><td><input name = "employee.phone" disabled="disabled"/></td><td>邮箱: </td><td><input name="employee.email" disabled="disabled"/></td></tr>
	 			<tr><td>籍贯</td><td><input name="employee.nation"   disabled="disabled"/></td><td>住址:</td><td><input name="employee.address"  disabled="disabled"/></td></tr>
	 			<tr><td>支付宝:</td><td><input name="employee.alipay" disabled="disabled"/></td></tr>
	 			<tr><td>开户行:</td><td><input name="employee.bankName"  disabled="disabled"/></td><td>银行卡帐号:</td><td><input name="employee.accountNo" disabled="disabled"/></td></tr>
	 			<tr><td>银行卡姓名:</td><td><input name="employee.accountName" disabled="disabled"/></td></tr>
	 			<tr><td>专业:</td><td><input name="employee.major" disabled="disabled"/></td></tr>
	 			<tr><td>学历:</td><td><input name="employee.eduBack" disabled="disabled"/></td><td>毕业学校:</td><td><input name="employee.college" disabled="disabled"/><td></tr>
	 			<tr><td>联系人姓名:</td><td><input name="employee.contactName" disabled="disabled"/></td><td>联系人手机:</td><td><input name="employee.contactPhone" disabled="disabled"/></td></tr>
	 			<tr><td>婚配:</td><td><input name="employee.married" disabled="disabled"/></td></tr>
	 			<tr><td>入职时间:</td><td><input name="employee.hireDay" disabled="disabled"/></td></tr>
				<tr><td>身份证号 </td><td> <input name="employee.idCard" disabled="disabled"/></td></tr>
	 			<tr><td>状态:</td><td><input name="employee.status" disabled="disabled"/></td></tr>
		  </table>
		</form>
	</div>
	<input hidden="true" id="session_roleName" value="${sessionScope.employee.role.name}"/>
	<script type="text/javascript">
		selectBox("<%=path%>/employee/allRoles","roles1")
		selectBox("<%=path%>/employee/allRoles","roles2")
		if($("#session_roleName").val()!='总经理'){
			$(".dep_YoN").remove();
			var roleSel = document.getElementById("roleSel");
			$.get("<%=path%>/dep/resultDepName",function(data){
				var depName = data.name;
				$.get("<%=path%>/json/depRole",function(data) {
					 for(var i = 0,len=data.length;i<len;i++){
						 if(data[i].name == depName){
						 	 var dataArray = data[i].role;
							 for(var j=0,lenj=dataArray.length; j<lenj; j++ ){
								 var option = document.createElement("OPTION");
								 	option.innerText = dataArray[j];
								 	option.value=dataArray[j];
								 	roleSel.options.add(option);
							 }
						 }
					 }
					 for(var i = 0; i<roleSel.length;i++){
				 			if(roleSel.options[i].value==$("#session_roleName").val()){
				 				roleSel.selectedIndex=i;
				 				return;
				 			}
				 		}
				 })
			})
			 
		}else {
	       	depRole("<%=path%>/json/depRole",'depSel','roleSel','dept','role');
		}
		$(function(){
			var useRole = $("#session_roleName").val();			
			if(useRole=='总经理'||useRole=="行政部主任"||useRole=="财务部主任"||useRole=="后勤部主任"||useRole=="教务部主任"||useRole=="招生部主任"){
	        	addressInit('<%=path%>/json/address','province', 'city', 'area');  
			}
			if(useRole!='总经理'&&useRole!="行政部主任"&&useRole!="教务部主任"&&useRole!="招生部主任"){
				var addWin = $("#addWin");
				var addBtn = $("#addBtn");
				addWin.remove();
				addBtn.remove();
			}
		})
	</script>
	<!-- 改表结束 -->
</body>
</html>