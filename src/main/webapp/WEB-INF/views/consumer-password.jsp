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
							class="list-group-item list-group-item-action"
							aria-current="true"
							onclick="location.href='<c:url value='/showConsumerProfile' />'">
							<i class="fa fa-user text-primary mr-3"></i>My Profile
						</button>
						<button type="button"
							class="list-group-item list-group-item-action"
							onclick="location.href='<c:url value='/showConsumerAddress' />'">
							<i class="fa-solid fa-address-book text-primary mr-3"></i>Address
						</button>
						<button type="button"
							class="list-group-item list-group-item-action active">
							<i class="fa fa-key text-light mr-3"></i>Change Password
						</button>
					</div>
					<div class="col-md-9">
						<c:if test="${not empty successMessage}">
							<div class="alert alert-success">
								<h3>${successMessage}</h3>
							</div>
						</c:if>
						<div class="container rounded p-5 bg-white">
							<h1>Change Password</h1>
							<hr class="mx-1">
							<div class="col-md-8 offset-md-2">
								<form:form modelAttribute="user" action="updatePassword"
									class="p-3" method="POST">
									<form:input path="userId" hidden="true" />
									<div class="form-group">
										<form:label path="password">Password</form:label>
										<form:input path="password" type="password"
											class="form-control ${not empty errorMessage ? 'is-invalid' : ''}"
											id="password" name="password" required="true"
											placeholder="Enter current Password"></form:input>
									</div>
									<p class="font-italic text-danger">${errorMessage}</p>
									<div class="form-group">
										<form:label path="newPassword">New Password</form:label>
										<form:input path="newPassword"
											class="form-control ${not empty notMatchError ? 'is-invalid' : ''}"
											type="password" name="password"
											placeholder="Enter new password" id="password"
											required="true"></form:input>
									</div>
									<p class="font-italic text-danger">${notMatchError}</p>
									<div class="form-group">
										<form:label path="confirmPassword">Confirm New Password</form:label>
										<form:input path="confirmPassword"
											class="form-control ${not empty notMatchError ? 'is-invalid' : ''}"
											type="password" name="confirm-password" id="confirm-password"
											placeholder="Confirm New Password" required="true"></form:input>
									</div>
									<p class="font-italic text-danger">${notMatchError}</p>
									<br>
									<div class="d-flex justify-content-center">
										<button type="submit" class="btn btn-primary rounded">Change
											Password</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
