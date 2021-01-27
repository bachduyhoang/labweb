<%-- 
    Document   : adminpage
    Created on : Jan 25, 2021, 10:43:02 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mange Question Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}" ></c:set>
        <c:set var="userRequired" value="ad" ></c:set>

        <c:url var="ManageQuestion" value="adminpage.jsp"></c:url>
        <c:url var="CreateQuestion" value="createQuestion.jsp"></c:url>
        <c:url var="UpdateQuestion" value="updateQuestion.jsp"></c:url>
        <c:url var="DeleteQuestion" value="deleteQuestion.jsp"></c:url>
        <c:url var="Logout" value=""></c:url>

        <c:if test="${user.role == userRequired}">
            <h1>Admin Page</h1>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="${ManageQuestion}">Manage Question</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link  active" href="${CreateQuestion}">Create Question</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${UpdateQuestion}">Update Question</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${DeleteQuestion}">Delete Question</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${Logout}">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <form class="d-flex" action="MainController">
                <input class="form-control me-2" type="search" placeholder="Name" aria-label="Search" name="txtSearchName" value="${txtSearchName}">
                <input class="form-control me-2" type="search" placeholder="$MIN" aria-label="Search" name="txtSearchMin" value="${txtSearchMin}">
                <input class="form-control me-2" type="search" placeholder="$MAX" aria-label="Search" name="txtSearchMax" value="${txtSearchMax}" >
                <input class="form-control me-2" type="search" placeholder="Category" aria-label="Search" name="txtSearchCategory" value="${txtSearchCategory}" >
                <button class="btn btn-outline-success" type="submit" name="btnAction" value="SearchAdmin">Search</button>
            </form>
        </c:if>
            
        <c:if test="${user.role != userRequired}" >
            You can't access. This is ADMIN page
        </c:if>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>
