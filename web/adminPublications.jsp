<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Publication" %>
<%@ page import="db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 28.09.2020
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success" role="alert">

               New Publication Added Succesfully!
            </div>
            <%
                }
            %>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Publications</h1>
                <button type="button" class="btn btn-success btn-sm"data-toggle="modal" data-target="#addLanguageModal">ADD NEW</button>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th>DESCRIPTION</th>
                        <th>RATING</th>
                        <th>OPERATIONS</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Publication> publications= DBManager.getAllPublication();
                        if(publications!=null){
                            int i=1;
                            for (Publication p:publications){
                    %>
                    <tr>
                        <td style="width: 50px"><%=i%></td>
                        <td style="width: 70px"><%=p.getName()%></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="width: 60%"><%=p.getDescription()%></td>
                        <td ><%=p.getRating()%></td>
                        <td style="width: 0">
                            <button class="btn btn-sm btn-info">EDIT</button>
                            <button type="button" onclick="deletet(<%=p.getId()%>)" id="del" class="btn btn-sm btn-danger">DELETE</button>
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

<form action="/deletePublication" method="post" data-toggle="modal" id="delForm">
    <input type="hidden" id="delka" name="delka">
</form>

<script type="text/javascript">
    const deletet=(p)=> {
        conf=confirm("Are you sure?");
        if(conf){
            document.getElementById("delka").value=p;
            document.getElementById("delForm").submit();
        }
    }
</script>

<form action="/addPublication" method="post">
    <div class="modal" tabindex="-1" role="dialog" id="addLanguageModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Publication</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
<%--                    <input type="hidden" name="id" class="form-control">--%>
                    <div class="form-group">
                        <label>NAME: </label>
                        <input type="text" name="name" class="form-control" placeholder="Name of publication...">
                    </div>

                    <div class="form-group">
                        <label>DESCRIPTION</label>
                        <textarea class="form-control" name="description" rows="5" placeholder="Description..."></textarea>
                    </div>

                    <div class="form-group">
                        <label>RATING</label>
                        <textarea class="form-control" name="rating" rows="5" placeholder="Rating..."></textarea>
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
