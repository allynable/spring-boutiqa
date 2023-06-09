<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Boutiqa</title>
<%@ include file="imports.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/css/templatemo-hexashop.css'/>">
</head>
<body>
	<div><%@ include file="header.jsp"%></div>
	<!-- ***** Main Banner Area End ***** -->
	<div class="main-banner" id="top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-content">
						<div class="thumb">
							<div class="inner-content">
								<h4>We Are Boutiqa</h4>
								<span>Awesome, clean &amp; creative HTML5 Template</span>
								<div class="main-border-button">
									<a href="#">Purchase Now!</a>
								</div>
							</div>
							<img src="<c:url value='/images/left-banner-image.jpg' />" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="right-content">
						<div class="row">
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Women</h4>
											<span>Best Clothes For Women</span>
										</div>
										<div class="hover-content">
											<div class="inner">
												<h4>Women</h4>
												<p>Lorem ipsum dolor sit amet, conservisii ctetur
													adipiscing elit incid.</p>
												<div class="main-border-button">
													<a href="#">Discover More</a>
												</div>
											</div>
										</div>
										<img src="<c:url value='/images/baner-right-image-01.jpg'/>">

									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Men</h4>
											<span>Best Clothes For Men</span>
										</div>
										<div class="hover-content">
											<div class="inner">
												<h4>Men</h4>
												<p>Lorem ipsum dolor sit amet, conservisii ctetur
													adipiscing elit incid.</p>
												<div class="main-border-button">
													<a href="#">Discover More</a>
												</div>
											</div>
										</div>
										<img src="<c:url value='/images/baner-right-image-02.jpg'/>">
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Kids</h4>
											<span>Best Clothes For Kids</span>
										</div>
										<div class="hover-content">
											<div class="inner">
												<h4>Kids</h4>
												<p>Lorem ipsum dolor sit amet, conservisii ctetur
													adipiscing elit incid.</p>
												<div class="main-border-button">
													<a href="#">Discover More</a>
												</div>
											</div>
										</div>
										<img src="<c:url value='/images/baner-right-image-03.jpg'/>">
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="right-first-image">
									<div class="thumb">
										<div class="inner-content">
											<h4>Accessories</h4>
											<span>Best Trend Accessories</span>
										</div>
										<div class="hover-content">
											<div class="inner">
												<h4>Accessories</h4>
												<p>Lorem ipsum dolor sit amet, conservisii ctetur
													adipiscing elit incid.</p>
												<div class="main-border-button">
													<a href="#">Discover More</a>
												</div>
											</div>
										</div>
										<img src="<c:url value='/images/baner-right-image-04.jpg'/>">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->

	<!-- ***** Explore Area Starts ***** -->
	<section class="section" id="explore">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-content">
						<h2>Explore Our Products</h2>
						<span>You are allowed to use this HexaShop HTML CSS
							template. You can feel free to modify or edit this layout. You
							can convert this template as any kind of ecommerce CMS theme as
							you wish.</span>
						<div class="quote">
							<i class="fa fa-quote-left"></i>
							<p>You are not allowed to redistribute this template ZIP file
								on any other website.</p>
						</div>
						<p>There are 5 pages included in this HexaShop Template and we
							are providing it to you for absolutely free of charge at our
							TemplateMo website. There are web development costs for us.</p>
						<p>
							If this template is beneficial for your website or business,
							please kindly <a rel="nofollow"
								href="https://paypal.me/templatemo" target="_blank">support
								us</a> a little via PayPal. Please also tell your friends about our
							great website. Thank you.
						</p>
						<div class="main-border-button">
							<a href="<c:url value='/productList'/>">Discover More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="right-content">
						<div class="row">
							<div class="col-lg-6">
								<div class="leather">
									<h4>Leather Bags</h4>
									<span>Latest Collection</span>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="first-image">
									<img src="<c:url value='/images/explore-image-01.jpg'/>" alt="">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="second-image">
									<img src="<c:url value='/images/explore-image-02.jpg'/>" alt="">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="types">
									<h4>Different Types</h4>
									<span>Over 304 Products</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Explore Area Ends ***** -->

	<div><%@ include file="footer.jsp"%></div>
</body>
</html>
