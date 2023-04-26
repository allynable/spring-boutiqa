<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     pageEncoding="ISO-8859-1"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Successful</title>
<%@ include file="imports.jsp" %>
</head>
<body>
    <div><%@ include file="header.jsp"%></div>
    
    <br><br><br>
    <div class="mb-4 text-center">
       <i class="fa-solid fa-circle-check fa-5x text-success"></i>
   	</div>
    <div class="text-center mb-5">
    	<h3>${successMessage}</h3>
        <h1>Thank you ${firstName} !</h1>
        <a href="<c:url value='/'/>" class="text-white btn btn-primary">Back Home</a>
    </div>
    <div><%@ include file="footer.jsp"%></div>
</body>
</html>	