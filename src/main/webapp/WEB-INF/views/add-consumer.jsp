<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Boutiqa</title>
<%@ include file="imports.jsp"%>
<%@ include file="dashboard-imports.jsp"%>
</head>
<body>
	<%@ include file="admin-header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="admin-sidebar.jsp"%>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

				<h1 class="m-3">Add Consumer</h1>
				<hr class="mx-1">
				<div class="container rounded bg-white mb-5">
					<form:form modelAttribute="user" action="addConsumer" class="p-3"
						method="POST">
						<div class="row">
							<form:input path="role" value="Consumer" hidden="true" />
							<div class="col-sm-12 col-md-5">
								<div class="form-group">
									<form:label path="email">Email address</form:label>
									<form:input path="email" name="email" id="email"
										class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
										placeholder="Enter email" maxlength="50" required="true" />
								</div>
								<p class="font-italic text-danger">${errorEmail}</p>
								<div class="form-group">
									<form:label path="username">Username</form:label>
									<form:input path="username" type="text"
										class="form-control ${not empty errorUsername ? 'is-invalid' : ''}"
										id="username" name="username" placeholder="Enter username"
										required="true" />
								</div>
								<p class="font-italic text-danger">${errorUsername}</p>
								<div class="form-group">
									<form:label path="password">Password</form:label>
									<form:input path="password" type="password"
										class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
										id="password" name="password" placeholder="Enter password"
										required="true" />
								</div>
								<div class="form-group">
									<form:label path="confirmPassword">Confirm Password</form:label>
									<form:input path="confirmPassword" type="password"
										class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
										id="confirmPassword" name="confirmPassword"
										placeholder="Confirm password" required="true" />
								</div>
								<p class="font-italic text-danger">${errorPassword}</p>
							</div>
							<div class="col-sm-12 col-md-5 offset-md-1">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<form:label path="firstName">First Name</form:label>
											<form:input path="firstName" type="text" class="form-control"
												id="first-name" name="first-name" placeholder="First name"
												required="true" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<form:label path="lastName">Last Name</form:label>
											<form:input path="lastName" type="text" class="form-control"
												id="last-name" name="last-name" placeholder="Last name"
												required="true" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<form:label path="phoneNumber">Phone Number</form:label>
									<form:input path="phoneNumber" type="text" class="form-control"
										id="phone-number" name="phone-number"
										placeholder="Enter phone number" required="true" />
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<form:label path="gender">Gender:</form:label>
											<form:select path="gender" class="form-control" id="gender"
												name="gender" required="true">
												<option></option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</form:select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<form:label path="dateOfBirth">Date of Birth</form:label>
											<form:input path="dateOfBirth" type="date"
												class="form-control" name="date-of-birth" id="date-of-birth"
												required="true" />
										</div>
									</div>
								</div>
								<br>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-5">
							<button type="submit" class="btn btn-primary rounded m-2">Add Consumer</button>
							<a class="btn btn-danger rounded m-2"
								href="<c:url value='/userAdministration'/>">Cancel</a>
						</div>
					</form:form>
				</div>
			</main>
		</div>
	</div>
	<%@ include file="modal.jsp"%>
</body>
</html>
