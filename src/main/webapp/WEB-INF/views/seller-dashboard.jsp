
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="seller-header.jsp"%>
<div class="container-fluid">
	<div class="row">
		<%@ include file="seller-sidebar.jsp"%>
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
			<c:set var="firstName" value="${sessionScope.user.getFirstName()}" />
			<c:set var="lastName" value="${sessionScope.user.getLastName()}" />
			<h1 class="m-3">
				<span class="text-secondary">Hello,</span> ${firstName} ${lastName}
			</h1>
			
		</main>
	</div>
</div>
<%@ include file="modal.jsp"%>