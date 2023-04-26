<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg bg-white" style="background-color:white;">
	<div class="container-fluid">
		<a class="navbar-brand" href="<c:url value='/'/> "><img
			src="<c:url value='/images/Boutiqa.png'/>" alt="Boutiqa"
			style="width: 70px; height: 70px" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa-solid fa-bars text-primary"></i>
		</button>
		<div class="collapse navbar-collapse text-center"
			id="navbarSupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item mx-3"><a href="<c:url value='/productList'/>">Products</a>
					</li>
			</ul>
			<sec:authorize access="isAuthenticated()">
				<ul class="navbar-nav">
					<li class="nav-item mx-3"><a href="<c:url value='/home'/>">Home</a>
					</li>
				</ul>
			</sec:authorize>
			<form action="searchProduct">
				<div class="input-group pl-5 pr-5 col-md-12">
					<input name="keyword" type="text" class="form-control search-input"
						placeholder="Search for products" />
					<div class="input-group-append">
						<button type="submit" class="input-group-text bg-primary" ><i
							class="fas fa-search text-white"></i></button>
					</div>
				</div>
			</form>
			<ul class="navbar-nav">
				<li class="nav-item"><a href="#"><i
						class="fas fa-shopping-cart fa-2x text-primary"></i></a></li>
			</ul>
			<ul class="navbar-nav ml-auto mr-5">
				<sec:authorize access="!isAuthenticated()">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/consumerRegistration'/>">Register</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/sellerRegistration'/>">Sell on Boutiqa</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/showLogin'/>">Login</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown mr-5"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
							${sessionScope.user.getFirstName()} </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item text-primary"
								href="<c:url value='/showConsumerProfile'/>"> <i
								class="fas fa-user fa-sm fa-fw mr-2"></i> Profile
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item text-primary" href="#" id="logout-button">
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2"></i> Logout
							</a>
						</div></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>
<%@ include file="modal.jsp"%>

