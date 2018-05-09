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
	 <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	
	<!-- <link rel="stylesheet" href="css/templatemo_style.css">-->
	<link rel="stylesheet" href="css/one.css">
	
	
  </head>
  
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
            <!-- 添加的搜索方法，需要调整位置  --> 
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
            <a class="" href="main.jsp#aboutus">关于我们</a>
            <a class="" href="main.jsp#ourwork">成果展示</a>
            <a class="" href="main.jsp#advantages">公司优势</a>
            <a class="" href="main.jsp#touch">联系我们</a>
            </c:when>
            <c:otherwise>
            <c:choose>
            <c:when test="${session.customer.ifcustomer==1}">
            <a class="on" href="main.jsp">首页</a>
            <a class="" href="message/message_queryMessage?keyWords=">我的工作</a>
            <a class="" href="customerorder/customerorder_editOrder?key=${session.customer.customerid}">我的预约</a>
            <a class="" href="Customer_message.jsp">我的信息</a>
            <a class="" href="main.jsp#touch">联系我们</a>
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
   <div id="circleContent" class="carousel slide"> 
       <ol class="carousel-indicators"> 
         <li data-target="#circleContent" data-slide-to="0" class="active"></li> 
         <li data-target="#circleContent" data-slide-to="1"></li> 
         <li data-target="#circleContent" data-slide-to="2"></li> 
       </ol> 
           <div class="carousel-inner"> 
               <div class="item active"> 
                    <img src="images/index3.jpg" style="width:1000px;height:510px;margin:0 auto"> 
                         <div class="carousel-caption"> 一步到位，轻松找到好工作</div> 
               </div> 
           <div class="item"> 
                    <img src="images/index4.jpg" style="width:1000px;height:510px;margin:0 auto"> 
                         <div class="carousel-caption">外物之味，久则可厌，读书之味，愈久愈深</div> 
               </div> 
           <div class="item"> 
                    <img src="images/index1.jpg" style="width:1000px;height:510px;margin:0 auto"> 
                          <div class="carousel-caption">真理的大海，让未发现的一切事物躺卧在我的眼前，任我去探寻</div> 
                </div>
          </div>
        <a class="carousel-control left" href="#circleContent" data-slide="prevent">‹</a> 
        <a class="carousel-control right" href="#circleContent" data-slide="next">›</a> 
    </div> 
    <div class="cresume">
		<a href="Customer_message.jsp">立即创建简历，发现好工作<em class="e_icon"></em></a>
		<img src="images/pen_32px_504846_easyicon.net.png" style="width:20px">
	</div>	
          
  

 <div id="menu-container">
		<div id="menu-1" class="homepage home-section container">
			<div class="home-intro text-center">
				<h2 class="welcome-title animated fadeInLeft">Introduction</h2>
				<p class="animated fadeInRight"><span class="blue">E work</span>，为您提供海量招聘信息，不管是销售，还是服务，不管是设计还是创业，我们都将为您提供。<span class="blue">E work</span>绝对是您的事业之舟上一盏永不熄灭的<span class="green">明灯</span>，一个永不错误的<span class="green">罗盘</span>。</p>
			</div>
			<div class="home-projects">
				<div class="row">
					<div class="col-md-6 col-sm-12">
						<div class="project-title animated fadeInUp">
							<h2>近  期  成  就</h2>
							<p>从E work开始至今，越来越多的人在E work上注册了账户，也有越来越的招聘方发布更多的招聘信息，E work也在这些契机中站稳脚步，砥砺前行，从黑暗中斩落荆棘，向着的黎明进发。<br><br>目前，E work已为各个招聘方招入了许多人才，百度，京东等均有招聘信息发布。社会未挖掘人才也在E work迈入了道路。</p>
							<a href="#" class="pink-button">加入我们</a>
						</div>
					</div>
					<div class="project-home-holder col-md-6 col-sm-12">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="project-item one animated fadeInRight">
									<img src="<%=basePath%>images/1.jpg" alt="" width="240px" height="200px">
									<div class="overlay">
										<h4><a href="#">McDonald‘s</a></h4>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="project-item two animated fadeInRight">
									<img src="<%=basePath%>images/2.jpg" alt="" width="240px" height="200px">
									<div class="overlay">
										<h4><a href="#">Baidu</a></h4>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="project-item three animated fadeInRight">
									<img src="<%=basePath%>images/3.jpg" alt="" width="240px" height="200px">
									<div class="overlay">
										<h4><a href="#">P&G</a></h4>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="project-item four animated fadeInRight">
									<img src="<%=basePath%>images/4.jpg" alt="" width="240px" height="200px">
									<div class="overlay">
										<h4><a href="#">JD</a></h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="menu-2" class="content about-section container">
			<div class="our-story">
				<div class="story-bg animated fadeIn"></div>
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="inner-story animated fadeInRight text-center" id="aboutus">
							<h2>ABOUT US</h2>
							<p> E work成立于2018年1月8日，“work”已经代表E work是个招聘信息网，在这里，
无论你是刚毕业的大学生，还是中途跳槽的人才，都可以通过E work找到你的最满意的功工作。
E work会对各种招聘信息进行审核，并在每项信息中加以提示，凡是需要提前收取金额的信息均视为虚假招聘信息，望各位用户谨记。<br>
</p>
						</div>
					</div>
				</div>
			</div>
			<div class="our-offers">
				<div class="offer-bg animated fadeIn"></div>
				<div class="offer-header">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 text-center">
							<div class="offer-title animated fadeInDown" id="ourwork">
								<h2>OUR WORK</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="offer-holder">
						<div class="col-md-6">
							<div class="offer-item offer-1 animated fadeInLeft">
								<figure>
									<img src="images/9.jpg" alt="" >
								</figure>
								<div class="offer-content text-center">
									<h4>HAPPY WORKING WITH US</h4>
									<p>我们公司是一个是很团结的集体，各成员之间相互关注，相互协助，一起为公司更美好的明天而奋斗，同时公司也会不定期给公司成员提供旅行出游的福利。</p>
									<span class="offer-left"><i></i></span>
									<span class="offer-right"><i></i></span>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="offer-item offer-2 animated fadeInRight">
								<figure>
									<img src="images/222.jpg" alt=""  width="480px" height="300px">
								</figure>
								<div class="offer-content text-center">
									<h4>OUR COMPANY BACKGROUND</h4>
									<p>地址：北京市海淀区中关村南大街17号<br>联系方式：13996735761<br>邮箱：yaowugailun@163.co</p>
									<span class="offer-left"><i></i></span>
									<span class="offer-right"><i></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="menu-3" class="content project-section container">
			<div class="projects-header">
				<h2 class="animated fadeInRight" style="text-align:center">Our projects</h2>
				<p class="animated fadeInLeft" style="text-align:center">E work招聘，已遍布全国为目标，尽全力将其打造成大型招聘网。各类工作信息均有发布在E work上，无论是服务行业，还是电子商务，或是IT编程。不管你想要应聘什么工作，在E work上都能让你梦想成真。
</p>
			</div>
			<div class="projects-holder">
				<div class="row">
					<div class="col-md-4 col-sm-6 p-1 animated umScaleIn">
						<div class="project-item">
							<img src="images/5.jpg" alt=""  width="337.33px" height="249.61px">
							<div class="overlay">
								<h4><a href="#">Project One</a></h4>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 p-2 animated umScaleIn">
						<div class="project-item">
							<img src="images/10.jpg" alt="" width="337.33px" height="249.61px">
							<div class="overlay">
								<h4><a href="#">Project Two</a></h4>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 p-3 animated umScaleIn">
						<div class="project-item">
							<img src="images/12.jpg" alt="" width="337.33px" height="249.61px">
							<div class="overlay">
								<h4><a href="#">Project Three</a></h4>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-6 p-4 animated umScaleIn">
						<div class="project-item animated umScaleIn">
							<img src="images/8.jpg" alt="" width="244px" height="180.55px">
							<div class="overlay">
								<h4><a href="#">Project Four</a></h4>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="project-item p-5 animated umScaleIn">
							<img src="images/9.jpg" alt="" width="244px" height="180.55px">
							<div class="overlay">
								<h4><a href="#">Project Five</a></h4>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="project-item p-6 animated umScaleIn">
							<img src="images/11.jpg" alt="" width="244px" height="180.55px">
							<div class="overlay">
								<h4><a href="#">Project Six</a></h4>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="project-item p-7 animated umScaleIn">
							<img src="images/7.jpg" alt="" width="244px" height="180.55px">
							<div class="overlay">
								<h4><a href="#">Project Seven</a></h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="menu-4" class="content blog-section container">
			<div class="blog-header text-center" id="advantages">
				<h2 class="animated fadeInRight">company advantage</h2>
				<p class="animated fadeInLeft">我们公司能够在与其他公司的竞争中脱颖而出主要因为我们公司有如下几点优势.</p>
				<a href="#" class="blog-button animated fadeInUp">加入我们</a>
			</div>
			<div class="row blog-posts">
				<div class="col-md-4 col-sm-12">
					<div class="blog-item post-1 animated zoomIn">
						<div class="blog-bg blog-pink"></div>
						<div class="blog-content">
							<h3><a href="#"><span class="blue">高   效</span></a></h3>
							<span class="solid-line"></span>
							<p>E work在工作效率上有绝对的自信。不管是发布招聘还是提交申请，都保证能够在审核后的第一时间出现我们的E work首页上。</p>
							<a href="#" class="post-button">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-12">
					<div class="blog-item post-2 animated zoomIn">
						<div class="blog-bg blog-blue"></div>
						<div class="blog-content">
							<h3><a href="#"><span class="blue">安   全</span></a></h3>
							<span class="solid-line"></span>
							<p>用户在提交申请后，与招聘方联系时，如有应聘前先交押金之类的信息，请将其是视为欺诈招聘信息，E work也会在每项信息下方均有提示。</p>
							<a href="#" class="post-button">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-12">
					<div class="blog-item post-3 animated zoomIn">
						<div class="blog-bg blog-green"></div>
						<div class="blog-content">
							<h3><a href="#"><span class="blue">便   捷</span></a></h3>
							<span class="solid-line"></span>
							<p>E work是一个为应聘方和招聘方提供便捷的招聘信息网，用户只需一份简历便可申请任何工作，也可以投放简历到平台供招聘方主动联系。</p>
							<a href="#" class="post-button">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="menu-5" class="content contact-section container">
			<div class="contact-header text-center" id="touch">
				<h2 class="animated fadeInLeft">Get in Touch</h2>
				<p class="animated fadeInRight">如果有任何不明白事宜或者有需求请联系我们，我们很乐意为您解答.</p>
				<li class="contact-social animated fadeInUp" style="list-style:none;">
					<a href="#" title="twitter"><i class="fa fa-twitter"></i></a>&nbsp&nbsp&nbsp
					<a href="#" title="dribbble"><i class="fa fa-dribbble"></i></a>&nbsp&nbsp&nbsp
					<a href="#" title="instagram"><i class="fa fa-instagram"></i></a>&nbsp&nbsp&nbsp
					<a href="#" title="share"><i class="fa fa-share-alt"></i></a><span></span>
				</li>
			</div>
			<div class="contact-holder">
				<div class="row">
					<div class="col-md-6 col-sm-12" >
					
			            <div class="googlemap-wrapper animated fadeInLeft" >
                            <div id="map_canvas" class="map-canvas">
                            <img src="upload/map.png" width="100%" height="50%"/>
                            </div>
                        </div>
					</div>
					<div class="col-md-6 col-sm-12" >
						<div class="contact-form animated fadeInUp">
							<h4>Send us a Message</h4>
							<div class="row">
							<s:form action="feedback/feedback_addFeedback" method="post">
								<fieldset class="col-md-6">
									<input type="text" name="feedback.name" placeholder="姓  名" required>
								</fieldset>
								<fieldset class="col-md-6">
									<input type="text" name="feedback.contact" placeholder="联系方式（可不填）">
								</fieldset>
								<fieldset class="col-md-12">
									<textarea name="feedback.content" cols="30" rows="10" placeholder="描 述 一 下 你 的 期 望 与 需 求"></textarea>
								</fieldset>
								<fieldset class="col-md-12">
									<button type="submit">发送</button>
									<c:if test="${session.customer.customerid==1}">
									<a href="feedback/feedback_queryFeedback">查看反馈信息</a>
									</c:if>
								</fieldset>
							</s:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


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
</body>
</html>