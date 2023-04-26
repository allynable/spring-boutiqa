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

				<h1 class="m-3">Edit Consumer</h1>
				<hr class="mx-1">
				<div class="container rounded bg-white mb-3">
					<form:form modelAttribute="user" action="updateConsumer"
						class="p-3" method="POST">
						<form:input path="userId" hidden="true" />
						<form:input path="password" hidden="true" />
						<form:input path="role" hidden="true" value="Consumer" />
						<div class="form-group">
							<form:label path="email">Email address</form:label>
							<form:input path="email" name="email" id="email"
								class="form-control" placeholder="Enter email" maxlength="50"
								required="true" />
						</div>
						<div class="form-group">
							<form:label path="username">Username</form:label>
							<form:input path="username" hidden="true" />
							<input disabled value="${user.username}" class="form-control" />

						</div>
						<div class="row">
							<div class="col">
								<div class="form-group">
									<form:label path="firstName">First Name</form:label>
									<form:input path="firstName" type="text" class="form-control"
										id="first-name" name="first-name" placeholder="First name" />
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<form:label path="lastName">Last Name</form:label>
									<form:input path="lastName" type="text" class="form-control"
										id="last-name" name="last-name" placeholder="Last name" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="phoneNumber">Phone Number</form:label>
							<form:input path="phoneNumber" type="text" class="form-control"
								id="phone-number" name="phone-number"
								placeholder="Enter phone number" />
						</div>
						<div class="form-group">
							<form:label path="gender">Gender:</form:label>
							<form:select path="gender" class="form-control" id="gender"
								name="gender">
								<option></option>
								<option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
								<option value="Female"
									${user.gender == 'Female' ? 'selected' : ''}>Female</option>
							</form:select>
						</div>
						<div class="form-group">
							<form:label path="dateOfBirth">Date of Birth</form:label>
							<form:input path="dateOfBirth" type="date" class="form-control"
								name="date-of-birth" id="date-of-birth" />
						</div>
						<br>
						<div class="d-flex justify-content-center">
							<button type="submit" class="btn btn-primary m-2">Update
								Consumer</button>
							<a class="btn btn-danger m-2"
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
