<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<nav
	class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-md-3 col-lg-2 mr-0 text-white text-center"
		href="<c:url value='/home'/>"> Home</a>
	<form action="userSearch">
		<input name="keyword" class="form-control" type="text"
			placeholder="Search" aria-label="Search">
	</form>
	<ul class="navbar-nav px-3">
		<li class="nav-item text-nowrap"><a class="text-white" href="#"
			id="logout-button"> <i
				class="fas fa-sign-out-alt fa-sm fa-fw mr-2"></i> Logout
		</a></li>
	</ul>
</nav>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-secondary sidebar">
			<div class="sidebar-sticky pt-3">
				<div class="nav">
					<ul class="list-unstyled">
						<li><a class="nav-link text-light"
							href="<c:url value='/userAdministration'/>"><i
								class="fa fa-user-gear mr-3"></i>User Administration</a></li>
						<li><a class="nav-link text-light" href=""><i
								class="fa fa-envelopes-bulk mr-3"></i>Bulk Email</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
			<c:set var="firstName" value="${sessionScope.user.getFirstName()}" />
			<c:set var="lastName" value="${sessionScope.user.getLastName()}" />

			<h1 class="m-3">
				<span class="text-secondary">Hello,</span> ${firstName} ${lastName}
			</h1>
			<hr class="mx-1">
			
			
		</main>
	</div>
</div>
<%@ include file="modal.jsp"%>