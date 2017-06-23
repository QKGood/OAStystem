<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
        <%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理申诉</title>

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<style>
	.show{
		display:inline-block;
	}
	.none{
		display:none;
	}
</style>
<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';
var sessionEmp = str2JsonStr("${session.employee}");
	sessionEmp.role = str2JsonStr("${session.employee.role}");
	sessionEmp.department = str2JsonStr("${session.employee.department}");
	function queryByWhe(self){//正在测试部门查询
		$("#datagrid").datagrid({
			queryParams: {
				self:self,
				hasPass: $('#hasPass').val(),
				pass:$('#pass').val(),
				beginDate:$('#beginDate').datebox('getValue'),
				endDate:$('#endDate').datebox('getValue'),
				empName:$('#empName').val()
			}
		})
		if(self!=null&&self!=""){//是自己
			$("#hasPass").bind("change",passChange);
			$("#checkEmpName").addClass("none").removeClass("show");
		}else{//不是自己
			if(sessionEmp.role.name=="行政部主任"||sessionEmp.role.name=="财务部主任"||sessionEmp.role.name=="后勤部主任"||sessionEmp.role.name=="教务部主任"||sessionEmp.role.name=="招生部主任"){
			 	$("#hasPass").unbind("change",passChange);
			 	$("#passdiv").addClass("none").removeClass("show");
			 	console.log("passdiv is none")
			}
			$("#checkEmpName").addClass("show").removeClass("none");
		}
	}
	
	
	function updatePass(index,pass,level){
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var appealId = row.appealId;
		console.log(pass)
		$.post("<%=path%>/empAppeal/update",{
			appealId:appealId,
			pass:pass,
			level:level
		},function(data){
			$("#datagrid").datagrid("reload");
		})
	}
	
	/* 
	* ceshi*/
	function doLeave(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var level = $("#session_level");
		var but1 = "<a href='javascript:;' class= 'easyui-linkbutton' style='color:green' onclick='updatePass("+index+",2)'>通过</a>";
		var but2 = "<a href='javascript:;' class= 'easyui-linkbutton' style='color:red' onclick = 'updatePass("+index+",1)' >不通过</a>";
		if(row.pass==0) {
			if(sessionEmp.empId != row.empId){
				var level = $("#session_level").val();
				if(level == 1){
					if(row.firstLeave==1){
						return "已审核";
					}
				}
				return but1+but2;
			}else{
				return "不可操作"
			}
		}else {
			if(row.pass==1){
				return "未通过" 
			}else {
				return "已通过"
			}
		}
	}
</script>


</head>
<body>
	<table id="datagrid" class="easyui-datagrid" style="width:100%;height:100%"
			data-options="
			autoRowHeight:true,
			toolbar:'#toolbar',
			nowrap:false,
			pagination:true,
			fit:true,
			fitColumns:true,<!-- 表格面积是否全部占满 -->
			rowStyler: function(index,row){
					if (row.status == 1 && row.empId == '${sessionScope.employee.empId}'){
						return 'font-size:20px;font-weight:bold;';
					}
			}
			">
			<thead>
				<tr>
					<th data-options="field:'empName',width:80">员工姓名</th>
					<th data-options="field:'depName',width:80">部门名称</th>
					<th data-options="field:'appealDay',width:100" formatter = "dateFormat" sortable="true">提交时间</th>
					<th data-options="field:'des',width:80,align:'right'">申诉描述</th>
					<th data-options="field:'secondLeave',width:250" formatter="leaveFormat">审核进度</th>
					<th data-options="field:'pass',width:60,align:'center'"	formatter="statuFormat" >审核状态</th>
					<th data-options="field:'aaa',width:60,align:'center'"  formatter='doLeave'>操作</th>
				</tr>
			</thead>
		</table>
		<div id = "toolbar" >
			<div align="left">
			<form id="wheQuery" >
				<div id="checkEmpName" class="show" >员工姓名:<input id="empName" name="empName"  /></div>
				<div style="display:inline-block" id="hasPassDiv">审核状态:
					<select id="hasPass" name = "hasPass"> 
						<option value="" selected="selected" ></option> 
						<option value="0">未审核</option>
						<option value="1">已经审核</option>
					</select>
				</div>
				<div   class= "none" id="passdiv">
					<select id="pass" name = "pass"> 
						<option value="" selected="selected" ></option>
						<option value="2">同意</option>
						<option value="1">不同意</option>
					</select>
				</div>
				<div style="display:inline-block">开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
				结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
				</div>
				<a class= "easyui-linkbutton" href="javascript:;" onclick = "queryByWhe()">查询</a> 
				<a id="self" class= "easyui-linkbutton" href="javascript:;" onclick = "queryByWhe('self')">查询自己</a>
			</form>
				</div> 
			<div align="left" id="add_btn">
				<a class= "easyui-linkbutton" href="javascript:;" data-options="iconCls:'icon-add'" onclick = "showAdd()">我要申诉</a>
			</div>
		</div>
		
		
		<!-- addWin -->
		<div id="add_win" class= "easyui-window" title="添加申诉" data-options="iconCls:'icon-add',closed:true">
			<form id="add_form" >
				<h2>考勤申诉:</h2>
				<textarea name="empappeal.des" data-options="required:true,validType:'length[3,500]',missingMessage:'请填写申诉请求',invalidMessage:'申诉请求字数就限制在3-500字符以内'"></textarea>
				<a href="javascript:;" onclick="add('<%=path %>/empAppeal/save')" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" >提交申诉</a>
			</form>
		</div>	
		
		
		
<%-- 		
		<script type="text/javascript">
			$("#hasPassDiv").change(function () {
				 if($("#hasPassDiv option:selected").val()==1){
					 $("#passdiv").addClass("show").removeClass("none");
				 }else {
					 $("#passdiv").addClass("none").removeClass("show");
				 }
	 		});
		</script>
 --%>		
		<div id="userRole">
			<input type="hidden" id = "userWorkStatus" value="${self }" />
			<input type="hidden" id ="session_level" value=""/>
		</div>
		<script>
			$(function(){
				var userWorkStatus = $("#userWorkStatus").val();
				$("#datagrid").datagrid({
					url:'<%=path %>/empAppeal/pager',
					method:'get',
					queryParams: {
						self:userWorkStatus,
						nowrap:false 
					}
				})
			})
		
			function passChange() {
				 if($("#hasPass option:selected").val()==1){/**/
					 $("#passdiv").addClass("show").removeClass("none");
				 console.log('show')
				 }else {
					 $("#passdiv").addClass("none").removeClass("show");
					 console.log('none')
				 }
			};
			$("#hasPass").bind("change",passChange);
			
			$(function(){	//当页面加载时过滤出用户需要的东西
				var addwin = $("#add_win");/* 不同角色会出现不同的东西 ,这个是添加的,超级管理员不会出现这个 */
				var addbtn = $("#add_btn");/* 不同的角色会出现不同的东西,这个是添加按钮,超级管理员不会出现这个*/
				var empSelf=$("#self");/* //角色不同会出现的按钮 */
				var checkEmpName = $("#checkEmpName");/* 普通用户不会出现的 员工名称查询按钮 */
				var useRole = sessionEmp.role.name;
				if(useRole=="总经理"){
					addbtn.remove();
					addwin.remove();
					empSelf.remove();
					 $("#session_level").val("2");
				}else if(useRole=="行政部主任"||useRole=="财务部主任"||useRole=="后勤部主任"||useRole=="教务部主任"||useRole=="招生部主任"){
					$("#session_level").val("1");
					console.log("this")
					$("#hasPass").unbind("change",passChange);
				}else{
					checkEmpName.remove();
					empSelf.remove();
				}
			})
				
		</script>
		
</body>
</html>