var edit_win;
var edit_form;
var add_win;
var add_form;
var datagrid;
var empsDatagrid;
/*var jsonStr = '{"goodsType.goodsTypeId":"_id","goodsType.name":"_name","goodsType.des":"_des","goodsType.status":"_status"}';*/

var jsonStr = '{"department.depId":"_id","department.name":"_name","department.des":"_des","department.status":"_status","department.employee.empId":"_empId","department.employee.name":"_empName"}';



function frostEditedit(datagrid ,index){
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		if(row.status){
			row.status=0;
		}else {
			row.status=1;
		}
		var jsonStr = JSON.stringify(row)
}
	
	/**
	 * 工具类的方法
	 * @returns
	 */
	
	function showAdd(){
		$("#"+add_form).form("clear");
		$("#"+add_win).window("open");
	}
	
	function curEdit(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var edit= "<a href='javascript:;' onclick= 'showEdit(" +index + ")'>修改 </a>";
		if(row.status == 0){
			var del = "<a href='havascript:;' onclick ='updStatus(" + index + ")'>激活</a>";
		}else {
			var del = "<a href='havascript:;' onclick ='updStatus(" + index + ")'>冻结</a>";
		}
		return edit + del;
	}
	
	function showEdit(index){
		var row = $("#"+datagrid).datagrid("getSelected");
		if((index+1)) {
			row = null;
			$("#"+datagrid).datagrid("selectRow",index);
			row = $("#"+datagrid).datagrid("getData").rows[index];
		}
		if(row.empId==null){
			row.empId="";
			row.empName = "";
		}
		var jsonStr1 = jsonStr.replace("_id", row.depId).
		replace("_name", row.depName).
		replace("_des", row.des).
		replace("_status", row.status).
		replace("_empId",row.empId).
		replace("_empName",row.empName);
		
		if(row){
			var jsonStr1 = jsonStr.replace("_id", row.depId).replace("_name", row.depName).replace("_des", row.des).replace("_status", row.status).replace("_empName", row.empName).replace("_empId",row.empId);
			$("#"+edit_form).form("load",JSON.parse(jsonStr1));
			$("#"+edit_win).window("open");
		}else {
			if(!(index+1)) {
				$.messager.alert("提示","请选择要修改的商品","info");
			}
		}
	}
	
	function edit(edit_grid,edit_form){
		
	}
	

	
	function editCur() {
		var row = $("#dg").datagrid("getSelected");
		
	}
	
	function exitWin(id){
		$("#"+id).window("close");
	}
	
	function add(url){
		if($("#"+add_form).form('validate')){
			$.post(url,$("#"+add_form).serialize(),
				function(data) {
					if(data.reqMsg!=null){
						if(data.reqMsg.code==200){
							console.log("is 200")
							$("#"+add_win).window("close");
							$("#"+add_form).form("clear");
							$("#"+datagrid).datagrid("reload");
						}else{
							console.log("is 500")
						}
						alertMsg(data.reqMsg.message);
					}
				},"json"		
			)
		}
	}
	function alertMsg(message){
		$("#alertMsg").html("<p align='center' >"+message+"</p>");
		$("#alertMsg").slideDown(500);
		setTimeout("$('#alertMsg').slideUp(500)",1500)
	}
	
	function upd(url){
		$.post(url,$("#"+edit_form).serialize(),
				function(data) {
					$("#"+edit_win).window("close");
					$("#"+datagrid).datagrid("reload");
				},"json"		
				)
	}
	
	function selEmpBtn(value,row,index) {
		var str = "<a class='easyui-linkbutton' href='javascript:;' onclick= 'selEmp(" +index + ")'>任命为经理 </a>";
		return str;
	}
	
	function selEmp(index) {
		var row = $("#"+empsDatagrid).datagrid("getData").rows[index];
		$("#depEmpId").val(row.empId);
		$("#depEmpName").val(row.empName);
		
		$("#emps").window("close")
	}
	
	
	
	
	function doquery(id){
	$("#"+datagrid).datagrid("load",{
			weekday: $("#"+id).val()
		})
	}


	/*
	 * 时间格式页面上的开始
	 */
	
	function myformatter(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
	function myparser(s){ 
		if (!s) return new Date();
		var ss = (s.split('-'));
		var y = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var d = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
			return new Date(y,m-1,d);
		} else {
			return new Date();
		}
	}
	
	function myformatter1(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		var h = date.getHours();
		var mm = date.getMinutes();
		var ss= date.getSeconds();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+ ' ' + (h<10?('0'+h):h) + ":"+(mm<10?('0'+mm):mm) + ":" +  (ss<10?('0'+ss):ss);
	}
	function myparser1(s){
		if (!s) return new Date();
		var dateAndTime = (s.split(' '));
		var date = dateAndTime[0];
		
		var dateStr = (date.split('-'));
		var y = parseInt(dateStr[0],10);
		var m = parseInt(dateStr[1],10);
		var d = parseInt(dateStr[2],10);
		
		var time = dateAndTime[1];
		var timeStr = (time.split(':'));
		
		var h = parseInt(timeStr[0],10);
		var M = parseInt(timeStr[1],10);
		var s = parseInt(timeStr[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d) && !isNaN(h) && !isNaN(M) && !isNaN(s)){
			return new Date(y,m-1,d,h,M,s);
		} else {
			return new Date();
		}
	}
	

//	时间格式页面上的结束
	
//下拉基本信息
	function selectEmps(comboboxId,path) {//下拉员工
		$.getJSON(path + "/employee/selectEmps",function (data) {
			$("#"+comboboxId).combobox({	data:data.emps,textField:"value",valueField:"key"})
		})
	}
	

	
//格式化列
	function statuFormat(value,row,index) {
		if(value=='2'){
			return '已通过';
		}else if(value=='1'){
			return '未通过';
		}else {
			return '未审核';
		}
	}
	function frostEdit(value,row,index) {
		if(value ==0) {
		var str = "<p>不可用 </p>";
		}else {
		var str = "<p'>可用</p>";
		}
		return str;
	}
	function doSome(value,row,index) {
		var but1 = "<a href='javascript:;' class= 'easyui-linkbutton' onclick = 'upd1("+index+",1)'>通过</a>";
		var but2 = "<a href='javascript:;' class= 'easyui-linkbutton' onclick = 'upd2("+index+",0)'>不通过</a>";
		return but1+"<br />"+ but2;
	}
	
	function dateFor(value){
		var re = /^\d{4}-\d{1,2}-\d{1,2}/;
		return value.match(re);
	}
	function timeFormate(value,row,index){
		var re = /\d{1,2}:\d{1,2}:\d{1,2}/;
		if(value!=''&&value!=null){
			return value.match(re);
		}
		return '';
	}	
	function dateTimeFormat(value,row,index){
		var dateStr = dateFor(value);
		var timeStr = timeFormate(value,row,index);
		return dateStr + " " + timeStr;
	}
	
	function dateFormat(value,row,index){
		
		if(value!=''&&value!=null){
			return dateFor(value);
		}
		return '';
	}
	

	
	function doLeave(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		if(row.pass==0) {
			var but1 = "<a href='javascript:;' class= 'easyui-linkbutton' onclick='updatePass("+index+",2)'>通过</a>";
			var but2 = "<a href='javascript:;' class= 'easyui-linkbutton' onclick = 'updatePass("+index+",1)' >不通过</a>";
			return but1+but2;
		}else {
			if(row.pass==1){
				return "未通过" 
			}else {
				return "已通过"
			}
		}
	}
	

	
	function leaveTimeFormat(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var re = /^\d{4}-\d{1,2}-\d{1,2}/;
		var tim = /\d{1,2}:\d{1,2}:\d{1,2}/;
		var startDat = row.startTime.match(re);
		var strTim = row.startTime.match(tim);
		var endDat = row.endTime.match(re);
		var endTim = row.endTime.match(tim);
		
		var start = startDat+" " + strTim;
		var end = endDat + " " + endTim;
		
		return start + "\n" + end;
	}
	
	
	function leaveFormat(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var first = row.firstLeave;
		var second = row.secondLeave;
		var pass = row.pass;
		var s = "";
		if(pass==0){//未通过的只有第一审过与第一级没有审过
			if(first==1){
				s = "<div style='height:4px;background:linear-gradient(to right, rgb(255, 188, 0) 0%, rgb(255, 188, 0) 50%,rgba(255, 188, 0,0) 50%,rgba(255, 188, 0,0) 100%'></div>"
			}else {
				s = "<div style='height:4px;background:linear-gradient(to right, rgb(26, 188, 156) 0%, rgb(26, 188, 156) 5%,rgba(255, 188, 0,0) 5%,rgba(255, 188, 0,0) 100%'></div>"
			}
			
		}else {
			if(pass==1){//通过
				s = "<div style='height:4px;background:linear-gradient(to right, rgb(200, 30, 0) 0%, rgb(200, 30, 0) 100%'></div>"
			}else {//未通过
				s = "<div style='height:4px;background:linear-gradient(to right, rgb(26, 188, 156) 0%, rgb(26, 188, 156) 100%'></div>"
			}
		}
		return s;
	}
	
	function dat(value,row,index) {
		console.log(value)
		if(value == "1") {
			return "星期一"
		}if(value == "2") {
			return "星期二"
		}if(value == "3") {
			return "星期三"
		}if(value == "4") {
			return "星期四"
		}if(value == "5") {
			return "星期五"
		}if(value == "6") {
			return "星期六"
		}if(value == "7") {
			return "星期天"
		}
			
	}
	/**
	 * 文件上传
	 * showUpload 显示上传窗口
	 * closeUpload 关闭上传窗口
	 */
	function showUpload(){
		$("#upload_win").window("open");
	}
	function closeUpload(){
		document.getElementById('fileImport').value=null;
		document.getElementById('fileName').innerHTML="";
		document.getElementById('uploadInfo').innerHTML="";
		$("#upload_win").window("close");
	}
	
	
	function importFileClick(url) {
		//获取上传文件控件内容
		var file = document.getElementById('fileImport').files[0];
		//判断控件中是否存在文件内容
		//http://www.cnblogs.com/mora1988/p/5546489.html
		if(file==null){alert('错误,请选择文件');return;}
		//获取文件名称 
		var fileName = file.name;
		//获取文件类型名称
		var file_typename = fileName.substring(fileName.lastIndexOf('.'),fileName.length);
		//这里上传文件类型必须为.xls,如果文件类型不符,提示错误信息
		if(file_typename=='.xlsx' || file_typename == '.xls'){
			//计算文件大小
			var fileSize= 0;
			//如果文件大小大于 1024*1024,则显示文件大小单位为MB,否则为kb
			if(file.size >1024*1024) {
				fileSize = Math.round(file.size*100/(1024*1024))/100;
				if(fileSize>10){
					alert('错误,文件超过10MB,禁止上传!');return ;
				}
				fileSize = fileSize.toString+"MB";
			}else {
				fileSize = (Math.round(file.size*100/1024)/100).toString()+"KB";
			}
			
			//将文件名和文件大小显示在前端label文件中
			document.getElementById('fileName').innerHTML="<span style='color:Blue'>文件名:"+ file.name+ ",大小:"+ fileSize + "</span>";
			//获取form数据
			var formData = new FormData($("#importFileForm")[0]);
			//调用后台action方法,将form数据传递给后台处理,contentType必须设置为false,否则
			$.ajax({
				url:url,
				type:'POST',
				data:formData,
				async:false,
				cache:false,
				contentType:false,
				processData:false,
				success:function(returnInfo){
					document.getElementById('fileImport').value=null;
					document.getElementById('uploadInfo').innerHTML="<span style='color:Green'>上传成功</span>";
					$("#"+datagrid).datagrid("reload");
				},
				error:function(returnInfo){
					//上传失败时显示上传失败信息
					document.getElementById('uploadInfo').innerHTML="<span style='color:Red'>上传失败</span>";
				}
			});
		}else {
			alert("文件类型错误");
			//将错误信息显示在前端label文本中
			document.getElementById('fileName').innerHTML= "<span style='color:Red'>错误提示:上传文件应该是.xlsx后缀而不应该是" + file_typename + ",请重新选择文件</span>";
			
		}
	}
	
	//地址三级联动
	 var addressInit = function(url,_cmbProvince, _cmbCity, _cmbArea, defaultProvince, defaultCity, defaultArea)  
	 {  
	     var cmbProvince = document.getElementById(_cmbProvince);  
	     var cmbCity = document.getElementById(_cmbCity);  
	     var cmbArea = document.getElementById(_cmbArea);  
	       
	     function cmbSelect(cmb, str)  
	     {  
	         for(var i=0; i<cmb.options.length; i++)  
	         {  
	             if(cmb.options[i].value == str)     {  
	                 cmb.selectedIndex = i;  
	                 return;  
	             }  
	         }  
	     }  
	     function cmbAddOption(cmb, str, obj)  
	     {  
	         var option = document.createElement("OPTION");  
	         cmb.options.add(option);  
	         option.innerText = str;  
	         option.value = str;  
	         option.obj = obj;
	     }  
	       
	     function changeCity()  
	     {  
	         cmbArea.options.length = 0;  
	         if(cmbCity.selectedIndex == -1)return;  
	         var item = cmbCity.options[cmbCity.selectedIndex].obj;  
	         for(var i=0; i<item.area.length; i++)  
	         {  
	             cmbAddOption(cmbArea, item.area[i], null);
	         }  
	         cmbSelect(cmbArea, defaultArea);  
	     }  
	     function changeProvince()  
	     {  
	         cmbCity.options.length = 0;  
	         cmbCity.onchange = null;  
	         if(cmbProvince.selectedIndex == -1)return;  
	         var item = cmbProvince.options[cmbProvince.selectedIndex].obj; 
	         for(var i=0; i<item.city.length; i++)  
	         {  
	             cmbAddOption(cmbCity, item.city[i].name, item.city[i]);  
	         }  
	         cmbSelect(cmbCity, defaultCity);  
	         changeCity();  
	         cmbCity.onchange = changeCity;  
	     }  
	       $.get(url,function(data){
	    	  for(var i=0; i<data.length; i++){  
	 	         cmbAddOption(cmbProvince, data[i].name, data[i]);  
	 	         cmbSelect(cmbProvince, defaultProvince);  
	 		     changeProvince();  
	 		     cmbProvince.onchange = changeProvince;  
	 	     }	  
	      },"json") 
	}
	
	 
	 /**
	  * 部门角色级联
	  */
	 var depRole=function(url,selDepId,selRoleId,defaultDel, defaultRole){
	 	var selDept= document.getElementById(selDepId);
	 	var selRole = document.getElementById(selRoleId);
	 	
	 	function select(selbox,str){
	 		for(var i = 0; i<selbox.length;i++){
	 			if(selbox.options[i].value==str){
	 				selbox.selectedIndex=i;
	 				return;
	 			}
	 		}
	 	}

	 	function selAddOption(selbox,str,obj){
	 		var option = document.createElement("OPTION");
	 		selbox.options.add(option);
	 		option.innerText=str;
	 		option.value=str;
	 		option.obj = obj;
	 	}
	 	
	 	function changeDept(index){
	 		$.get("/OA/dep/checkDepEmp?depName="+selDept.options[selDept.selectedIndex].value,function(data){
	 			selRole.options.length=0;
		 		selRole.onchange=null;
		 		if(selDept.selectedIndex ==-1) {return;}
	 			if(data.reqMsg.code==500){
	 				$(".selMsg").addClass("show").removeClass("none")
	 				$(".selMsg").text("无法设置"+selDept.options[selDept.selectedIndex].value+"成员,"+data.reqMsg.message).stop().fadeIn();
	 				setTimeout("$('.selMsg').fadeOut()",1000);
	 				selDept.selectedIndex = 4;
	 			}
		 		var item = selDept.options[selDept.selectedIndex].obj;
		 		for(var i = 0;i<item.role.length;i++){
		 			selAddOption(selRole,item.role[i],null);
		 		}
		 		select(selRole,item[0]);
	 		})
	 	}											
	 	$.get(url,function(data){
	 		for(var i = 0;i<data.length;i++){
	 			selAddOption(selDept,data[i].name,data[i]);
	 			select(selDept,data[0].name,defaultDel);
	 			changeDept();
	 			selDept.onchange=changeDept;
	 		}
	 	});
	 }

	 
	 
//	添加员工时,验证手机号是否可用
	 function checkPhone(event){
		 /*event.data.url
		 event.data.inputId*/
		 var phone = $("#"+event.data.inputId).val(); 
		 var url = event.data.url;
		 var inputId= event.data.inputId;
		 var msgTagId = event.data.msgTagId;
		 $.get(url+"?phone="+phone,function(data){
			 var code = data.reqMsg.code;
			 if(code==200) {
				 $("#"+msgTagId).text("");
			 }else {
				 $("#"+inputId).addClass("validatebox-invalid");
				 $("#"+msgTagId).text(data.reqMsg.message);
			 }
		 })
	 }
	 
	 //根据出生日期计算年龄
	 function bir2age(birthday){
			var birth= new Date(dateFor(birthday));
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
			return age;
	 }
//session中的用户信息转成JSON对象
	 /**
	  * 输入session中的一个对象字符串,也就是java中的toString,返回相应的对象
	  */
	 function str2JsonStr(sou){
		  sou=sou.
		  replace(/^\w* /g,"").
		  replace(/==/g,"$").
		  replace(/:/g,"^").
		  replace(/=/g,":").
		  replace(/[$]/g,"==").
		  replace(/\[/g,"{").
		  replace(/\]/g,"}").
		  replace(/{/g,"{\"").
		  replace(/ :/g,":").
		  replace(/:/g,"\":\"").
		  replace(/,/g,"\",\"").
		  replace(/}/g,"\"}").
		  replace(/ "/g,"\"").
		  replace(/," /g, ",\"").
		  replace(/"\[/g,"[").
		  replace(/\^/g,":");
		  return JSON.parse(sou);
	  }
	 
	 
	 //employee.jsp所用的方法
	 function showEmpAllMsg(url,index) {
			var row = $("#"+datagrid).datagrid("getData").rows[index];
			$.get(url,{
				empId:row.empId
			},function(data){
				var status = '';
				var married='';
				var employee = data.employee;
				console.log(employee.name)
					if(employee.resignDay==null){employee.resignDay ="暂无"}
					if(employee.birthday==null){employee.birthday=""}else{employee.birthday= bir2age(employee.birthday);}
					if(employee.department.name==null){employee.department.name="暂无"}
					if(employee.email==null){employee.email="暂无"}
					if(employee.gender==null){employee.gender="暂无"}
					if(employee.hireDay==null){employee.hireDay="暂无"}
					if(employee.name==null){employee.name="暂无"}
					if(employee.nation==null){employee.nation="暂无"}
					if(employee.resignDay==null){employee.resignDay="暂无"}
					if(employee.empId==null){employee.empId="暂无"}
					if(employee.idCard==null){employee.idCard=""}
					if(employee.fingerNo==null){employee.fingerNo="暂无"}
					if(employee.phone==null){employee.phone="暂无"}
					if(employee.qq==null){employee.qq="暂无"}
					if(employee.weChat==null){employee.weChat="暂无"}
					if(employee.contactName==null){employee.contactName="暂无"}
					if(employee.contactPhone==null){employee.contactPhone="暂无"}
					if(employee.college==null){employee.college="暂无"}
					if(employee.major==null){employee.major="暂无"}
					if(employee.eduBack==null){employee.eduBack="暂无"}
					if(employee.bankName==null){employee.bankName="暂无"}
					if(employee.accountName==null){employee.accountName="暂无"}
					if(employee.accountNo==null){employee.accountNo="暂无"}
					if(employee.alipay==null){employee.alipay="暂无"}
					if(employee.status==null){employee.status="暂无"}
					if(employee.role.name==null){employee.role.name="暂无"}
					if(employee.address==null){employee.address="暂无"}
				if(employee.status=='1') {				status = "在职"			}else {				status = "离职"			}
				if(employee.married=='1'){married='已婚'}else {married="未婚"}
				 var jsonStr1 = jsonStr.
				 replace("_birthday", employee.birthday).
				 replace("_depName", employee.department.name). 
				 replace("_email", employee.email).
				 replace("_gender", employee.gender).
				 replace("_hireDay", employee.hireDay).
				 replace("_name", employee.name).
				 replace("_nation", employee.nation).
				 replace("_resignDay", employee.resignDay).
				 replace("_status", status).
				 replace("_empId",employee.empId).
				 replace("_pwd",employee.pwd).
				 replace("_idCard",employee.idCard).
				 replace("_fingerNo",employee.fingerNo).
				 replace("_phone",employee.phone).
				 replace("_qq",employee.qq).
				 replace("_weChat",employee.weChat).
				 replace("_married",married).
				 replace("_contactName",employee.contactName).
				 replace("_contactPhone",employee.contactPhone).
				 replace("_college",employee.college).
				 replace("_major",employee.major).
				 replace("_eduBack",employee.eduBack).
				 replace("_bankName",employee.bankName).
				 replace("_accountName",employee.accountName).
				 replace("_accountNo",employee.accountNo).
				 replace("_alipay",employee.alipay).
				 replace("_accountNo",employee.accountNo).
				 replace("_hireDay",employee.hireDay).
				 replace("_resignDay",employee.resignDay).
				 replace("_status",employee.status).
				 replace("_roleName",employee.role.name).
				 replace("_address",employee.address).
				 replace("_birthday",employee.birthday).
				 replace("_empHireDay",employee.hireDay)
				$("#msg").form("load",JSON.parse(jsonStr1));
			},"json")
			$("#show_win").window("open");
		}
	 
	//富文本方法
	 function func(fun,bol,val){
			var iframe = frames['full'];
			iframe.document.execCommand(fun,bol,val);
	}
	 
	//判断一个值是否为null,是则返回"",否则返回值本身
	 function valIsNull(val){
		 if(val==null){
			 return "";
		 }
		 return val;
	 }
	 
	 
	//session中的用户信息转成JSON对象
	 /**
	  * 输入session中的一个对象字符串,也就是java中的toString,返回相应的对象
	  */
	 function str2JsonStr(sou){
		  sou=sou.
		  replace(/^\w* /g,"").
		  replace(/==/g,"$").
		  replace(/:/g,"^").
		  replace(/=/g,":").
		  replace(/[$]/g,"==").
		  replace(/\[/g,"{").
		  replace(/\]/g,"}").
		  replace(/{/g,"{\"").
		  replace(/ :/g,":").
		  replace(/:/g,"\":\"").
		  replace(/,/g,"\",\"").
		  replace(/}/g,"\"}").
		  replace(/ "/g,"\"").
		  replace(/," /g, ",\"").
		  replace(/"\[/g,"[").
		  replace(/\^/g,":");
		  return JSON.parse(sou);
	  }