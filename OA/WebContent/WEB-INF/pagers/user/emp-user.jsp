<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
   <%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="favicon.ico" href="<%=path %>/image/logo.ico"  type="image/x-icon" />
<link rel="icon" href="<%=path %>/image/logo.ico"  type="image/x-icon" />
<link rel="shortcut icon" href="<%=path %>/image/logo.ico"  />
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

<script >
var sessionEmp = str2JsonStr("${session.employee}");
	function showUpdateWin() {
		$("#pwdWin").form("clear"); // 清除表单里的所有数据
		$("#pwdWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	function clearForm(){ // 清除表单数据
		$('#pwdForm').form('clear'); // 清除表单的内容
	}
	
	function determine() { // 修改密码
		var oldPwd = $('#oldPwd').val();
		var newPwd = $('#newPwd').val();
		var detPwd = $('#detPwd').val();
		console.log("oldPwd:" + oldPwd)
		if ($("#pwdForm").form("validate")) {
			if (newPwd != detPwd) {
				$.messager.alert("提示", "您输入的两次密码不匹配", "error");
			} else {//更新密码提交的url
				$.post("<%=path %>/employee/updPwd",
						$("#pwdForm").serialize(), // Form表单序列化
						function(data) {
							if (data.reqMsg.code == "200") { 
								$.messager.alert("提示", data.reqMsg.message, "info");
							} else if (data.reqMsg.code == "500") {
								$.messager.alert("提示", data.reqMsg.message, "error");
							}
						$("#pwdWin").window("close"); // 关闭指定的窗口
						}, "json");
			}
		} else {
			$.messager.alert("提示", "请正确输入表单数据", "error");
		}
	}
	
	
</script>

<style type="text/css">

/* 	#emp-table input{
		border-radius:4px;
	} */
	.dis input:disabled{
		background-color:#fff;
		border:0;
		font-size:16px;
		color:black;
	}
	
	.dis input{
		background-color:#fff;
		border : 1px solid rgb(149, 184, 231);
		border-radius:5px;
		line-height:23px; 
		padding-left:5px;
		font-size:16px;
		color:black;
	}
	
 	.textbox,.textbox-label-disabled{
		font-size:16px;
		border:0;
		opacity:1;
	
	} 
	td{
		text-align: left;
		padding-left:10px;
		padding-bottom:10px;
	}
	tr{
		margin-top:10px;
	}
</style>
<title>员工信息管理</title>
</head>
<body id = "body">	

		<div style="text-align: center; margin-left: 180px; margin-top: 40px;">
			<form id="upd_form" class= "dis">
				<table id="emp-table">
					<tr><td>名字:</td><td>${sessionScope.employee.name }</td>
						<td>年龄 :</td><td id="age"></td>
					</tr>
					
					<tr><td>性别:</td><td>${sessionScope.employee.gender }</td>
							<td>婚姻状态:</td>
							<td><input type = "radio"  disabled="disabled"  name="employee.married" value= "已婚" />已婚
								<input type = "radio"  disabled="disabled"  name="employee.married" value= "未婚"/>未婚
							</td>
					</tr>
					<tr>	<td>身份证号 :</td><td> ${sessionScope.employee.idCard}</td>			
							<td>籍贯:</td><td>${sessionScope.employee.nation }</td>
					</tr>
					<tr>
						<td>邮箱 :</td><td><input name="employee.email" disabled="disabled" class="easyui-validatebox"  value="${sessionScope.employee.email }"/></td>
						<td>手机: </td><td><input name="employee.phone"  disabled="disabled" class="easyui-validatebox"  data-options="required:true,validType:'length[11,11]'" value="${sessionScope.employee.phone }"/></td>
					</tr>
					<tr>
						<td>微信: </td><td><input name="employee.wechar"  disabled="disabled"  value="${sessionScope.employee.weChat }"  /></td>
						<td>QQ: </td><td><input name="employee.qq" disabled="disabled"   value="${sessionScope.employee.qq }" /></td>
					</tr>
					<tr>
						<td>联系人姓名: </td><td><input name="employee.contactname"   disabled="disabled" value="${sessionScope.employee.contactName }" /></td>
						<td>联系人手机号: </td><td><input name="employee.contactphone"  disabled="disabled"  class="easyui-validatebox"  data-options="required:true,validType:'length[11,11]'" value="${sessionScope.employee.contactPhone }"/></td>
					</tr>
					<tr>
						<td>毕业学校: </td><td>${sessionScope.employee.college }</td>
						<td>所学专业: </td><td>${sessionScope.employee.major }</td>
					</tr>
					<tr>
						<td>学历: </td><td>${sessionScope.employee.eduBack }</td>
			 			<td>部门 :</td><td>${sessionScope.employee.department.name }</td>
					</tr>
					<tr>
						<td>角色:</td><td>${sessionScope.employee.role.name }</td>
						<td>指纹编号 :</td><td>${sessionScope.employee.fingerNo }</td>
					</tr>
		    		<tr>
			    		<td>住址:</td><td><input  disabled="disabled"   name = "employee.address" value="${sessionScope.employee.address }"/></td>
			 			<td>出生日期:</td><td>${sessionScope.employee.birthday }</td>
			    	</tr>
		 			<tr>
						<td>开户行名称:</td><td><input  disabled="disabled" name="employee.bankName" value="${sessionScope.employee.bankName }"/></td>
						<td>银行卡帐号:</td><td><input class="easyui-validatebox"  disabled="disabled"  data-options="required:true,validType:'length[19,19]'" name="employee.accountNo"  value="${sessionScope.employee.accountNo }"/></td>
					</tr>
					<tr>
						<td>银行卡姓名:</td><td><input  name = "employee.accountName"  disabled="disabled"  class="easyui-validatebox" value="${sessionScope.employee.accountName }"/></td>
						<td>支付宝账号:</td><td><input  name = "employee.alipay"  disabled="disabled"  class="easyui-validatebox"  data-options="required:true,validType:'length[1,20]'" value="${sessionScope.employee.alipay }"/></td>
					</tr>
					<tr>
						<td>入职时间:</td><td id="hireDay"></td>
						<td>状态:</td><td id = "status"></td>
					</tr>
				</table>
			</form>
		<div style="margin-left: -310px; margin-top: 20px">
			<a href="javascript:;" id="edit" onclick="edit()" class="easyui-linkbutton" style="width: 50px;" ><span class= "edit_save">修改</span></a>
			<a href="javascript:;" onclick="showUpdateWin();" class="easyui-linkbutton" style="width: 80px;" >修改密码</a>
			<a href="javascript:;" onclick="" class="easyui-linkbutton" style="width: 50px;" >刷新</a>
		</div>
	</div>
			<!-- 修改密码窗口-->
	<div id="pwdWin" class="easyui-window" title="修改密码" data-options="closed:true" style="width:350px;height:200px;">
		<div style="padding:0px 60px 20px 0px">
		    <form id="pwdForm">
		    	<input type="hidden" id="empId" name="empId" value="${session.emp.empId }" />
		    	<table style="margin-top: 15px; margin-left: 40px; width: 280px;">
		    		<tr>
		    			<td>旧密码:</td>
		    			<td>
		    				<input class="easyui-validatebox" type="password" name="employee.pwd" id="oldPwd" data-options="required:true, validType:'length[6, 20]'" placeholder="请输入旧密码"></input>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>新密码:</td>
		    			<td>
		    				<input class="easyui-validatebox" type="password" id="newPwd" name="newPwd" data-options="required:true, validType:'length[6, 20]'" placeholder="请输入新密码"></input>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>确认密码:</td>
		    			<td>
		    				<input class="easyui-validatebox" type="password" id="detPwd" name="detPwd" data-options="required:true, validType:'length[6, 20]'" placeholder="确认密码"></input>
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
	/* 初加载时出现的页面的参数 */
	$(function(){
		var formJson = '{"employee.married":"_married"}';
		formJson = formJson.replace("_married",sessionEmp.married);
		$("#upd_form").form("load",JSON.parse(formJson)) 
		}
	)
	/* 年龄计算 */
	$(function(){
		var birth= new Date(dateFor(sessionEmp.birthday));
		var curDate = new Date();
		
		var birthYear = birth.getYear();
		var birthMon = birth.getMonth();
		var birthDay = birth.getDate();

		var curYear = curDate.getYear();
		var curMon = curDate.getMonth();
		var curDay = curDate.getDate();
		
		var age = curYear-birthYear;
		if(curMon>birthMon){
			age+=1;
		}else if(curMon == birthMon){
			if(curDay>=birthDay){
				age+=1;
			}
		}
		$("#age").text(age);
	})
	/*
	*就职状态
	*/
	if(sessionEmp.status==1){
		$("#status").text("在职");	
	}else{
		$("#status").text("离职");
	}
	
	/*入职时间*/
		$("#hireDay").text(dateFor(sessionEmp.hireDay));
	
	/*转为修改时的页面样式*/
	function edit() {
		$("#upd_form input").attr("disabled",false)
		
		$(".textbox").css({
			"border" : "1px solid rgb(149, 184, 231)", 
			"padding-left":"5px"
		});
		$(".textbox-text").css({
			"font-size":"16px"
		})
		$("#edit").attr("onclick","save()");
		$(".edit_save").text("保存");
	}
	
	
	/* 保存用户信息 */
	function save(){
		console.log($("#upd_form").serialize())
		 $.post("<%=path%>/employee/update",$("#upd_form").serialize(),function(data){
			if(data.reqMsg.code==200){
				console.log("修改成功")
				$("#upd_form input").attr("disabled",true);
				$("#edit").attr("onclick","edit()");
				$(".edit_save").text("修改");
				
			}else{
				console.log("修改失败")
			}
		})  
	}
	$(function(){
		
		var phone = $("input[name='employee.phone']");
		var wechar = $("input[name='employee.wechar']");
		var qq = $("input[name='employee.qq']");
		var contactname = $("input[name='employee.contactname']");
		var contactphone = $("input[name='employee.contactphone']");
		var address = $("input[name='employee.address']");
		var bankName = $("input[name='employee.bankName']");
		var accountNo = $("input[name='employee.accountNo']");
		var accountName = $("input[name='employee.accountName']");
		var alipay = $("input[name='employee.alipay']");
		phone.val(valIsNull(phone.val()));
		wechar.val(valIsNull(wechar.val()));
		qq.val(valIsNull(qq.val()));
		contactname.val(valIsNull(contactname.val()));
		contactphone.val(valIsNull(contactphone.val()));
		address.val(valIsNull(address.val()));
		bankName.val(valIsNull(bankName.val()));
		accountNo.val(valIsNull(accountNo.val()));
		accountName.val(valIsNull(accountName.val()));
		alipay.val(valIsNull(alipay.val()));
		
	})
	/* 值为空时的input Value */
	
</script>

		
</body>
</html>