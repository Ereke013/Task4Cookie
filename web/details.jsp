<%@ page import="db.News" %><%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 29.09.2020
  Time: 06:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DETAILS</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/nav.jsp"%>

<%
    News news = (News)request.getAttribute("news");
    if(news!=null){
%>
<div class="container mt-3 d-flex">
    <div class="col-sm-8">

        <div class="card">
            <div class="card-body" >
                <h5 class="card-title"><%=news.getTitle()%></h5>
                <p class="card-text">At <%=news.getPost_date() %> by <a href="#"><%=news.getPublication().getName()%></a></p>
                <img src="<%=news.getPicture_url()%>" class="card-img-top" alt="...">
                <h5 class="card-title"><%=news.getShort_content()%></h5>
                <p class="card-text"><%=news.getContent()%></p>
            </div>
        </div>

    </div>

    <div class="col-sm-4">
        <div class="card" style="background-color:#61c8df;color: white">
            <div class="card-body" >
                <h5 class="card-title">About <%=news.getPublication().getName()%></h5>
                <p class="card-text"><%=news.getPublication().getDescription()%></p>
                <h5 class="card-title">Rating: <%=news.getPublication().getRating()%></h5>
            </div>
        </div>
        <%
            }
        %>
        <div class="card border-0" >
            <div class="card-body d-flex flex-column" >
                <h5 class="card-title"style="font-style: italic">Archives</h5>

                <a href="#">September 2020</a>
                <a href="#">August 2020</a>
                <a href="#">July 2020</a>
                <a href="#">June 2020</a>
                <a href="#">May 2020</a>
                <a href="#">April 2020</a>
                <a href="#">March 2020</a>
                <a href="#">February 2020</a>
                <a href="#">January 2020</a>
                <a href="#">December 2019</a>
                <a href="#">November 2019</a>
                <a href="#">October 2019</a>
            </div>
        </div>
        <div class="card border-0">
            <div class="card-body d-flex flex-column" >
                <h5 class="card-title" style="font-style: italic">Follow us</h5>
                <a href="#">Instagram</a>
                <a href="#">Twitter</a>
                <a href="#">Facebook</a>

            </div>
        </div>
    </div>

</div>

</body>
</html>
