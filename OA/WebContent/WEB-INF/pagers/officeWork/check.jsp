<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href ="http://static.hdslb.com/images/favicon.ico" />

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/full_text.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/datagrid-groupview.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<title>巡查</title>

<style type="text/css">
#div{
		border:1px solid red;
		border-radiu:5px;
	}
 
 	#fullToolbar div.edui_box{
		width:20px;height:20px;
		display:inline-block !important;
		background-image:url(<%=path%>/image/full_text.png)
	}
	.checkDes{
		margin-left:20px;
		martgin-top:20px;
	}
	.checkEmpName{
		font-size:14px;
		position:absolute;
		display:inline;
		bottom: 40px;
		right:50px;
	}
	.checkDate{
		font-size:14px;
		position:absolute;
		display:inline;
		bottom: 20px;
		right:50px;
	}
	.checkType{
		font-size:18px;
		display:block;
		top: 30px;
		left:30px;
	}

</style>
<script>
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='tt';
empsDatagrid ='empsDatagrid';
		function changecolumn(whe){
			$('#addType').val(whe);
			 $('#tt').datagrid({
				queryParams: {
						addType: whe,
						empName: $('#empName').val(),
						beginDate:$('#beginDate').datebox('getValue'),
						endDate:$('#endDate').datebox('getValue'),
						
				},
				columns:[[
							{field:whe+'Id',hidden:true,width:80},
							{field:'checkTime',title:'日期',width:80},
							{field:'weekday',title:'星期',width:80,formatter:function dat(value,row,index) {
								console.log(value)
								if(value == '1') {
									return '星期一'
								}if(value == '2') {
									return '星期二'
								}if(value == '3') {
									return '星期三'
								}if(value == '4') {
									return '星期四'
								}if(value == '5') {
									return '星期五'
								}if(value == '6') {
									return '星期六'
								}if(value == '7') {
									return '星期天'
								}}
							},
							{field:'empName',title:'巡查员工姓名',width:80},
							{field:whe+'Name',title:'巡查地址名称',width:80},
							{field:'des',title:'巡查描述',width:80}
							]]
			}) 
		}
		/**
			添加时选择教室与宿舍控制 开始
		*/
		function selBtn(value,row,index){
			var btn = '<a onclick= "doSel(' + index + ')" >选择</a>';
			console.log(btn)
			return btn;
		}
		
		function doSel(index){
			var row = $("#checkTypeDatagrid").datagrid("getData").rows[index];
			console.log(row);	
			if(row.gradeId!=null&&row.gradeId!=""){
				/* 是班级巡查 */
				$("#gradeCheckP").append(": " +row.name);
				$("#checkAddId").val(row.gradeId);
			}else if(row.roomId!=null&&row.roomId!=""){
				/* 是宿舍巡查 */
				$("#roomCheckP").append(": " +row.name);
				$("#checkAddId").val(row.roomId);
			}
			$("#addWin").window("close");
		}
		/**
			添加时选择教室与宿舍控制 结束
		*/
		/* 后期添加 */
		function checkInfo(value,row,index){
			value = value.replace(/<.*?>/ig,"");
			if(value.length > 10){
				var a = "<a onclick = 'showCheckInfo("+index+")' style='color:green'>查看详情</a>"
				return value.substr(0,10) + ".. " + a;
			}else{
				return value;
			}
		}
		selectEmps("empId","<%=path%>");
		function showAdd(){
			var iframe = frames['full'];
			iframe.document.body.innerHTML ="";
			$("#"+add_form).form("clear");
			$("#"+add_win).window("open");
		}
		function showCheckInfo(index){
			var row = $("#"+datagrid).datagrid("getData").rows[index];
			var checkTime = dateFormat(row.checkTime);
			$("#checkInfo_Win").window("open");
			var checkType = "班级查询:";
			if(row.gradeName==null || row.gradeName==""){
				checkType="宿舍查询:";
			}
			$(".checkType").text(checkType);
			$(".checkDes").html(row.des);
			$(".checkEmpName").text(row.empName);
			$(".checkDate").text(checkTime);
		}
		
		function addCheck(url){
			var iframe = frames['full'];
			var htmlText= iframe.document.body.innerHTML;
			var textLength = iframe.document.body.innerText;
			console.log(htmlText)
			if(textLength.length>100 || textLength.length<10){
				alert("字数超出100,请输入10-100字符的日志");
			}else{
				$("#checkDes").val(htmlText);
				 $.post(url,$("#"+add_form).serialize(),
						function(data) {
							if(data.reqMsg!=null)
								if(data.reqMsg.code==200){
									$("#"+add_win).window("close");
									$("#"+add_form).form("clear");
									$("#"+datagrid).datagrid("reload");
								}else{
								}
								alert(data.reqMsg.message);
						},"json")	
				$("#"+add_form).form("clear");
			}
		}
	</script>
</head>
<body>
<!--  	groupField:'weekday',
			view:groupview,
			groupFormatter:function(value, rows){
				return value ;
		    }备用-->
	<table id="tt"  class="easyui-datagrid" style="height:100%"	data-options="
			url:'<%=path %>/check/pager',
			method:'get',
			autoRowHeight:true,
			pagination:true,
			fit:true,
			fitColumns:true,<!-- 表格面积是否全部占满 -->
			toolbar:'#toolbar'
			">
			<thead>
				<tr>  
		            <th data-options="field:'checkTime',width:80" formatter="dateTimeFormat" >日期</th> 
		            <th data-options ="field:'weekday',width:80" formatter="dat">星期</th>
		            <th data-options="field:'empName',width:80">巡查员工姓名</th>  
		            <th data-options="field:'gradeName',width:80">巡查班级名称</th>
		            <th data-options="field:'des',width:80" formatter = "checkInfo">巡查描述</th>
		        </tr>  
			</thead>
	</table>  
	<div id="toolbar" align="right"  >
		<h1 id="time" style="position: relative;" align="left"></h1>
		<div>
			<form id = "queryWhe" style="position: relative;right:20px;">
				<a href="javascript:;" class= "easyui-linkbutton" onclick="showAdd()">添加巡查记录</a>
				巡查员工: <input id="empName" name="empName" />
				开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
				结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
				<input id="addType" type="hidden" name="addType" />
				<a href="javascript:;" class= "easyui-linkbutton" onclick="changecolumn('grade')">班级查询</a>
				<a href="javascript:;" class= "easyui-linkbutton" onclick="changecolumn('room')">宿舍</a>
			</form>
		</div>
	</div>
	
	<!-- 添加个人巡查 -->
		<div id="add_win" class="easyui-window" title="添加巡查记录" data-options="closed:true" style="width:540px;height:350px;padding:5px;">
				<h2>巡查记录</h2>
				<form id="add_form" method="post">
				<input id = "checkAddId" name="checkAddId" type="hidden"/>
				<input id="checkDes"  type="hidden" name="check.des"/>
		    	<table cellpadding="5">
		    		<tr>
		    			<td>选择巡查类型:</td>
		    			<td>
		    				<label><input name="checkType" class="grade"  type="radio" value="grade" selected="selected" /><p style="display:inline-block;" id="gradeCheckP">班级巡查</p></label>
		    				<label><input name="checkType" class="room" type="radio" value="room" /><p style="display:inline-block;" id="roomCheckP" >宿舍巡查</p></label>
		    			</td>
		    		</tr>
		    		<tr><td>巡查时间:</td><td><input class="easyui-timespinner"  name="checkTime" ></td></tr>
		    		<tr>
		    			<td>巡查详情:</td><td>
		    				<!-- 富文本开始 -->
		    				<div class= "outBox" style="width:400px;height:150px;">
								<div style="width:100%; height:22px;border-bottom:1px solid rgba(0,0,0,0.2)" id="fullToolbar" class= "innerBox" >
									<div class= "edui_box edui_default bold"  onclick="func('bold',false,null);"></div>
									<div class= "edui_box edui_default italic"  onclick="func('italic',false,null);"></div>
									<div class= "edui_box edui_default underline"  onclick="func('underline',false,null);"></div>
									<div class= "edui_box edui_default justifyleft"  onclick="func('justifyleft',false,null);"></div>
									<div class= "edui_box edui_default justifycenter"  onclick="func('justifycenter',false,null);"></div>
									<div class= "edui_box edui_default justifyright"  onclick="func('justifyright',false,null);"></div>
								</div>
								<div class= "innerBox iframe" style="width:100%;height:208px">
									<iframe style="border:0px" name="full" style="width:100%;height:100%;"></iframe>
								</div>
							</div>
							<script>
								$(function(){
									var iframe = frames['full'];
									iframe.document.designMode = "on";
								})
							</script>
		    				<!-- 富文本结束 -->
		    			</td>
		    		</tr>
		    		<tr>
		    			<td><a class= "easyui-linkbutton" onclick ="addCheck('<%=path%>/check/save')">提交</a></td>
		    		</tr>
		    	</table>
		    </form>
		</div>
		
		<!-- 巡查详情 开始-->
			<div id="checkInfo_Win"  class="easyui-window" title="巡查详情" data-options="closed:true" style="width:400px;height:350px;padding:5px;">
				<div class= "checkType"></div>
				<div class= "checkDes"></div>
				<div class= "checkEmpName"></div>
				<div class= "checkDate"></div>
			</div>
		<!-- 巡查详情 结束-->
		
		<script>
			$(".grade").click(function(){
				console.log("grade")
				var isGrade= $(".grade").is(":radio");
				if(isGrade){
						$("#checkTypeDatagrid").datagrid({
							url:'<%=path %>/grade/gradePager',
							method:'get'
						})
				}
				$("#addWin").window("open");
			});
			/* 选中查询宿舍时,弹出地址datagrid */
			 $(".room").click(function(classId,url){
				 console.log("room")
				var isRoom = $(".room").is(":radio");
				if(isRoom){
					//TODO
					$("#checkTypeDatagrid").datagrid({
							url:'<%=path %>/room/roomPager',
							method:'get'
					})
				}
				
				$("#addWin").window("open");
			})
			/* addWin中的列的formatter 开始*/
			
			function frozenActivate(value,row,index){  // 显示状态为可用或不可用
				if(value == 1){
					status = 1;
					return "可用";
				}else if(value == 0){
					status = 0;
					return "不可用";
				}
			}
			/* addWin中的列的formatter 结束 */
		</script>
	
	
	<!-- 巡查地址信息datagrid -->
	<div id="addWin" class="easyui-window" title="添加巡查记录" style="width:500px;height:300px" data-options="iconCls:'icon-save',closed:true,minimizable:false" >
		<table id = "checkTypeDatagrid" class="easyui-datagrid" 
				data-options="
					singleSelect:true,
					collapsible:true,
					rownumbers:true,
					autoRowHeight:true,
					pagination:true,
					pageSize:20"
				>
			<thead>
				<tr>
					<th data-options="field:'name',align:'center'">名称</th>
					<th data-options="field:'des',align:'center'">描述</th>
					<th data-options="field:'quantity',align:'center'">最大人数</th>
					<th data-options="field:'fact',align:'center'">实际人数</th>
					<th data-options="field:'status',align:'center'" formatter="frozenActivate">状态</th>
					<th data-options="field:'do',align:'center'" formatter="selBtn">操作</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<script>
		function curMon(year, month){
			var oDiv=document.getElementById("div1");
			var date=new Date();
			var year=date.getFullYear();//当前年份
			var month=date.getMonth();//当前月份
			var time=year+"年"+(month+1)+ "月";
			return time;
		}
		$("#time").text(curMon());
	</script>
</body>
</html>
