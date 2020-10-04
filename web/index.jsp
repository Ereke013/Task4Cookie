<%@ page import="db.News" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 28.09.2020
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Home Page</title>
    <%@include file="vendor/head.jsp"%>
  </head>
  <body>
  <%@include file="vendor/nav.jsp"%>
<div class="container mt-3">
  <div class="jumbotron bg-primary" style="background-color:#61c8df;color: white">
    <h1 class="display-4" style="font-style: italic;font-weight: lighter">All World News</h1>
    <p>You can read all news in deifferent languages around world</p>
  </div>

  <%ArrayList<News> news = (ArrayList<News>) request.getAttribute("newsL");
    if(news != null){
  %>
  <div class="row d-flex" style="width: 100%; height: 200px">
    <%

        for (News n:news){

    %>
    <div class="col-sm-6 mt-3">
      <div class="card" style="height: 600px">
        <img src="<%=n.getPicture_url()%>" class="card-img-top" alt="..." style="height: 348px">
        <div class="card-body">
          <a href="#"><%=n.getPublication().getName()%></a>
          <h5 class="card-title mt-1"><%=n.getTitle()%></h5>
          <p class="card-title mt-1"><%=(Date)n.getPost_date()%></p>
          <p class="card-text mt-1"><%=n.getShort_content()%></p>
          <a href="/details?id=<%=n.getId()%>" class="btn btn-primary">Read More</a>
        </div>
      </div>
    </div>
    <%
          }
    %>
  </div>
  <%
    }
  %>

  <div class="row d-flex" style="width: 100%; height: 200px">
    <%
      ArrayList<News> allNews=DBManager.getAllNews();
      String cookie_Val=(String)request.getAttribute("cookieValue");
      if(allNews!=null){
        for (News n:allNews){
          if((n.getLanguage().getId() + "").equals(cookie_Val)){

    %>
    <div class="col-sm-6 mt-3">
      <div class="card" style="height: 600px">
        <img src="<%=n.getPicture_url()%>" class="card-img-top" alt="..." style="height: 348px">
        <div class="card-body">
          <a href="#"><%=n.getPublication().getName()%></a>
          <h5 class="card-title mt-1"><%=n.getTitle()%></h5>
          <p class="card-title mt-1"><%=(Date)n.getPost_date()%></p>
          <p class="card-text mt-1"><%=n.getShort_content()%></p>
          <a href="/details?id=<%=n.getId()%>" class="btn btn-primary">Read More</a>
        </div>
      </div>
    </div>
    <%
        }}}

    %>
  </div>

</div>


  </body>
</html>
