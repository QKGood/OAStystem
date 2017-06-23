<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%String path= request.getContextPath(); %>
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

<title>员工考勤</title>
<style type="text/css">
	h2{
		display: inline-block;
	}
</style>
<script type="text/javascript">

function query(){
	var selYear = $("#year  option:selected").text();
	var selMon = $("#month option:selected").text();
	$("#yearStr").text(selYear);
	$("#monStr").text(selMon);

	$("#datagrid").	datagrid({
				queryParams: {
						empName: $('#empName').val(),
						year:$('#year option:selected').text(),
						month:$('#month option:selected').text()
				}
	});
}
function check(value ,row,index){
	if(value==null||value==""){
		return 0;
	}
	return value;
}
</script>
</head>
<body>

<table id="datagrid" class="easyui-datagrid" style="height:100%;" data-options="
		url:'empChecking/pager',
		method:'get',
		autoRowHeight:true,
		pagination:true,
		toolbar:'#toolbar'
	"
	>  
    <thead>  
        <tr>  
            <th data-options="field:'empname',align:'center',width:80" >员工姓名</th> 
            <th data-options="field:'depname',align:'center',width:80">所在部门</th>
            <th data-options="field:'laterCount',align:'center',width:80" formatter="check">迟到</th>  
            <th data-options="field:'forgetCount',align:'center',width:80">未打卡</th>  
            <th data-options="field:'leaveCount',align:'center',width:80">请假</th>  
        </tr>  
    </thead>  
	</table>
		
	<!-- 工具 -->
	<div id= "toolbar" style="padding:5px;height:auto;width:100%" >
		<div align="left" style="display:inline-block">
			<h2 id="yearStr" ></h2><h2>年</h2><h2 id="monStr"></h2><h2>月</h2>
		</div>
		<div align="right" style="float:right">
			员工姓名:<input id="empName"  />
			年:<select id="year" name="year"></select>
			月:<select id="month" name="month"></select>
			<a class= "easyui-linkbutton" onclick="query()">查询</a>
		</div>
	</div>	
	
	<script>
		$(function(){
			var yearSel = $("#year");
			var monthSel = $("#month");
			var date = new Date();
			var curYear= date.getFullYear();
			var curMon = date.getMonth()+1;
			for(var i = 1970;i<=curYear;i++){
				if(i==curYear){
					yearSel.append("<option selected='selected'>"+i+"</option>");
				}else{
					yearSel.append("<option>"+i+"</option>");
				}
			}
			for(var i = 1; i<=12;i++){
				if(i == curMon){
					monthSel.append("<option selected='selected'>"+i+"</option>");
				}else{
					monthSel.append("<option>"+i+"</option>");
				}
			}
		})
	
		$(function(){
			var date = new Date();
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			$("#yearStr").text(y);
			$("#monStr").text(m);
		})
		
	</script>
</body>
</html>