<%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 29.09.2020
  Time: 04:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>

<style>
    .sn{
        position: absolute;
        color:#dff0d8;
        left:300px;
        top:60px;
    }
    body{
        background-color: #2aabd2;
    }
</style>
<br>
<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="active" id="login-form-link">Login</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="#" id="register-form-link">Register</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="login-form" action="login" method="post" role="form" style="display: block;">
                                <div class="form-group">
                                    <input type="text" name="login" tabindex="1" class="form-control" placeholder="Login" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password"  tabindex="2" class="form-control" placeholder="Password">
                                </div>
                                <div class="form-group text-center">
                                    <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                    <label for="remember"> Remember Me</label>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form id="register-form" action="register" method="post" role="form" style="display: none;">
                                <div class="form-group">
                                    <input type="text" name="name"  tabindex="1" class="form-control" placeholder="Name" value="">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="surname"  tabindex="1" class="form-control" placeholder="Surname" value="">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="login"  tabindex="1" class="form-control" placeholder="Login" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password"  tabindex="2" class="form-control" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
