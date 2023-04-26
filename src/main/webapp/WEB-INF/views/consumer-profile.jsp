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
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="list-group col-md-3">
						<button type="button"
							class="list-group-item list-group-item-action active"
							aria-current="true"><i class="fa-solid fa-user text-light mr-3"></i>My Profile</button>
						<button type="button"
							class="list-group-item list-group-item-action"
							onclick="location.href='<c:url value='/showConsumerAddress' />'">
							<i class="fa-solid fa-address-book text-primary mr-3"></i>Address</button>
						<button type="button"
							class="list-group-item list-group-item-action"
							onclick="location.href='<c:url value='/showConsumerPassword' />'"><i class="fa-solid fa-key text-primary mr-3"></i>Change
							Password</button>
					</div>
					<div class="col-md-9">
						<c:if test="${not empty successMessage}">
							<div class="alert alert-success">
								<h3 class="pt-2">${successMessage}</h3>
							</div>
						</c:if>
						<div class="container rounded p-5 bg-white">
							<h1>My Profile</h1>
							<p class="text-secondary ml-1">Manage and protect your
								account</p>
							<hr class="mx-1">
							<form:form modelAttribute="user" action="updateConsumerProfile"
								class="p-3" method="POST">
								<form:input path="userId" hidden="true" />
								<form:input path="password" hidden="true" />
								<form:input path="role" hidden="true" value="Consumer"/>
								<div class="form-group">
									<form:label path="email">Email address</form:label>
									<form:input path="email" name="email" id="email"
										class="form-control" placeholder="Enter email" maxlength="50"
										required="true" />
								</div>
								<div class="form-group">
									<form:label path="username">Username</form:label>
									<form:input path="username" hidden="true"/>
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
										<option value="Male"
											${user.gender == 'Male' ? 'selected' : ''}>Male</option>
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
									<button type="submit" class="btn btn-primary rounded">Update
										Profile</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
