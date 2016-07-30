<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Users List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }
    </style>
</head>
<body class=".container-fluid">
<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                <div align="left"><b>Users List</b></div>
                <br>
                <div align="left"><a href="createUser">Add new User</a></div>
            </h3>
        </div>
        <div class="panel-body">
            <form action="searchUser">
                <div class="row">
                    <div class="col-md-4">Search Users: <input type='text' name='searchName' id='searchName'/></div>
                    <div class="col-md-4"><input class="btn btn-success" type='submit' value='Search'/></div>
                </div>
            </form>
            <div id="pagination">
                <div> Page
                    <c:choose>
                        <c:when test="${searchName == null || searchName == ''}">
                            <c:url value="/" var="prev">
                                <c:param name="page" value="${page-1}"/>
                            </c:url>
                        </c:when>
                        <c:otherwise>
                            <c:url value="/searchUser?searchName=${searchName}" var="prev">
                                <c:param name="page" value="${page-1}"/>
                            </c:url>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${page > 1}">
                        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
                    </c:if>
                    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                        <c:choose>
                            <c:when test="${page == i.index}">
                                <span>${i.index}</span>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${searchName == null || searchName == ''}">
                                        <c:url value="/" var="url">
                                            <c:param name="page" value="${i.index}"/>
                                        </c:url>
                                        <a href='<c:out value="${url}" />'>${i.index}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="/searchUser?searchName=${searchName}" var="url">
                                            <c:param name="page" value="${i.index}"/>
                                        </c:url>
                                        <a href='<c:out value="${url}" />'>${i.index}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${searchName == null || searchName == ''}">
                            <c:url value="/" var="next">
                                <c:param name="page" value="${page + 1}"/>
                            </c:url>
                        </c:when>
                        <c:otherwise>
                            <c:url value="/searchUser?searchName=${searchName}" var="next">
                                <c:param name="page" value="${page + 1}"/>
                            </c:url>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${page + 1 <= maxPages}">
                        <a href='<c:out value="${next}" />' class="pn next">Next</a>
                    </c:if>
                </div>
            </div>
            <table class="table table-hover table-bordered">
                <thead style="background-color: #bce8f1;">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Admin</th>
                    <th>Created Date</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <th><c:out value="${user.id}"/></th>
                        <th><c:out value="${user.name}"/></th>
                        <th><c:out value="${user.age}"/></th>
                        <th><c:out value="${user.admin ? 'Yes' : 'No'}"/></th>
                        <th><c:out value="${user.createdDate.toGMTString()}"/></th>
                        <th><a href="editUser?id=<c:out value='${user.id}'/>">Edit</a></th>
                        <th><a href="deleteUser?id=<c:out value='${user.id}'/>">Delete</a></th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>