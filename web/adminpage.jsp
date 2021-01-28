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
        <c:set var="listSubject" value="${sessionScope.listSubject}" ></c:set>
        <c:set var="listQuestion" value="${sessionScope.listQuestion}" ></c:set>
        <c:set var="index" value="${requestScope.indexPage}" ></c:set>
        <c:set var="txtSearchName" value="${requestScope.txtSearchName}"></c:set>
        <c:set var="txtSearchSubject" value="${requestScope.txtSearchSubject}"></c:set>
        <c:set var="txtSearchStatus" value="${requestScope.txtSearchStatus}"></c:set>
        <c:set var="maxPage" value="${requestScope.maxPage}" ></c:set>

        <c:url var="ManageQuestion" value="adminpage.jsp"></c:url>
        <c:url var="CreateQuestion" value="createQuestion.jsp"></c:url>
        <c:url var="DeleteQuestion" value="deleteQuestion.jsp"></c:url>
        <c:url var="Logout" value="Logout"></c:url>

        <c:if test="${user.role == userRequired}">
            <h1>Administrator Page</h1>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" href="${ManageQuestion}">Manage Question</a>
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
            <form class="d-flex" action="HomeAdmin">
                <input class="form-control me-2" type="search" placeholder="Name" aria-label="Search" name="txtSearchName" value="${txtSearchName}">
                <select name="txtSearchSubject">
                    <c:forEach var="sub" items="${listSubject}">
                        <c:if test="${sub.subID == txtSearchSubject}">
                            <option value="${sub.subID}" selected="true">${sub.subID}</option>
                        </c:if>
                        <c:if test="${sub.subID != txtSearchSubject}">
                            <option value="${sub.subID}">${sub.subID}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <select name="txtSearchStatus">
                    <c:if test="${empty txtSearchStatus}">
                        <option value="true">true</option>
                        <option value="false">false</option>
                    </c:if>

                    <c:if test="${txtSearchStatus != null}">
                        <c:if test="${not empty txtSearchStatus}">
                            <option selected value="${txtSearchStatus}" >${txtSearchStatus}</option>
                            <c:choose>
                                <c:when test="${txtSearchStatus == true}">
                                    <option value="false">false</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="true">true</option>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:if>
                </select>
                <button class="btn btn-outline-success" type="submit" name="btnAction" value="HomeAdmin">Search</button>
            </form>

            <c:if test="${listQuestion != null}"  >
                <c:if test="${not empty listQuestion}">
                    <table border="1" class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Question</th>
                                <th>Answer1</th>
                                <th>Answer2</th>
                                <th>Answer3</th>
                                <th>Answer4</th>
                                <th>Correct Answer</th>
                                <th>Subject</th>
                                <th>Date Create</th>
                                <th>Status</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="quest" items="${listQuestion}"  >
                            <form action="UpdateQuestion">
                                <tr>
                                    <td>
                                        ${quest.questionID}
                                    </td>
                                    <td>
                                        ${quest.questionContent}
                                    </td>
                                    <td>
                                        ${quest.ans1}
                                    </td>
                                    <td>
                                        ${quest.ans2}
                                    </td>
                                    <td>
                                        ${quest.ans3}
                                    </td>
                                    <td>
                                        ${quest.ans4}
                                    </td>
                                    <td>
                                        ${quest.correctAns}
                                    </td>
                                    <td>
                                        ${quest.subjectID}
                                    </td>
                                    <td>
                                        ${quest.createDate}
                                    </td>
                                    <td>
                                        ${quest.status}
                                    </td>
                                    <td>
                                        <input type="hidden" name="txtSearchName"  value="${txtSearchName}">
                                        <input type="hidden" name="txtSearchSubject" value="${txtSearchSubject}">
                                        <input type="hidden" name="txtSearchStatus" value="${txtSearchStatus}">
                                        <button type="submit" name="btnAction" value="UpdateQuestion">Update</button>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                    </tbody>

                </table>
            </c:if>
        </c:if>      



        <c:if test="${maxPage != 1}">
            <c:forEach begin="1" end="${maxPage}" var="i">
                <c:url var="paging" value="HomeAdmin">
                    <c:param name="btnAction" value="SearchAdmin"></c:param>
                    <c:param name="index" value="${i}"></c:param>
                    <c:param name="txtSearchName" value="${txtSearchName}"></c:param>
                    <c:param name="txtSearchSubject" value="${txtSearchSubject}"></c:param>
                    <c:param name="txtSearchStatus" value="${txtSearchStatus}"></c:param>
                </c:url>
                <a  href="${paging}">${i}</a>
            </c:forEach>  
        </c:if>
    </c:if>

    <c:if test="${user.role != userRequired}" >
        You can't access. This is ADMIN page
    </c:if>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
