<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- <link rel="stylesheet" href="css/simple-line-icons.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/templatemo_style.css">-->
	<link rel="stylesheet" href="css/one.css">
  </head>
  <style>
  input { 
	width: 110%; 
	height:50px;
	margin-bottom: 10px; 
	background: rgba(0,0,0,0.3);
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	
}
 @import url(https://fonts.googleapis.com/css?family=Open+Sans);
.btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
.btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
.btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
.btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
.btn-primary.active { color: rgba(255, 255, 255, 0.75); }
.btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
.btn-block { width: 100%; display:block; margin: 15px 25px 18px 1px;}

* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

  </style>
  <body>
     <div class="header">
    <!-- bar start -->
    <div class="bar">
        <div class="in">
            
            <span class="l">|</span>
            <div class="app">
                <ul>
                    <li><em class="e_icon"></em>EWORK<em class="icon_arrow"></em></li>
                </ul>
            </div>
            <p class="rlk">
                <a href="https://jobs.51job.com" target="_blank">招聘信息</a>
                <span class="l">|</span>
                <a href="https://ehire.51job.com" target="_blank">企业服务</a>
            </p>
            <!-- 添加的搜索方法，需要调整位置 -->
                <div class="search">
                    <form action="message/message_queryMessage" method="post" class="form-inline">
                       <input type="text" name="keyWords" class="form-control" placeholder="请输入关键词" style="width:250px">
                       <button type="submit" class="btn btn-default">查询</button>    
                    </form>
                </div>
            <div class="uer">
                    <p class="op">
                    <c:choose>
                    <c:when test="${session.customer.name==null}">
                        <a href="login.jsp" rel="external nofollow">登录</a> / <a href="reg.jsp" rel="external nofollow">注册</a>
                        </c:when>
                        <c:otherwise>
                        <c:choose>
                          <c:when test="${session.customer.ifcustomer==1}">
                          <a href="#"><c:out value="${session.customer.name}"></c:out>　欢迎您</a>/<a href="main/main_re">注销</a>
                          </c:when>
                        <c:otherwise>
                         <a href="#"><c:out value="${session.customer.name}"></c:out>　欢迎您</a>/<a href="main/main_re">注销</a>
                        </c:otherwise>
                        </c:choose>
                        </c:otherwise>
                        </c:choose>
                    </p>
                
            </div>
        </div>
    </div>
    <div class="nag" id="topIndex">
        <div class="in">
           <img class="logo" id="logo" width="66" height="46" src="images/logo.png" alt="前程无忧">
                <img class="slogen" id="slogen"  height="46"  src="images/pp.png">
            
            <p class="nlink">
            <c:choose>
            <c:when test="${session.customer.name==null}">
            <a class="on" href="main.jsp">首页</a>
            <a class="" href="#">关于我们</a>
            <a class="" href="#">成果展示</a>
            <a class="" href="#">公司优势</a>
            <a class="" href="#">联系我们</a>
            </c:when>
            <c:otherwise>
            <c:choose>
            <c:when test="${session.customer.ifcustomer==1}">
            <a class="" href="main.jsp">首页</a>
            <a class="" href="message/message_queryMessage?keyWords=">我的工作</a>
            <a class="" href="customerorder/customerorder_editOrder?key=${session.customer.customerid}">我的预约</a>
            <a class="on" href="Customer_message.jsp">我的信息</a>
            <a class="" href="#">联系我们</a>
            </c:when>
            <c:otherwise>
            <a class="on" href="main.jsp">首页</a>
            <a class="" href="message/message_queryMessage?keyWords=">工作</a>
            <a class="" href="message/message_fwork?message.fid=${session.customer.customerid}">我发布的工作</a>
            <a class="" href="customerorder/customerorder_editOrder2?key=${session.customer.customerid}">回应</a>
            <a class="" href="Customer_message.jsp">我的信息</a>
            </c:otherwise>
            </c:choose>
            </c:otherwise>
            </c:choose>
    </p>        
   </div>
   </div>
   </div>
<main class="container-fluid">
    <div class="row">
        <div class="col-md-10">
            <s:form action = "customer/customer_editCustomer" cssClass="form-horizontal"  enctype="multipart/form-data" method="post">
            <s:hidden name="orginphoto" value="%{#session.customer.customerphoto}"></s:hidden>
            <s:hidden name="customer.identification" value="%{#session.customer.identification}"></s:hidden>
            <s:hidden name="customer.customerid" label="id" value="%{#session.customer.customerid}"></s:hidden>   
               <div class="panel-heading">
                 
                    <h1 style="text-align:center"></i>编辑</h1>
                 
               </div>
               <div class="panel-body">
                   <div class="form-group">
                     <label class="control-label col-md-3">名称</label>
                     <div class="col-md-4">
                        <input type="text" name="customer.name" value="${session.customer.name}" class="form-control input-sm" required>
                     </div>
                   </div>
                   <div class="form-group">
                     <label class="control-label col-md-3">地址</label>
                     <div class="col-md-4">
                        <input type="text" name="customer.customeradress" value="${session.customer.customeradress}" class="form-control input-sm" required>
                     </div>
                   </div>
                   <div class="form-group">
                     <label class="control-label col-md-3">联系方式</label>
                     <div class="col-md-4">
                        <input type="text" name="customer.customercontact"  value="${session.customer.customercontact}" class="form-control input-sm" required>
                     </div>
                   </div>

                   <div class="form-group">
                     <label class="control-label col-md-3">密码</label>
                     <div class="col-md-4">
                       <input type="text" name="customer.password"  value="${session.customer.password}" class="form-control input-sm" required>
                     </div> 
                   </div>
                   
                   <div class="form-group">
                   <label class="control-label col-md-3">用户类别</label>
                      <div class="col-md-4">
                      
                      <select name="flag" class="form-control">
			                <option>我是应聘方</option>
                            <option>我是招聘方</option>
		              </select>
		              </div>
                   </div>
                   <div class="form-group">
                      <label class="control-label col-md-3">我的头像</label>
                      <div class="col-md-4">
                         <div class="fileupload fileuoload-new" data-provides="fileuoload">
                            <div class="fileupload-new thumbnail" style="width:200px; height:150px">
                               <img src="<%=basePath%>upload/customerp/${customer.customerphoto}" alt="" />
                            </div>
                            <div class="fileupload-previw fileupload-exists thumbnail" style="max-width:200px;max-height:150px;line-height:20px">
                            </div>
                            <div>
                                <span class="btn btn-file btn-primary">
                                    <span class="fileupload-new">浏览</span>
                                    <span class="fileupload-exists">浏览</span>
                                    <input type="file" name="customerphoto"/>
                                    <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>
                                </span>       
                            </div>
                         </div>
                      </div>
                   </div>
                   <div class="form-group col-md-3">
                       <button type="submit" class="btn btn-success pull-right">提交</button>
                                      
                   </div>
               </div>
            </s:form>
        </div>
    </div>
 </main>
 <!--<center>
  	<div>  
 	  <s:form  action ="customer/customer_editCustomer" enctype="multipart/form-data">
         <h3><s:textfield name="customer.name" label="姓　名" ></s:textfield></h3>
         <h3><s:textfield name="customer.customeradress" label="住　址"></s:textfield></h3>
         <h3><s:textfield name="customer.customercontact" label="联系方式"></s:textfield></h3>
         <h3><s:hidden name="customer.customerphoto" label="照　片"  value="%{#session.customer.customerphoto}"></s:hidden></h3>
         <h3><s:hidden name="customer.identification" label="照　片" value="%{#session.customer.identification}"></s:hidden></h3>
         <h3><s:textfield name="customer.password" label="密　码"></s:textfield></h3>
         <h3><s:hidden name="customer.customerid" label="id" value="%{#session.customer.customerid}"></s:hidden></h3>
         <h3><select name="flag" class="form-control">
			   <option>我是应聘方</option>
               <option>我是招聘方</option>
		</select></h3>
		<input type="file" name="customerphoto">
		
         <s:submit value="保存" cssClass="btn btn-primary btn-block btn-large" style="width: 60%;"></s:submit>
       </s:form>
     </div>
 </center>-->
 <footer class="site-footer container text-center">
		<div class="row">
			<div class="col-md-12 copyright">
				<p>Copyright &copy; 2018 <a href="#">Company Name:E Work</a></p>
			</div>
		</div>
	</footer>
	<span class="border-top"></span>
	<span class="border-left"></span>
	<span class="border-right"></span>
	<span class="border-bottom"></span>
	<span class="shape-1"></span>
	<span class="shape-2"></span>

	<script src="js/jquery.min.js"></script>
	<script src="js/templatemo_custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-fileupload.js"></script>
 </body>
 </html>