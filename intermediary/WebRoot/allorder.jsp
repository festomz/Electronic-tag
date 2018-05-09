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
	<link rel="stylesheet" href="css/simple-line-icons.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/templatemo_style.css">
  </head>
  
  <body>
<header class="site-header container animated fadeInDown">
		<div class="header-wrapper">
			<div class="row">
				<div class="col-md-4">
					<div class="site-branding">
						<a href="#"><h1>EWork</h1></a>					
					</div>
				</div>
				<a href="#" class="toggle-nav hidden-md hidden-lg">
					<i class="fa fa-bars"></i>
				</a>
				<div class="col-md-8">
					<nav id="nav" class="main-navigation hidden-xs hidden-sm">
						<ul class="main-menu">
			<c:choose>
			<c:when test="${session.customer.name==null}">
   		    <li><a class="show-1 active homebutton" href="#">  主页</a></li>
			<li><a class="show-2 aboutbutton" href="#">  关于我们</a></li>
			<li><a class="show-3 projectbutton" href="#">  成果展示</a></li>
			<li><a class="show-4 blogbutton" href="#">  公司优势</a></li>
			<li><a class="show-5 contactbutton" href="#">  联系我们</a></li>
			<div class="main-job" style="text-align: right;float:inline">
			<ul class="main-menu">
			<li><a href="login.jsp">登录</a></li>
			</ul>
             <li><s:form action="message/message_queryMessage" method="post">
            <input type="text" name="keyWords" placeholder="请输入关键词" >
         	<s:submit value="查 询" cssClass="btn btn-primary btn-block btn-large" style="width: 50%;margin: 10px -6px 10px 104px;"></s:submit>
             </s:form></li>
				
			</div>  			
   		</c:when>
   		<c:otherwise>
   		   <c:choose>
   		      <c:when test="${session.customer.ifcustomer==1}">	
		        	<li><a href="message/message_queryMessage?keyWords=">我的工作</a></li>
			        <li><a href="customerorder/customerorder_editOrder?key=${session.customer.customerid}">我的预约</a></li>
	         		<li><a href="Customer_message.jsp">我的信息</a></li>
	         		<div class="main-job" style="text-align: right">
			        <ul class="main-menu">
			        <li><span class="blue"><h4><c:out value="${session.customer.name}"></c:out>　欢迎您</h4></span></li>
                    <li><a href="main/main_re">注销</a></li>
				</ul>
			</div>  	
   		      </c:when>
   		      <c:otherwise>
   		            <li><a  href="message/message_queryMessage?keyWords=">工作</a></li>
   		            <li><a  href="message/message_fwork?message.fid=${session.customer.customerid}">我发布的工作</a></li>
   		            <li><a  href="customerorder/customerorder_editOrder2?key=${session.customer.customerid}">回应</a></li>
   		            <li><a  href="Customer_message.jsp">我的信息</a></li>
   		            <div class="main-job" style="text-align: right">
			        <ul class="main-menu">
			        <li><span class="blue"><h4><c:out value="${session.customer.name}"></c:out>　欢迎您</h4></span></li>
                    <li><a href="main/main_re">注销</a></li>
				</ul>
			</div> 
   		      </c:otherwise>
   		   </c:choose>

			
   		</c:otherwise>
   		
   	</c:choose>
   </div>
 </header>
     
    <center style=> 
     <table class="table table-striped table-bordered table-hover" id="dataTables-example">
       <thead>
          <tr>
             <th>订单号</th>
             <th>工作编号</th>
             <th>编号</th>
             <th>时间</th>
             <th>发布人编号</th>
             <th>状态</th>
          </tr>
       </thead>
       <tbody>
       <c:forEach var="customerorder" items="${customerorderList}" varStatus="status">
         <tr>
             <td>${customerorder.orderid}<!--<s:property value="customerorder.orderid"/>--></td>
             <td>${customerorder.jobid}</td>
             <td>${customerorder.id}</td>
             <td>${customerorder.time}</td>
             <td>${customerorder.fid}</td>
             <td>${customerorder.retime}</td>
          </tr>
       </c:forEach>
       <!--<s:iterator value="customerorderList" status="status">     
          <tr>
             <td><s:property value="customerorderList.orderid"/></td>
             <td><s:property value="customerorderList.jobid"/></td>
             <td><s:property value="customerorderList.id"/></td>
             <td><s:property value="customerorderList.time"/></td>
             <td><s:property value="customerorderList.fid"/></td>
             <td><s:property value="customerorderList.retime"/></td>
          </tr>
       </s:iterator>-->
     </tbody>
     
     </table>
     </center>
     
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/jquery.dataTables.js"></script>
    <script src="<%=basePath%>js/dataTables.bootstraps.js"></script>
    
    <script>
        $(document).ready(function(){
          $('#dataTables-example').dataTable({
             "language":{
                "lengthMenu":"每页_MENU_条记录",
                "zeroRecords":"没有找到记录",
                "info":"第_PAGE_页(共_PAGES_页)",
                "infoEmpty":"无记录",
                "infoFiltered":"(从_MAX_条记录过滤)",
                "sInfoPostFix":"",
                "sSearch":"搜索:",
                "sUrl":"",
                "sEmptyTable":"表中数据为空",
                "sLoadingRecords":"载入中...",
                "sInfoThousands":",",
                "oPaginate":{
                   "sFirst":"首页",
                   "sPrevious":"上页",
                   "sNext":"下页",
                   "sLast":"末页"
                },
                "oAria":{
                 "sSortAscending":":以升序为此列",
                 "sSortDescending":":以降序为此列"
                },
              }
          });
        });     
     
     </script>
  </body>
</html>
