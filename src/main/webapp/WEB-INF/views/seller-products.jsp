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
	<%@ include file="seller-header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="seller-sidebar.jsp"%>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<h1 class="m-3">Product List</h1>
				<hr class="mx-1">
				<div class="container-fluid bg-white rounded py-3">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Product Id</th>
								<th>Product Name</th>
								<th>Product Description</th>
								<th>Price</th>
								<th>Stock</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products}">
								<tr>
									<td>${product.productId}</td>
									<td>${product.productName}</td>
									<td>${product.productDescription}</td>
									<td>${product.price}</td>
									<td>${product.stock}</td>
									<td><a class="btn btn-warning"><i
											class="fa-solid fa-pen-to-square text-light"></i></a> <a
										class="btn btn-danger"><i
											class="fa-solid fa-trash text-light"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
	<%@ include file="modal.jsp"%>
</body>
</html>