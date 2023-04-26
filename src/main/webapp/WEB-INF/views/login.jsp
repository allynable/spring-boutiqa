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
<script>
	$(function() {
		var inputs = $('input.is-invalid');
		inputs.on('focus', function() {
			$(this).removeClass('is-invalid');
		});
	});
</script>
</head>
<body>
	<div><%@ include file="header.jsp"%></div>
	<div class="container-fluid">
		<div class="row m-5">
			<div class="col-md-12 d-flex justify-content-center">
				<div class="col-md-4 px-5">
					<div class="card">
						<div class="card-header">
							<h1 class="card-title text-left">
								<strong>Login</strong>
							</h1>
							<p class="card-text text-right">
								New member? <a class="text-info"
									href="<c:url value='/consumerRegistration' />">Register</a>
								here
							</p>
						</div>
						<div class="card-body">
							<div class="container rounded ">
								<form:form id="loginForm" modelAttribute="user" action="login"
									method="post">
									<div class="form-group mt-4 mb-4">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text bg-primary"><i
													class="fa-solid fa-user text-white"></i></span>
											</div>
											<form:input path="username" name="username" id="username"
												class="form-control ${not empty message ? 'is-invalid' : ''}"
												placeholder="Enter username" required="true"
												oninvalid="this.setCustomValidity('Please enter your username or email')" />
										</div>
									</div>
									<div class="form-group mb-2">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text bg-primary"><i
													class="fa-solid fa-lock text-white"></i></span>
											</div>
											<form:input path="password" type="password" name="password"
												id="password"
												class="form-control ${not empty message ? 'is-invalid' : ''}"
												placeholder="Enter your password" required="true"
												oninvalid="this.setCustomValidity('Please enter your password')" />
										</div>
									</div>
									<p class="text-right">
										<a href="<c:url value='/forgotPassword'/>" class="text-info">forgot
											password?</a>
									</p>
									<div class="text-center">
										<form:button id="login" name="login" class="btn btn-primary">Login</form:button>
									</div>
								</form:form>
								<div class="text-center mt-3">
									<p class="font-italic text-danger">${message}</p>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<div><%@ include file="footer.jsp"%></div>
</body>
</html>
