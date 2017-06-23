<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<style>
	.show{
		display:inline-block;
	}
	.none{
		display:none;
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
</style>
<script>
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';

	function queryByWhe(self){//测试Boss
		$("#datagrid").datagrid({
			queryParams: {
				self:self,
				hasPass: $('#hasPass').val(),/* 这是为了测试,后期需要删除 */
				pass:$('#pass').val(),
				beginDate:$('#beginDate').datebox('getValue'),
				endDate:$('#endDate').datebox('getValue'),
				empName:$('#empName').val()
			}
		})
	}
	
	function updatePass(index,pass){
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var da1 = new Date(row.endTime);
		var da2=new Date(row.startTime);
		/* pass:不通过是1,通过是2 */
		var cha = parseInt(Math.abs(da1-da2)/ 1000 / 60 / 60 / 24);
		var leaveid = row.leaveId;
		$.post("<%=path%>/empleave/update",{
			pass:pass,
			leaveid:row.leaveId,
			count:cha
		},function(data){
			$("#datagrid").datagrid("reload");
		})
	}
	
	
	
	function doLeave(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var empId = $("#session_selfId");
		var but1 = "<a href='javascript:;' class= 'easyui-linkbutton' style='color:green' onclick='updatePass("+index+",2)'>通过</a>";
		var but2 = "<a href='javascript:;' class= 'easyui-linkbutton' style='color:red' onclick = 'updatePass("+index+",1)' >不通过</a>";
		if(row.pass==0) {
			if(empId != row.empId){
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

	selectEmps("empIds","<%=path%>");

</script>
<title>处理请假</title>
</head>
<body id="body">
<div id="successMsg" style="display:none" class= "message"></div>
	<table id="datagrid" class="easyui-datagrid" style="width:100%;height:100%;margin:0px"
			data-options="
			url:'<%=path %>/empleave/pager',
			method:'get',
			toolbar:'#toolbar',
			nowrap:false 
			">
			<thead>
				<tr>
					<th data-options="field:'empId',hidden:true"/>
					<th data-options="field:'depId',hidden:true"/>
					<th data-options="field:'leaveId',hidden:true"/>
					<th data-options="field:'empName',width:80">员工姓名</th>
					<th data-options="field:'depName',width:80">部门名称</th>
					<th data-options="field:'leaveDay',width:100">申请日期</th>
					<th data-options="field:'startAndEnd',width:130" formatter = "leaveTimeFormat">请假日期</th>
					<th data-options="field:'des',width:80,align:'right'">请假原由</th>
					<th data-options="field:'secondLeave',width:250" formatter="leaveFormat">审核进度</th>
					<th data-options="field:'aaa',width:60,align:'center'" formatter='doLeave'>操作</th>
				</tr>
			</thead>
		</table>
		<div id = "toolbar" ><!-- 这是自己的,也就是以id查 -->
			<div>
				<a  class= "easyui-linkbutton" onclick = "showAdd()" >我要请假</a>
				<a class= "easyui-linkbutton" href="javascript:;" onclick = "queryByWhe('self')"  id="self">只看自己</a> 
			</div>
			<div >
				<form id="wheQuery" style="float:left" >
					<div style="display:inline-block" id="hasPassDiv">审核状态:
						<select id="hasPass" name = "hasPass">
							<option value="" selected="selected" ></option> 
							<option value="0">未审核</option>
							<option value="1">已经审核</option>
						</select>
					</div>
					<div class= "none" id="passdiv">
						<select id="pass" name = "pass"> 
							<option value="" selected="selected" ></option>
							<option value="2">同意</option>
							<option value="1">不同意</option>
						</select>
					</div>
					<div id="empNameDiv" style="display:inline-block">员工姓名:<input id="empName" name="empName"  /></div>
					开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
					结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
					<a class= "easyui-linkbutton" href="javascript:;" onclick = "queryByWhe()">查询</a> 
				</form>
			</div>
			
		</div> 
		
		
		<!-- 提交请假申请表 -->
		<div id="add_win" class="easyui-window" title="请假申请表单" data-options="closed:true" style="width:500px;height:200px;padding:5px;">
				<h2>员工请假条</h2>
				<form id="add_form" method="post">
		    	<table cellpadding="5">
		    		<tr>
		    			<td>请假起止时间:</td>
		    			<td><input id="startDate"class="easyui-datetimebox" name="startDate"  data-options="validType:'date' , required:true,missingMessage:'请输选择请假开始时间',invalidMessage:'日期格式出错,请选择正确的格式', formatter:myformatter1,parser:myparser1"></input></td>
		    			<td><input id="endDate"class="easyui-datetimebox" name="endDate"  data-options="validType:'date' ,required:true,missingMessage:'请输选择请假结束时间',invalidMessage:'日期格式出错,请选择正确的格式', formatter:myformatter1,parser:myparser1"></input></td>
		    		</tr>
		    		<tr>
		    			<td>请假原由:</td>
		    			<td><input class="easyui-textbox" type="text" name="empleave.des" data-options="required:true,validType:'length[3,255]', required:true,missingMessage:'请填写请假原由',invalidMessage:'字数应在10-255字符以内'"></input></td>
		    		</tr>
		    		<tr>
		    			<td><a class= "easyui-linkbutton" onclick = "add('<%=path%>/empleave/save')">提交</td>
		    		</tr>
		    	</table>
		    </form>
		</div>
		
		
		<div id="userRole">
			<input type="hidden" id ="session_selfId" value="${sessionScope.employee.empId}"/>
			<input type="hidden" id ="session_roleName" value="${sessionScope.employee.role.name}"/>
			<input type="hidden" id ="session_level" value=""/>
		</div>
		<script>
		var useRole = $("#session_roleName").val();
		var empName = $("#empNameDiv");
		var empSelf=$("#self");
		var addwin = $("#add_win");
		var addbtn = $("#add_btn");
		if(useRole=="总经理"){
			addbtn.remove();
			addwin.remove();
			 $("#session_level").val("2");
		}else if(useRole=="行政部主任"||useRole=="财务部主任"||useRole=="后勤部主任"||useRole=="教务部主任"||useRole=="招生部主任"){
			$("#session_level").val("1");
		}else{
			empName.remove();
			empSelf.remove();
		}
		
		
		$("#hasPass").change(function () {
			 console.log($("#hasPass option:selected").val())
			 if($("#hasPass option:selected").val()!=1){
				 $("#passdiv").addClass("show").removeClass("none");
			 }else {
				 $("#passdiv").addClass("none").removeClass("show");
			 }
		});
		</script>
</body>
</html>