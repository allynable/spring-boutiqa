<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

				<h1 class="m-3">User Administration</h1>
				<div class="row text-center justify-content-center">
					<div class="col-3">
						<%
						String successMessage = request.getParameter("successMessage");
						if (successMessage != null && !successMessage.isEmpty()) {
							if (successMessage.equals("1")) {
						%>
						<div class="alert alert-success" role="alert">Consumer added
							successfully!</div>
						<%
						} else if (successMessage.equals("2")) {
						%>
						<div class="alert alert-success" role="alert">Seller added
							successfully!</div>
						<%
						} else if (successMessage.equals("3")) {
						%>
						<div class="alert alert-success" role="alert">Successfully
							updated consumer!</div>
						<%
						} else if (successMessage.equals("4")) {
						%>
						<div class="alert alert-success" role="alert">Successfully
							updated seller!</div>
						<%
						} else {
						%>
						<div class="alert alert-danger" role="alert">Invalid success
							message</div>
						<%
						}
						}
						%>
					</div>
				</div>
				<div class="text-right">
					<a class="btn btn-primary" href="<c:url value='/addConsumerForm'/>">
						Add Consumer</a> <a class="btn btn-primary"
						href="<c:url value='/addSellerForm'/>"> Add Seller</a>
				</div>
				<hr class="mx-1">
				<div class="text-right m-2">
					<a class="text-primary m-2"
						href="<c:url value='/userAdministration'>
  							<c:param name='userTypeId' value='1' />
							</c:url>">Consumer</a>

					<a class="text-primary m-2"
						href="<c:url value='/userAdministration'>
 							 <c:param name='userTypeId' value='2' />
							</c:url>">Seller</a>
				</div>
				<div class="container-fluid bg-white rounded py-3">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>User Type</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Username</th>
								<th>Phone Number</th>
								<th>Date of Birth</th>
								<th>Gender</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td>${user.userType.userTypeName}</td>
									<td>${user.firstName}</td>
									<td>${user.lastName}</td>
									<td>${user.email}</td>
									<td>${user.username}</td>
									<td>${user.phoneNumber}</td>
									<td>${user.dateOfBirth}</td>
									<td>${user.gender}</td>
									<td><c:choose>
											<c:when test="${user.userType.userTypeName == 'Consumer'}">
												<a class="btn btn-warning"
													href="<c:url value='/editConsumerForm'><c:param name='userId' value='${user.userId}'/></c:url>"><i
													class="fa-solid fa-pen-to-square text-light"></i></a>
											</c:when>
											<c:when test="${user.userType.userTypeName == 'Seller'}">
												<a class="btn btn-warning"
													href="<c:url value='/editSellerForm'><c:param name='userId' value='${user.userId}'/></c:url>"><i
													class="fa-solid fa-pen-to-square text-light"></i></a>
											</c:when>
											<c:otherwise>
									    User type is not Consumer or Seller
									  </c:otherwise>
										</c:choose> <a class="btn btn-danger"><i
											class="fa-solid fa-trash text-light"></i></a></td>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
								<a class="page-link" href="?page=${currentPage - 1}"
								tabindex="-1"><i class="fa fa-angle-left"></i></a>
							</li>
							<c:forEach var="i" begin="0" end="${totalPages-1}">
								<li class="page-item ${currentPage == i ? 'active' : ''}">
									<a class="page-link" href="?page=${i}">${i+1}</a>
								</li>
							</c:forEach>
							<li
								class="page-item ${currentPage == totalPages-1 ? 'disabled' : ''}">
								<a class="page-link" href="?page=${currentPage + 1}"><i
									class="fa fa-angle-right"></i></a>
							</li>
						</ul>
					</nav>
				</div>
			</main>
		</div>
	</div>
	<%@ include file="modal.jsp"%>
</body>
</html>
