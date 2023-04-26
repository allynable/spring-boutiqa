<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Products</title>
<%@ include file="imports.jsp"%>
</head>
<body>
	<div><%@ include file="header.jsp"%></div>
	<div class="container my-5">
		<%
		String keyword = request.getParameter("keyword");
		if (keyword != null && !keyword.isEmpty()) {
		%>
		<h2 class="mb-3">
			Search Results for "<%=keyword%>"
		</h2>
		<%
		}
		%>
		<div class="row justify-content-center">
			<c:forEach var="product" items="${searchProduct}">
				<div class="col-10 col-md-6 col-lg-4 mb-5">
					<div class="item">
						<img src="<c:url value='${product.productImage.imageUrl}'/>"
							class="w-100" alt="${product.productName}">
						<div class="down-content">
							<h4 class="py-1 product-name">${product.productName}</h4>
							<p class="card-text product-description">${product.productDescription}</p>
							<div class="row">
								<div class="col-sm-6">
									<span class="text-secondary">P ${product.price}</span>
								</div>
								<div class="col-sm-6 text-end">
									<span class="text-secondary">${product.stock} pieces available</span>
								</div>
							</div>
							<div class="text-center my-2">
								<a class="btn btn-outline-primary" href="#"><i
									class="fa fa-shopping-cart mr-2"></i>Add to Cart</a> <a
									class="btn btn-primary" href="#">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div><%@ include file="footer.jsp"%></div>
</body>
</html>
