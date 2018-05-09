<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="<%=basePath%>images/one.png">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
	
  </head>
  
  <body>
 <header>
       <div class="logo"><i class="fa fa-users"></i>EWORK</div>	    
    </header>
 
 <main class="bg">
     <s:form action="customer/customer_login2" method="post" cssClass="login">
	    <h3>login</h3>

	        <div class="form-group">
			    <div class="input-group">
	                <span class="input-group-addon"><i class="fa fa-user"></i></span>
	                <input type="text" name="customer.identification"  validation="required nameAvailable"  class="form-control" placeholder="请输入用户ID" required >
	           <span></span>
	            </div>
	             
		        <div class="input-group">
			        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
				    <input type="password" name="customer.password"  validation="password" class="form-control" placeholder="请输入密码" required >
		       <span></span>
		        </div>
		     </div>
		    
		<button type="submit" class="btn btn-success btn-login">登录</button>
		<span>还没有账号？立即</span><a href="reg.jsp" >注册</a>
	</s:form>
</main> 
  </body>
</html>
