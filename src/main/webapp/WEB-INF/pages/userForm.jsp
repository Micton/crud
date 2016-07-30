<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Information</title>
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
                User Details
            </h3>
        </div>
        <div class="panel-body">
            <form:form id="userRegisterForm" cssClass="form-horizontal" modelAttribute="user" method="post"
                       action="saveUser">
                <div class="form-group">
                    <div class="control-label col-xs-3"><form:label path="name">Name</form:label></div>
                    <div class="col-xs-6">
                        <form:hidden path="id" value="${userObject.id}"/>
                        <form:input cssClass="form-control" path="name" value="${userObject.name}"/>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="age" cssClass="control-label col-xs-3">Age</form:label>
                    <div class="col-xs-6">
                        <form:input cssClass="form-control" path="age" value="${userObject.age}"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="control-label col-xs-3"><form:label path="admin">Admin</form:label></div>
                    <div class="col-xs-6">
                        <form:checkbox path="admin" value="${userObject.admin}"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-4">
                        </div>
                        <div class="col-xs-4">
                            <input type="submit" id="saveUser" class="btn btn-primary" value="Save"
                                   onclick="return submitUserForm();"/>
                            <a href="getAllUsers" class="btn btn-primary">Cancel</a>
                        </div>
                        <div class="col-xs-4">
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    function submitUserForm() {
        var name = $('#name').val().trim();
        var age = $('#age').val();

        function isNameValid(name) {
            return name.match(/^[a-zA-Z]+$/)
        }

        if (name.length == 0 || name.length > 25 || !isNameValid(name)) {
            alert('Please enter proper name');
            $('#name').focus();
            return false;
        }
        function isInt(value) {
            return !isNaN(value) && (function (x) {
                        return (x | 0) === x;
                    })(parseFloat(value))
        }

        if (age <= 0 || age > 150 || !isInt(age)) {
            alert('Please enter proper age');
            $('#age').focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>