<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller Registration</title>
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
			<div class="col-md-8 offset-md-2">
				<h1 class="m-1">Register as a Seller</h1>
				<div class="container rounded" style="background-color: #fff;">
					<form:form modelAttribute="sellerForm" action="registerSeller"
						class="p-3" method="POST">
						<h3>Personal Information</h3>
						<div class="row">
							<form:input path="user.role" value="Seller"
								hidden="true" />
							<div class="col-sm-12 col-md-5">
								<div class="form-group">
									<form:label path="user.email">Email address</form:label>
									<form:input path="user.email" name="email" id="email"
										class="form-control ${not empty errorEmail ? 'is-invalid' : ''}" placeholder="Enter email" maxlength="50"
										required="true" />
								</div>
								<p class="font-italic text-danger">${errorEmail}</p>
								<div class="form-group">
									<form:label path="user.username">Username</form:label>
									<form:input path="user.username" type="text"
										class="form-control ${not empty errorUsername ? 'is-invalid' : ''}" id="username" name="username"
										placeholder="Enter username" required="true" />
								</div>
								<p class="font-italic text-danger">${errorUsername}</p>
								<div class="form-group">
									<form:label path="user.password">Password</form:label>
									<form:input path="user.password" type="password"
										class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" id="password" name="password"
										placeholder="Enter password" required="true" />
								</div>
								<div class="form-group">
									<form:label path="user.confirmPassword">Confirm Password</form:label>
									<form:input path="user.confirmPassword" type="password"
										class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" id="confirmPassword"
										name="confirmPassword" placeholder="Confirm password"
										required="true" />
								</div>
								<p class="font-italic text-danger">${errorPassword}</p>
							</div>
							<div class="col-sm-12 col-md-5 offset-md-1">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<form:label path="user.firstName">First Name</form:label>
											<form:input path="user.firstName" type="text"
												class="form-control" id="first-name" name="first-name"
												placeholder="First name" required="true" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<form:label path="user.lastName">Last Name</form:label>
											<form:input path="user.lastName" type="text"
												class="form-control" id="last-name" name="last-name"
												placeholder="Last name" required="true" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<form:label path="user.phoneNumber">Phone Number</form:label>
									<form:input path="user.phoneNumber" type="text"
										class="form-control" id="phone-number" name="phone-number"
										placeholder="Enter phone number" required="true" />
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<form:label path="user.gender">Gender:</form:label>
											<form:select path="user.gender" class="form-control"
												id="gender" name="gender" required="true">
												<option></option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</form:select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<form:label path="user.dateOfBirth">Date of Birth</form:label>
											<form:input path="user.dateOfBirth" type="date"
												class="form-control" name="date-of-birth" id="date-of-birth"
												required="true" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<h3>Store Information</h3>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<form:label path="seller.storeName">Store Name</form:label>
									<form:input path="seller.storeName" type="text"
										class="form-control" id="store-name" name="store-name"
										placeholder="Enter store name" maxlength="255" required="true" />
								</div>
								<div class="form-group">
									<form:label path="seller.businessRegNumber">Business Registration Number</form:label>
									<form:input path="seller.businessRegNumber" type="text"
										class="form-control ${not empty errorBusinessRegNumber ? 'is-invalid' : ''}" id="business-reg-number"
										name="business-reg-number"
										placeholder="Business Registration Number" required="true" />
								</div>
								<p class="font-italic text-danger">${errorBusinessRegNumber}</p>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<form:label path="seller.storeDescription">Store Description</form:label>
									<form:textarea path="seller.storeDescription"
										class="form-control" id="store-description"
										name="store-description" placeholder="Enter store description"
										rows="5"></form:textarea>
								</div>
							</div>
						</div>
						<h5>Store Address</h5>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<form:label path="address.addressLine1">Address Line 1</form:label>
									<form:input path="address.addressLine1" type="text"
										class="form-control" id="address-line1" name="address-line1"
										placeholder="Street/House No/Bldg. No" required="" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<form:label path="address.addressLine2">Address Line 2</form:label>
									<form:input path="address.addressLine2" type="text"
										class="form-control" id="address-line2" name="address-line2" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<form:label path="address.city">City</form:label>
									<form:input path="address.city" type="text"
										class="form-control" id="city" name="city" placeholder="City"
										required="" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<form:label path="address.state">State</form:label>
									<form:input path="address.state" type="text"
										class="form-control" id="state" name="state"
										placeholder="State/Province/Region" required="true" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<form:label path="address.country">Country</form:label>
									<form:input path="address.country" type="text"
										class="form-control" id="country" name="country"
										placeholder="Country" required="true" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<form:label path="address.zipCode">Zip-Code</form:label>
									<form:input path="address.zipCode" type="text"
										class="form-control" id="zip-code" name="zip-code"
										placeholder="zip-code" required="true" />
								</div>
							</div>
						</div>
						<br>
						<div class="d-flex justify-content-center">
							<button type="submit" class="btn btn-primary rounded">Register</button>
						</div>
						<div class="col-md-6 offset-md-3 mt-2">
							<p>
								<span>By proceeding to register, I acknowledge that I
									have read and consented to Boutiqa's <a href="#"
									class="font-italic">Terms of Use</a> and <a href="#"
									class="font-italic">Privacy Policy</a>
								</span>
							</p>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div><%@ include file="footer.jsp"%></div>
</body>
</html>
