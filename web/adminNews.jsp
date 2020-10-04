<%@ page import="db.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBManager" %>
<%@ page import="db.Languages" %>
<%@ page import="db.Publication" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <%@include file="vendor/head.jsp"%>
    <%@include file="vendor/navAdmin.jsp"%>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light ">
            <div class="sidebar-sticky pt-3">
                <ul class="nav flex-column" >
                    <li class="nav-item">
                        <a class="nav-link" href="#"style="color:black;">
                            ADMIN PANEL
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin?lan">
                            Languages
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin?pub">
                            Publications
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin?new">
                            News
                        </a>
                    </li>
                </ul>


            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">News</h1>
                <button type="button" class="btn btn-success btn-sm"data-toggle="modal" data-target="#addNewsModal">ADD NEW</button>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>LANGUAGE</th>
                        <th>ADDED DATE</th>
                        <th>PUBLICATION</th>
                        <th>DETAILS</th>
                        <th>OPERATIONS</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<News> news= DBManager.getAllNews();
                        if(news!=null){
                            int i=1;
                            for (News n:news){
                    %>
                    <tr>
                        <td style="width: 50px"><%=i%></td>
                        <td style="width: 300px"><%=n.getTitle()%></td>
                        <td style="width: 90px"><%=n.getLanguage().getName()%></td>
                        <td style="width: 100px"><%=n.getPost_date()%></td>
                        <td style="width: 0px"><%=n.getPublication().getName()%></td>
                        <td style="width: 0px"> <button class="btn btn-sm btn-info">DETAILS</button></td>
                        <td style="width: 50px">
                            <button class="btn btn-sm btn-info">EDIT</button>
                            <button class="btn btn-sm btn-danger">DELETE</button>
                        </td>
                    </tr>
                    <%
                                i++;
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>



<form action="/addNews" method="post">
    <div class="modal" tabindex="-1" role="dialog" id="addNewsModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>TITLE: </label>
                        <input type="text" name="title" class="form-control" >
                    </div>

                    <div class="form-group">
                        <label>SHORT CONTENT</label>
                        <textarea class="form-control" name="short_content" rows="3" ></textarea>
                    </div>

                    <div class="form-group">
                        <label>CONTENT</label>
                        <textarea class="form-control" name="content" rows="3" ></textarea>
                    </div>

                    <div class="form-group">
                        <label>LANGUAGE</label>
                       <select class="form-control" name="language">
                           <%
                               ArrayList<Languages>languages = DBManager.getAllLanguages();
                               if(languages!=null){
                                   for(Languages l:languages){

                           %>
                           <option value="<%=l.getId()%>"><%=l.getName()%></option>
                           <%
                               }}
                           %>
                       </select>
                    </div>

                    <div class="form-group">
                        <label>PUBLICATION</label>
                       <select class="form-control"name="publication">
                           <%
                               ArrayList<Publication>publications = DBManager.getAllPublication();
                               if(publications!=null){
                                   for(Publication p:publications){

                           %>
                           <option value="<%=p.getId()%>"><%=p.getName()%></option>
                           <%
                               }}
                           %>
                       </select>
                    </div>

                    <div class="form-group">
                        <label>PICTURE URL</label>
                        <textarea class="form-control" name="picture_url" ></textarea>
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-info">ADD</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">CANCEL</button>
                </div>
            </div>

        </div>

    </div>
</form>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.5/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="/docs/4.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>