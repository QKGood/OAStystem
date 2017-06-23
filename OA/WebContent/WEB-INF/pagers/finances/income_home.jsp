<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script src="<%=path %>/js/jquery-1.12.0.min.js"></script>
<script src="<%=path %>/js/highcharts.js"></script>
<script src="<%=path %>/js/my-charts.js"></script>

<script>

	
var tempData = {
		chart: {
            type: 'column'
        },
        title: {
            text: '年收入'
        },
        subtitle: {
            text: '数据来源: WorldClimate.com'
        },
        xAxis: {
        	categories: ['一月', '二月', '三月', '四月', '五月', '六月',
        	                '七月', '八月', '九月', '十月', '十一月', '十二月'],
            crosshair: true
        },
        yAxis: {
            title: {
            	text: '元 (￥)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} ￥</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: []
    };



$(function () {
	getColumnarChart("columnar", "<%=path %>/ie/lineBasic", tempData);
});
	
	

	
	function fmtName(value) {
		return value.name;
	}
	
</script>

<body style="width:100%; margin:0px;">
	<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/ie/incomePager',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'incomeId',checkbox:true">编号</th>
				<th data-options="field:'incomeType',width:150" formatter="fmtName">收入类型</th>
				<th data-options="field:'des',width:150">收入描述</th>
				<th data-options="field:'income',width:150">收入金额</th>
				<th data-options="field:'incomeDay',width:150" >收入时间</th>
				<th data-options="field:'employee',width:150" formatter="fmtName">办理人</th>
				<th data-options="field:'student',width:150" formatter="fmtName">学生</th>
			</tr>
		</thead>
	</table>
	
	<!-- 工具栏 -->
	<div id="tb" style="padding:5px;height:auto">
		<div id = "columnar">
		</div>
	</div>
	
	
	
	
	
</body>
</html>

				
