<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bwlk.pojo.Admin" %> 
<%@ page import="com.bwlk.pojo.DormManager" %>
<%@ page import="com.bwlk.pojo.Student" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>学生宿舍管理系统登录</title>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	
	function checkForm(){
		var userName=document.getElementById("userName").value;
		var password=document.getElementById("password").value;
		var rPassword=document.getElementById("rPassword").value;
		var dormBuildId=document.getElementById("dormBuildId").value;
		var name=document.getElementById("name").value;
		var sex=document.getElementById("sex").value;
		var tel=document.getElementById("tel").value;
		if(userName==""||password==""||rPassword==""||name==""||sex==""||tel==""||dormBuildId==""){
			document.getElementById("error").innerHTML="信息填写不完整！";
			return false;
		} else if(password!=rPassword){
			document.getElementById("error").innerHTML="密码填写不一致！";
			return false;
		}
		return true;
	}
</script>

<style type="text/css">
	  body {
        padding-top: 200px;
        padding-bottom: 40px;
        background-image: url('images/bg.jpg');
        background-position: center;
		background-repeat: no-repeat;
		background-attachment: fixed;
      }
      
      .radio {
      	padding-top: 10px;
       	padding-bottom:10px;
       	padding-left: 0px;
      }
      
      .form-signin-heading{
      	text-align: center;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 0px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
</style>

</head>
<body>
<div class="container">
<div style="text-align: center;font-size: 20px;color: red;">${msg}</div>
     <form action="savestudent" class="form-signin" method="post" onsubmit="return checkForm()">
			<div class="data_form" >
				<input type="hidden" id="studentId" name="studentId" />
					<table align="center">
						<tr>
							<td><font color="red">*</font>学号：</td>
							<td><input type="text" id="userName"  name="stunum"   style="margin-top:5px;height:30px;" /></td>
						</tr>
						<tr>
							<td><font color="red">*</font>密码：</td>
							<td><input type="password" id="password"  name="password"   style="margin-top:5px;height:30px;" /></td>
						</tr>
						<tr>
							<td><font color="red">*</font>重复密码：</td>
							<td><input type="password" id="rPassword"  name="rPassword"   style="margin-top:5px;height:30px;" /></td>
						</tr>
						<tr>
							<td><font color="red">*</font>姓名：</td>
							<td><input type="text" id="name"  name="name"   style="margin-top:5px;height:30px;" /></td>
						</tr>
						<tr>
							<td><font color="red">*</font>性别：</td>
							<td>
								<select id="sex" name="sex" style="width: 90px;">
									<option value="">请选择...</option>
									<option value="男" >男</option>
									<option value="女" >女</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><font color="red">*</font>宿舍楼：</td> 
							<td>
								<select onchange="selectFunction()" id="dormBuildId" name="dormbuildname" style="width: 90px;"> 
									<option  value="-1" selected="selected" >-请选择-</option> 
									<c:forEach var="dormBuild" items="${dormBuilds}">  
										<option  value="${dormBuild.dormBuildName }" label="${dormBuild.dormBuildId }" >${dormBuild.dormBuildName }</option>
									</c:forEach>
								</select> 
							</td>
						</tr> 
						<tr>
							<td><font color="red">*</font>寝室：</td>
							<td>
							<select name="dormname"  id="secSelect" style="width: 155px"> 
							<option  value="-1" selected="selected" >-请选择-</option>  
							</select>
							</td>
						</tr>
						<tr>
							<td><font color="red">*</font>联系电话：</td>
							<td><input type="text" id="tel"  name="tel"   style="margin-top:5px;height:30px;" /></td>
						</tr>
					</table>
					<div align="center"> 
						<input type="submit" class="btn btn-success" style="margin-bottom: 20px" value="注册"/>
      					  <input class="btn btn-info" type="reset" style="margin-bottom: 20px" value="重置">
      					  <input class="btn btn-primary" style="margin-bottom: 20px" type="button" onclick="register()" value="返回登录">
      
					
					</div>
					<div align="center">
						<font id="error" color="red">${error }</font>
					</div>
			</div>
		</form>
      
      
     
</div>
<script type="text/javascript">
	function register() {
		window.location.href="login.jsp"
	}
	
	function selectFunction() { 
		  var dormBuild = document.getElementById("dormBuildId");
		  var secSelect = document.getElementById("secSelect");
		  secSelect.options.length = 0; 
			var value =dormBuild.options[dormBuild.selectedIndex].label; 
			if (value !=-1) {
				
				 $.post("${pageContext.request.contextPath}/getdorm",
						    {
						         "value" : value,
						 		 dataType: "json"
						     }, function(data) { 
						         if(data.length >0){ 
							  		for ( var i = 0; i < data.length; i++) { 
							          var oOption = document.createElement("OPTION");
							          oOption.value = data[i].dormName;
							          oOption.text = data[i].dormName;  
							          secSelect.options.add(oOption);
							         }
						  		}else{ 
						  			var oOption = document.createElement("OPTION");
									  oOption.text = "暂无宿舍";   
									  secSelect.options.add(oOption);
						  		}
						        }); 
				
				
				
			} 
		  
		  
	}

</script>
</body>
</html>