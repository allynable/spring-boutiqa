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
							<i class="fa-solid fa-user text-primary mr-3"></i>My Profile</button>
						<button type="button"
							class="list-group-item list-group-item-action active">
							<i class="fa-solid fa-address-book text-light mr-3"></i>Address</button>
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
							<h1>Address</h1>
							<hr class="mx-1">
							<form:form modelAttribute="address"
								action="updateConsumerAddress" class="p-3" method="POST">
								<form:input path="addressId" hidden="true" />
								<div class="form-group">
									<form:label path="addressLine1">Address Line 1</form:label>
									<form:input path="addressLine1" class="form-control"
										id="address-line-1" name="address-line-1" type="text"
										required="true" placeholder="Street/House No/Bldg. No"></form:input>
								</div>
								<div class="form-group">
									<form:label path="addressLine2">Address Line 2</form:label>
									<form:input path="addressLine2" id="address-line-2" type="text"
										name="address-line-2" class="form-control"
										placeholder="Additional address information"></form:input>
								</div>
								<div class="row">
									<div class="col">
										<div class="form-group">
											<form:label path="city">City</form:label>
											<form:input path="city" class="form-control" id="city"
												name="city" placeholder="City" required="true"></form:input>
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<form:label path="state">State</form:label>
											<form:input path="state" class="form-control" id="state"
												name="state" placeholder="State/Province" required="true"></form:input>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="form-group">
											<form:label path="country">Country</form:label>
											<form:input path="country" class="form-control" id="country"
												name="country" placeholder="Country" required="true"></form:input>
										</div>
									</div>
									<div class="col">
										<div class="form-group">
											<form:label path="zipCode">Zip Code</form:label>
											<form:input path="zipCode" class="form-control" id="zip-code"
												name="zip-code" placeholder="Zip Code" required="true"></form:input>
										</div>
									</div>
								</div>
								<br>
								<div class="d-flex justify-content-center">
									<button type="submit" class="btn btn-primary rounded">Update
										Address</button>
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
