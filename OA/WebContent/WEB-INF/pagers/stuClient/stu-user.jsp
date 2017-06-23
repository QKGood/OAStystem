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
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/datagrid-groupview.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

<script>
var sessionStu = str2JsonStr("${session.student}");
function exit() {
	window.location.href = "<%=path %>/login/exit";
}
function showUpdateWin() {
	$("#pwdWin").form("clear"); // 清除表单里的所有数据
	$("#pwdWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
}

function clearForm(){ // 清除表单数据
	$('#pwdForm').form('clear'); // 清除表单的内容
}

function determine() { // 修改密码
	var ordPwd = $('#ordPwd').textbox('getValue');
	var newPwd = $('#newPwd').textbox('getValue');
	var detPwd = $('#detPwd').textbox('getValue');
	if ($("#pwdForm").form("validate")) {
		if (newPwd != detPwd) {
			$.messager.alert("提示", "您输入的两次密码不匹配", "error");
		} else {//更新密码提交的url
			$.post("<%=path %>/stu/updatePwd",
					$("#pwdForm").serialize(), // Form表单序列化
					function(data) {
						if (data.resu.code == "200") { 
								$.messager.alert("提示", data.resu.message, "info");
							} else if(data.resu.code == "500"){
								$.messager.alert("提示", data.resu.message, "error");
							}
					}, "json");
					$("#pwdWin").window("close"); // 关闭指定的窗口
		}
	} else {
		$.messager.alert("提示", "请正确输入表单数据", "error");
	}
}

function edit(){
		
		$.post("<%=path %>/stu/stuUpdate",
				$("#editForm").serialize(),
			function(data){
				
				if(data.resu.request == "success"){
					$.messager.alert("提示",data.resu.message,"info");
				}else{
					$.messager.alert("提示",data.resu.message,"info");
				}
		},"json");
}
</script>

<style type="text/css">

	#stu-table input{
		border-radius:4px;
	}
</style>

<title>学生信息管理</title>
</head>
<body id = "body">	
	<form id="editForm" >
		<div style="text-align: center; margin-left: 180px; margin-top: 120px;">
			<table id="stu-table">
			<tr>
				<td>名字:</td><td><input name="student.name" value="${sessionScope.student.name}" /></td>
				<td>学号: </td><td><input name="student.stuNo" value="${sessionScope.student.stuNo}"  readonly="true"  /></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td>
					<%-- <input type = "radio"  name="student.gender" value="${sessionScope.student.gender}"  />男
					<input type = "radio"  name="student.gender" value="${sessionScope.student.gender}" />女 --%>
					<select name="student.gender" style="width:170px">
   						<option name="student.gender" value="${sessionScope.student.gender}">男</option>
   			 			<option name="student.gender" value="${sessionScope.student.gender}">女</option>
					</select>
					<%-- <input name="student.gender" value="${sessionScope.student.gender}" /> --%>
				</td>
				
				<td>身份证号 :</td>
				<td> 
					<input name="student.idCard" value="${sessionScope.student.idCard}" />
				</td>
			</tr>
			<tr>	
				<td>手机号:</td>
				<td> 
					<input name="student.phone" value="${sessionScope.student.phone}" />
				</td>			
				<td>qq号:</td>
				<td><input name="student.qq" value="${sessionScope.student.qq}"/></td>
			</tr>
			<tr>
				<td>微信号:</td>
				<td> <input  name="student.weChat" value="${sessionScope.student.weChat}"/></td>
				<td> 毕业学校: </td>
				<td><input name="student.school" value="${sessionScope.student.school}" /></td>
			</tr>
			<tr>
				<td>年龄: </td>
				<td><input name="student.age"  value="${sessionScope.student.age}" /></td>
				<td> 生日: </td>
				<td><input name="student.birthday" class ="easyui-validatebox easyui-datetimebox" value="${sessionScope.student.birthday}"  /></td>
			</tr>
			<tr>
				<td>地址: </td><td><input name="student.address" value="${sessionScope.student.address}" /></td>
				<td>籍贯: </td><td><input name="student.nation" value="${sessionScope.student.nation}"/></td>
			</tr>
			<tr>
				<td>家长姓名:</td><td><input name = "student.parentName" value="${sessionScope.student.parentName}"/></td>
				<td>户口性质: </td><td><input name="student.residence" value="${sessionScope.student.residence}"/></td>
			</tr>
    		<tr>
    			<td>家长电话:</td><td><input  name = "student.parentPhone" value="${sessionScope.student.parentPhone}"/></td>
 				<td>描述:</td><td><input  name = "student.des" value="${sessionScope.student.des}" ></td>
    		</tr>
			<tr>
				<td>入学时间:</td><td><input  name = "student.startDay"  class ="easyui-validatebox easyui-datetimebox" value="${sessionScope.student.startDay}"/></td>
				<%-- <td>状态:</td><td><input name = "student.status" id="status" readonly="true" value="${sessionScope.student.status}"/></td> --%>
			</tr>
			</table>
			<div style="margin-left: -310px; margin-top: 20px">
				<a href="javascript:;" onclick="edit()" class="easyui-linkbutton" style="width: 50px;" >保存</a>
				<a href="javascript:;" onclick="showUpdateWin();" class="easyui-linkbutton" style="width: 80px;" >修改密码</a>
				<a href="javascript:;" onclick="" class="easyui-linkbutton" style="width: 50px;" >刷新</a>
			</div>
		</div>
	</form>	
		
	<!-- 修改密码窗口-->
	<div id="pwdWin" class="easyui-window" title="修改密码" data-options="closed:true" style="width:350px;height:200px;">
		<div style="padding:0px 60px 20px 0px">
		    <form id="pwdForm">
		    	<table style="margin-top: 15px; margin-left: 40px;">
		    		<tr>
		    			<td>旧密码:</td>
		    			<td>
		    				<input class="easyui-textbox easyui-validatebox" type="password" id="ordPwd" name="ordPwd" data-options="required:true, validType:'length[6, 20]'" placeholder="请输入旧密码"></input>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>新密码:</td>
		    			<td>
		    				<input class="easyui-textbox easyui-validatebox" type="password" id="newPwd" name="newPwd" data-options="required:true, validType:'length[6, 20]'" placeholder="请输入新密码"></input>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>确认密码:</td>
		    			<td>
		    				<input class="easyui-textbox easyui-validatebox" type="password" id="detPwd" name="student.pwd" data-options="required:true, validType:'length[6, 20]'" placeholder="确认密码"></input>
		    			</td>
		    		</tr>
		    	</table>
		    </form>
		    <div style="margin-left: 60px; padding:5px; text-align: center;">
		    	<a href="javascript:void(0)" data-options="iconCls:'icon-ok'" class="easyui-linkbutton" onclick="determine();">确定</a>
		    	<a href="javascript:void(0)" data-options="iconCls:'icon-cancel'" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		    </div>
		</div>
	</div>
	<script type="text/javascript">
		if(sessionStu.status == 1){
			$("#status").text("在校");	
		}else{
			$("#status").text("离校");
		}
	</script>
</body>
</html>