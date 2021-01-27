<%-- 
    Document   : createNewAccount
    Created on : Jan 25, 2021, 4:26:23 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create</title>
    </head>
    <body>
        <c:set var="error" value="${requestScope.USER_ERROR}"></c:set>
        <c:set var="txtEmail" value="${requestScope.txtEmail}"></c:set>
        <c:set var="txtFullName" value="${requestScope.txtFullName}"></c:set>
        <c:set var="txtPassword" value="${requestScope.txtPassword}"></c:set>
        <c:set var="txtConfirm" value="${requestScope.txtConfirm}"></c:set>
        
        <h1>Create New Account</h1>
        <form action="CreateAccount" method="POST">
            Email<input type="text" name="txtEmail" value="${txtEmail}" />${error.userID}<br/> 
            Full Name<input type="text" name="txtFullName" value="${txtFullName}" />${error.name}<br/> 
            Password<input type="password" name="txtPassword" value="${txtPassword}" />${error.password}<br/> 
            Confirm <input type="password" name="txtConfirm" value="${txtConfirm}" />${error.confirm}<br/> 
            <input type="submit" value="Create Account">    
            <input type="reset" >
        </form>
        <a href="login.html" >Click here to go Login Page</a>
        
    </body>
</html>
