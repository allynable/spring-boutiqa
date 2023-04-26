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