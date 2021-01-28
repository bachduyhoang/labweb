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
        <c:url var="DeleteQuestion" value="deleteQuestion.jsp"></c:url>
        <c:url var="Logout" value="Logout"></c:url>

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
                                <a class="nav-link " href="${ManageQuestion}">Manage Question</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${CreateQuestion}">Create Question</a>
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
            <form class="d-flex" action="UpdateQuestion">
                <table border="1" class="table">
                    <thead>
                        <tr>
                            <th colspan="2">Question</th>
                            <th colspan="2">Correct Answer</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Question</td>
                            <td colspan="2"><input class="form-control form-control" type="text" name="txtContent" value="${txtContent}" /></td>
                            <td>${questionError.content}</td>
                        </tr>
                        <tr>
                            <td>Answer 1</td>
                            <td><input class="form-control form-control" type="text" name="txtAns1"  value="${txtAns1}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${txtCorrectAns == null}">
                                        <input type="radio" name="txtCorrectAns" value="1" checked/>
                                    </c:when>
                                    <c:when test="${txtCorrectAns == 1}">
                                        <input type="radio" name="txtCorrectAns" value="1" checked/>
                                    </c:when>
                                    <c:when test="${txtCorrectAns != 1}">
                                        <input type="radio" name="txtCorrectAns" value="1"/>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>${questionError.ans1}</td>
                        </tr>
                        <tr>
                            <td>Answer 2</td>
                            <td><input class="form-control form-control" type="text" name="txtAns2" value="${txtAns2}" /></td>
                            <td> 
                                <c:if test="${txtCorrectAns == 2}">
                                    <input type="radio" name="txtCorrectAns" value="2" checked/>
                                </c:if>
                                <c:if test="${txtCorrectAns != 2}">
                                    <input type="radio" name="txtCorrectAns" value="2"/>
                                </c:if>
                            </td>
                            <td>${questionError.ans2}</td>
                        </tr>
                        <tr>
                            <td>Answer 3</td>
                            <td><input class="form-control form-control" type="text" name="txtAns3" value="${txtAns3}" /></td>
                            <td>
                                <c:if test="${txtCorrectAns == 3}">
                                    <input type="radio" name="txtCorrectAns" value="3" checked/>
                                </c:if>
                                <c:if test="${txtCorrectAns != 3}">
                                    <input type="radio" name="txtCorrectAns" value="3"/>
                                </c:if>
                            </td>
                            <td>${questionError.ans3}</td>
                        </tr>
                        <tr>
                            <td>Answer 4</td>
                            <td><input class="form-control form-control" type="text" name="txtAns4" value="${txtAns4}" /></td>
                            <td>
                                <c:if test="${txtCorrectAns == 4}">
                                    <input type="radio" name="txtCorrectAns" value="4" checked/>
                                </c:if>
                                <c:if test="${txtCorrectAns != 4}">
                                    <input type="radio" name="txtCorrectAns" value="4"/>
                                </c:if>
                            </td>
                            <td>${questionError.ans4}</td>
                        </tr>

                        <tr>
                            <td> Choose Subject: </td>
                            <td colspan="3"> 
                                <select name="txtSubject">
                                    <c:forEach var="subject" items="${listSubject}">
                                        <c:if test="${subject.subID == txtSubject}">
                                            <option selected="">${subject.subID}</option>
                                        </c:if>
                                        <c:if test="${subject.subID != txtSubject}">
                                            <option >${subject.subID}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">Click to update question</td>
                            <td colspan="2" class="text-center"><input type="submit" name="btnAction" value="UpdateQuestion"/></td>
                        </tr>

                    </tbody>
            </form>
        </c:if>

        <c:if test="${user.role != userRequired}" >
            You can't access. This is ADMIN page
        </c:if>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>
