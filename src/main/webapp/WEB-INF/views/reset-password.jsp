<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Boutiqa</title>
<%@ include file="imports.jsp"%>
</head>
<body>
	<div><%@ include file="header.jsp"%></div>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="container p-5 m-5 rounded bg-white">
					<h1 class="h4 text-gray-900 mb-4">Reset Password</h1>
					<form:form method="POST" action="resetPassword">
						<input name="email" id="email" value="${email}" hidden="true"/>
						<div class="form-group">
							<input name="password" id="password" class="form-control"
								placeholder="Enter new password" type="password" />
						</div>
						<div class="form-group">
							<input name="confirmPassword" id="confirmPassword"
								class="form-control" placeholder="Confirm new password"  type="password"/>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form:form>
					<div class="text-center mt-3">
						<p class="font-italic text-danger">${errorMessage}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div><%@ include file="footer.jsp"%></div>
</body>
</html>
