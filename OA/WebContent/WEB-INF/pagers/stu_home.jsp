<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>宏图OA系统</title>
<link id="easyuiTheme" rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/material/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/homeImage.css"/>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon-hamburg.css" />
<script type="text/javascript" src="<%=path%>/jquery-easyui/themes/jeasyui.icons.hamburg.js"></script>
<script type="text/javascript"  src="<%=path %>/js/jquery-1.12.0.min.js"></script>	 	
<script type="text/javascript" src="<%=path %>/js/gdlb.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/changTheme.js"></script>
<script>
	function exit() {
		window.location.href = "<%=path %>/login/exit";
	}
	$(document).ready(function() {
		tabCloseEven();
	});
	window.onload=function(){
	//定时器每秒调用一次fnDate()
	setInterval(function(){
	fnDate();
	},1000);
	}
	//js 获取当前时间
	function fnDate(){
	var oDiv=document.getElementById("div1");
	var date=new Date();
	var year=date.getFullYear();//当前年份
	var month=date.getMonth();//当前月份
	var data=date.getDate();//天
	var hours=date.getHours();//小时
	var minute=date.getMinutes();//分
	var second=date.getSeconds();//秒
	var time=year+"-"+fnW((month+1))+"-"+fnW(data)+" "+fnW(hours)+":"+fnW(minute)+":"+fnW(second);
	oDiv.innerHTML=time;
	}
	//补位 当某个字段不是两位数时补0
	function fnW(str){
	var num;
	str>10?num=str:num=str;
	return num;
	} 
</script>
<style type="text/css">
		*{margin:0px;padding:0px}
	.out{width:500px; height:300px;position: relative; margin: 100px }
	.out .img{list-style: none; }
	.out .img li{position:absolute;}

	.out .num{list-style: none; position:absolute;bottom: 10px;text-align:center;width:100%}
	.out .num li{list-style: none; width:20px; height:20px; border-radius:50%;background-color:#999;text-align: center;display: inline-block;cursor:pointer;}
	.out .num li.active{background-color:#DD0000}
	
	
	.out .btn{top:110px;width:50px; height:80px; font-size: 72px;  position:absolute;background-color:rgba(255,255,255,0.3);cursor:pointer;}
	.out .left{left:0px;}
	.out .right{right:0px;}
	.hide{display:none}
	.show{display:inline-block;}

	#currDuty tr{
		line-height:25px;
	}
	#currDuty tr td{
		text-align:center;
		width:150px;
	}
	#currDuty tr th{
	 	width:150px;
	 }
	 #wel div{
	 	float:left;
	 }
</style>	
</head>
<body class="easyui-layout">
		<div data-options="region:'north'" style="height:65px;">
			<img style = "width:200px;height:50px;margin-top:7px;" src = "<%=path %>/image/logo.png" class = "logo"/>
		<%-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style = "font-size:20px;">当前时间：<span id = "div1" style = "font-size:20px;"></span></span> --%>
		<div style = "position:absolute;left:500px;top:20px;"><span style = "font-size:20px;">当前时间：<span id = "div1" style = "font-size:20px;"></span></span></div>
			<div id="wel">
				<div style="float:right;">  
		           <div style="padding:5px;font-size:20px;font-weight:900;margin-top:10px;">  
		            	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu'">更换主题</a>  
		           </div>  
	       		</div>  
				<div id="layout_north_pfMenu" style="margin-top:30px;">  
				       <div onclick="changeTheme('default');">默认主题</div>  
				       <div onclick="changeTheme('black');">暗黑</div>  
				       <div onclick="changeTheme('bootstrap');">太空灰</div>  
				       <div onclick="changeTheme('metro');">银色</div>  
				       <div onclick="changeTheme('sunny');">卡其</div>  
				       <div onclick="changeTheme('pepper-grinder');">棕红</div>  
				       <div onclick="changeTheme('cupertino');">蓝色海洋</div>  
				</div>  
				身份：<span style = "color:red;">学生</span >&nbsp;欢迎:<span style = "color:red;">${sessionScope.student.name}</span>
				<a href = "javascript:;" onclick="exit()">安全退出</a>
			</div>
		</div>

		
		<div data-options="region:'west',split:true" title="菜单" style="width:235px; ">	
			<div class="easyui-accordion menu" style="width:235px;">
				
				<div title="用品管理" class="menu1"  data-options="iconCls:'icon-hamburg-sitemap'" style="padding:10px;">
					<ul>
						<li><a href="javascript:;" onclick="addTab('用品','<%=path %>/sc/showGoodsHome');">查看用品</a></li>
					</ul>
				</div>
				
				<div title="学生管理" class="menu1" data-options="iconCls:'icon-hamburg-suppliers'" style="padding:10px;">
					<ul>
						<li><a href="javascript:;" onclick="addTab('学生成绩管理','<%=path %>/sc/showStuScoreHome');">查看成绩</a></li>
						<li><a href="javascript:;" onclick="addTab('学生请假管理','<%=path %>/sc/showStuLeaveHome');">查看请假</a></li>
						<li><a href="javascript:;" onclick="addTab('学生反馈管理','<%=path %>/sc/showStuFeedbackHome');">查看反馈</a></li>
						<li><a href="javascript:;" onclick="addTab('学生考勤管理','<%=path %>/sc/showStuCheckingHome');">查看考勤</a></li>
					</ul>
				</div>
				<!-- 郭玉清 -->
				
				<div title="个人管理" class="menu1"  data-options="iconCls:'icon-hamburg-user'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('学生个人信息','<%=path %>/sc/showStuHome');">个人信息</a></li>
					</ul>
				</div>
				<div title="系统管理" class="menu1"  data-options="iconCls:'icon-hamburg-settings'" style="padding:10px;">
					<ul>
						<li><a href="javascript:;" onclick="addTab('系统公告管理','<%=path %>/sc/showNoticeHome');">系统公告</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div data-options="region:'center'">
			<div id="tabs" class="easyui-tabs" style="width:100%;height:100%;">
				<div title="主页" style="padding:10px"  data-options="iconCls:'icon-hamburg-home'" style="padding:10px;">
					  <div style="margin-top: 30px;">
				   	 
				   	<div id="ban2">
					<div class="banner">
					<ul class="img">
					<s:iterator value="#session.notices" var="notice" status="s">
						<li>
						<s:if test="#s.index == 1">
						<div  style = "position:relative;top:210px;">
						    	<h3 style ="position:relative;left:235px;font:bolder; font-size: 28px;">${notice.name }</h3>
								<p style ="position:relative;left:60px;font-size: 19px;">${notice.des }</p>
								<p style="position:relative;font:bold;font-size: 14px;text-align: right;">
									${notice.emp.name }（宣）
								</p>
								<p style="text-align: center;font:bolder; font-size: 14px;">
									${notice.noticeDay }
								</p>
						</div>
						    	<img src="<%=path %>/images/qw.jpg">
						</s:if>
					<s:else>
					<div  style = "position:relative;top:210px;">
								<h3  style ="position:relative;left:235px;font:bolder; font-size: 28px;">${notice.name }</h3>
								<p style ="position:relative;left:60px;font-size: 19px;">${notice.des }</p>
								<p style="position:relative;font:bold;font-size: 14px;text-align: right;">
									${notice.emp.name }（宣）
								</p>
								<p style="text-align: center;font:bolder; font-size: 14px;">
									${notice.noticeDay }
								</p>
					</div>
								<img src="<%=path %>/images/qw.jpg">
					</s:else>						
						 </li>
					</s:iterator>
					    </ul>
					    
					    <ul class="num">   	  	
					    </ul>
					    <div class="btn btn_l">&lt;</div>
					    <div class="btn btn_r">&gt;</div>
					</div>
					</div> 


				   	 </div>
				</div>
			</div>
		</div>
		<div data-options="region:'south',split:false" class = "down">15秋预科班——宏图OA系统——项目组 二 版权所有</div>
		
	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseleft">关闭左边选项卡</div>
		<div id="mm-tabcloseright">关闭右边选项卡</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
	
	<script type="text/javascript">
	 	$(".out").mouseover(function(){		$(".btn").addClass("show").removeClass("hide");	})
	 	$(".out").mouseout(function(){		$(".btn").addClass("hide").removeClass("show");	})
	 	
	 	var i =0;
	 	var size = $(".img li").size();
	 	$(".img li").first().show();
	 	$(".num li").first().addClass("active");

	 	$(".out .num li").mouseover(function(){
	 		$(this).addClass("active").siblings().removeClass("active");
	 		var index = $(this).index();
	 		i = index;
	 		$(".img li").eq(i).fadeIn().siblings().fadeOut();
	 	})
	 	function moveR(){
	 		i++;
	 		if(i>size){			i = 0;		}
	 		$(".num li").eq(i).addClass("active").siblings().removeClass("active");
	 		$(".img li").eq(i).fadeIn().siblings().fadeOut();
	 	}
	 	function moveL(){
	 		i--;
	 		if(i<0){			i = size-1;		}
	 		$(".num li").eq(i).addClass("active").siblings().removeClass("active");
	 		$(".img li").eq(i).fadeIn().siblings().fadeOut();
	 	}
	</script>
</body>
</html>