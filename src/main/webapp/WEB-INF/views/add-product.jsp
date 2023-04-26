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
				<h1 class="m-3">Add Product</h1>
				<hr class="mx-1">
				<div class="container rounded col-6 offset-3 bg-white py-3">
					<form:form method="POST" action="addProduct"
						 modelAttribute="product">
						<div class="row">
							<div class="col-10 offset-1">
								<div>
									<label for="productName">Product Name</label>
									<form:input path="productName" id="productName"
										required="required" class="form-control" />
								</div>
								<div>
									<label for="productDescription">Product Description</label>
									<form:textarea path="productDescription"
										id="productDescription" required="required" class="form-control"/>
								</div>
								<div>
									<label for="price">Price</label>
									<form:input path="price" id="price" type="number"
										required="required" class="form-control"/>
								</div>
								<div>
									<label for="stock">Stock</label>
									<form:input path="stock" id="stock" type="number"
										required="required" class="form-control"/>
								</div>
								<div class="text-center my-3">
									<button type="submit" class="btn btn-primary">Add Product</button>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</main>
		</div>
	</div>
	<%@ include file="modal.jsp"%>
</body>
</html>