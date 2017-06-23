<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
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
<style>
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
<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';
jsonStr = '{"duty.emp1.empId":"_empId1","duty.emp2.empId":"_empId2","duty.emp3.empId":"_empId3","duty.emp4.empId":"_empId4","duty.emp5.empId":"_empId5","duty.emp6.empId":"_empId6","duty.emp7.empId":"_empId7","duty.emp8.empId":"_empId8","duty.dutyId":"_dutyId","dutyInfo.weekday":"_weekday"}';

	function edit(value,row,index) {
		var useRole = $("#session_roleName").val();
		var edit = "";
		if(useRole=="总经理" || useRole=="行政部主任"){
			edit= "<a href='javascript:;' onclick= 'showEdit(" +index + ")'>修改 </a>";
		}
		return edit;
	}
	
	function showEdit(index){
		var empid1=  $("#datagrid").datagrid("getSelected");
		if((index+1)) {
			row = null;
			$("#"+datagrid).datagrid("selectRow",index);
			row = $("#"+datagrid).datagrid("getData").rows[index];
		}
		$("#day").text(dat(row.weekday));
		console.log(row);
		var empid1="";var empid2="";var empid3="";var empid4="";var empid5="";
		var empid6="";var empid7="";var empid8="";
		if(row.emp1 != null){			empid1=row.emp1.empId;		}
		if(row.emp2 != null){			empid2=row.emp2.empId;		}
		if(row.emp3 != null){			empid3=row.emp3.empId;		}
		if(row.emp4 != null){			empid4=row.emp4.empId;		}
		if(row.emp5 != null){			empid5=row.emp5.empId;		}
		if(row.emp6 != null){			empid6=row.emp6.empId;		}
		if(row.emp7 != null){			empid7=row.emp7.empId;		}
		if(row.emp8 != null){			empid8=row.emp8.empId;		}
		var jsonStr1 = jsonStr.
		replace("_empId1", empid1).
		replace("_empId2", empid2).
		replace("_empId3", empid3).
		replace("_empId4", empid4).
		replace("_empId5", empid5).
		replace("_empId6", empid6).
		replace("_empId7", empid7).
		replace("_empId8", empid8).
		replace("_weekday",row.weekday).
		replace("_dutyId", row.dutyId);
		if(row){
			$("#"+edit_form).form("load",JSON.parse(jsonStr1));
			$("#"+edit_win).window("open");
		}else {
			if(!(index+1)) {
				$.messager.alert("提示","请选择要修改的商品","info");
			}
		}
		
	}
			

	/* 添加地址相关开始 */
	function addAddress() {
		$("#dd").dialog("open");
	}

	function showdel() {
		$("#del").dialog("open");
	}
	
	function delAdd(){
		$.post('duty/updAdd',$('#updAdd').serialize(),function(data){	
			window.location.reload();  
		})
	}
	
	function updC() {
		 $.post('duty/saveAdd',$('#addNew').serialize(),function(data){
			if(data.reqMsg!=null){
				if(data.reqMsg.code==200){
					alertMsg(data.reqMsg.message);
					window.location.reload(); 
				}else{
					alert("添加失败")
				}
			}
			 
		}) 
	}
	
	function exitC() {
		$("#dd").dialog("close");
	}
	/* 添加地址相关结束 */
</script>

<title>值班</title>
</head>
<body>
<div id="alertMsg"style="display:none" class= "message"></div>
<table id="datagrid" class="easyui-datagrid" data-options="
		url:'duty/allDuty',
		method:'get',
		fit:true,
		fitColumns:true,
		singleSelect:true,
		autoRowHeight:true,
		toolbar:'#toolbar'
	"
	> 
    <thead>  
        <tr>  
            <th data-options="field:'dutyId',hidden:true" ></th> 
            <th data-options="field:'weekday',width:80"  formatter="dat">日期</th> 
            <s:iterator value = "address" status="c">
		  		 <th data-options="width:80,formatter:function(value,row,index){
		  		  	if(row.emp<s:property value='#c.getCount()'/> !=null){
			  		  	return row.emp<s:property value='#c.getCount()'/>.name;	
		  		  	}
		  		  	return '';}"
		  		  	  field='empName<s:property value="#c.getCount()"/>'><s:property /></th> 
		 	</s:iterator> 
            <th data-options="field:'edit',width:80" formatter="edit" >修改</th>
        </tr>  
    </thead>  
	</table> 
	
	<!-- 修改页面 -->
	  
	 <div id="upd_win" class= "easyui-window" title="修改巡查人员" data-options="iconCls:'icon-edit',closed:true" style="width:300px;height:400px;padding:5px">
		<form id="upd_form" >
				<input id="dutyId" name="duty.dutyId"  type="hidden">
				<input name="dutyInfo.weekday" hidden="true" id="duty_weekday">
			<table>
				<tr><td>日期:</td><td id="day"></td></tr>
				<s:iterator value = "address" var ="v" status="d">
					<tr><td><s:property />:</td><td>
					<input id="emps<s:property value='#d.getCount()'/>"  class= "easyui-combobox" name = "duty.emp<s:property value='#d.getCount()'/>.empId"/>
					</td></tr>
				</s:iterator>
				<tr>
					<td><a href="javascript:;" onclick="upd('<%=path %>/duty/update')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		
	  	function empCombo() {
	  		$.get("duty/hemps",function(data) {
	  			var o = JSON.stringify(data.employees);
	  			$("#emps1").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps2").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps3").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps4").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps5").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps6").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps7").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps8").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  		},"json")
	  	}
	  	empCombo();
	  </script>
	  
	<!-- 工具 -->
	
	<div id="toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<s:if test="address.size<8">
					<a href="javascript:;" onclick = "showAdd()" class = "easyui-linkbutton">添加值班地址</a>
				</s:if>
				<a href="javascript:;" onclick = "showdel()" class = "easyui-linkbutton">删除值班地址</a>
		</div>
	</div>
	
	<!-- 添加地址 -->
	<s:if test="address.size<8">
		<div id="add_win" class="easyui-window" title="添加地址" style="width:250px;height:auto;"
	   		data-options="iconCls:'icon-save',resizable:true,modal:true ,closed: true">
	   		<form id="addNew">
				<table>
					<tr><td>地址 :</td><td><input id="addadd" name="addadd"/></td></tr>
					<tr><td>员工选择:</td><td><input id="addEmpId"  class= "easyui-combobox"  name = "addEmpId" /></td></tr>
					<tr><td  align="center"><a href="javascript:;" class= "easyui-linkbutton" onclick = "updC()" >添加</a></td><td><a href="javascript:;" class= "easyui-linkbutton" onclick = "exitC()" >取消</a></td></tr>
				</table>
			</form>
		</div>
		<script type="text/javascript">
		$(function(){
			$.get("duty/hemps",function(data) {
				$("#addEmpId").combobox({	data:data.employees,textField:"value",	valueField:"key"})
			});
		})
			
		</script>
	</s:if>
	
	<!-- 弹出地址删除 -->
	<div id = "del" class= 'easyui-window '  style="width:250px;height:auto;" title="删除地址"  data-options="iconCls:'icon-save',resizable:true,modal:true ,closed: true">
		<form id="updAdd">
			<s:select list="address" label="旧地址"  name="oldadd"></s:select>
			<tr>新地址:<td></td><td><input name = "newadd"  /></td></tr>
			<a href="javascript:;" onclick = "delAdd()"  class= "easyui-linkbutton">删除</a>
		</form>
	</div>
	<!-- 页面所需要的东西,不能动 -->
	<div id="userRole">
			<input type="hidden" id ="session_selfId" value="${sessionScope.employee.empId}"/>
			<input type="hidden" id ="session_roleName" value="${sessionScope.employee.role.name}"/>
	</div>
	<script>
			var useRole = $("#session_roleName").val();
			var empName = $("#empName");
			var empSelf=$("#self");
			var addwin = $("#add_win");
			var addbtn = $("#add_btn");
			if(useRole=="总经理" || useRole=="行政部主任"){
				
			}else{
				$("#toolbar").remove();
				$("#upd_win").remove();
				$("#add_win").remove();
			}
		</script>
	
</body>
</html>