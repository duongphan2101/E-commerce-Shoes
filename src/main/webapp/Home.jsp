<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
	</script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/brands.min.css">
	<link href="https://mdbootstrap.com/img/logo/mdb-transaprent-noshadows.png" rel="icon">
	<link rel="stylesheet" href="./css/style_style.css">
<style type="text/css">
	.prod:hover {
		cursor: pointer;
	}
	
	.icon-hover:hover {
		border-color: #3b71ca !important;
		background-color: white !important;
	}
	
	.icon-hover:hover i {
		color: #3b71ca !important;
	}
	
	.product-bestseller:hover a {
		color: #3b71ca;
	}
	
	a {
		text-decoration: none;
	}
	
	.tab-user {
		display: none;
	}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<!-- Jumbotron -->
	<div class="bg-primary text-white py-5"
		style="background-image: url('${productImagesMap[P.id]}'); background-size: cover; background-position: center; position: relative;">
		<div class="overlay"
			style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background-color: rgba(0, 0, 0, 0.5);">
		</div>
		<div class="container py-5" style="position: relative; z-index: 2;">
			<h1>${P.name}</h1>
			<p>${P.title}</p>
			<button type="button"
				class="btn btn-outline-light product-bestseller">
				<a href="Product?pid=${P.id}" class="text-danger">Learn more</a>
			</button>
			<button type="button"
				class="btn btn-light shadow-0 text-primary pt-2 border border-white">
				<a href="Product?pid=${P.id}" class="pt-1 text-primary">Purchase now</a>
			</button>
		</div>
	</div>

	<!-- Jumbotron -->
	<!-- Products -->
	<section>
		<div class="container my-5">
			<header class="mb-4">
				<h3>New products</h3>
			</header>

			<div class="row">
				<c:forEach var="o" items="${listP}">
					<div class="col-lg-3 col-md-6 col-sm-6 d-flex prod">
						<div class="card w-100 my-2 shadow-2-strong">
							<a href="Product?pid=${o.id}" class="product"> <c:choose>
									<c:when test="${productImagesMap[o.id] != null}">
										<img src="${productImagesMap[o.id]}" class="card-img-top"
											style="aspect-ratio: 1/1" />
									</c:when>
									<c:otherwise>
										<img src="Imgs/default.jpg" class="card-img-top"
											style="aspect-ratio: 1/1" />
									</c:otherwise>
								</c:choose>
							</a>
							<div class="card-body d-flex flex-column">
								<h5 class="card-title">${o.name}</h5>
								<p class="card-text">${o.price}$</p>
								<div class="card-footer d-flex justify-content-center">
									<a href="Product?pid=${o.id}" class="btn btn-primary shadow-0 me-1">Purchase Now</a>
									<a href="#!"
										class="btn btn-light border px-2 pt-2 icon-hover"><i
										class="fas fa-heart fa-lg text-secondary px-1"></i></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>
	<!-- Products -->

	<!-- Feature -->
	<section class="mt-5" style="background-color: #f5f5f5;">
		<div class="container text-dark pt-3">
			<header class="pt-4 pb-3">
				<h3>Why choose us</h3>
			</header>

			<div class="row mb-4">
				<div class="col-lg-4 col-md-6">
					<figure class="d-flex align-items-center mb-4">
						<span class="rounded-circle bg-white p-3 d-flex me-2 mb-2">
							<i class="fas fa-camera-retro fa-2x fa-fw text-primary floating"></i>
						</span>
						<figcaption class="info">
							<h6 class="title">Reasonable prices</h6>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
								sed do eiusmor</p>
						</figcaption>
					</figure>
					<!-- itemside // -->
				</div>
				<!-- col // -->
				<div class="col-lg-4 col-md-6">
					<figure class="d-flex align-items-center mb-4">
						<span class="rounded-circle bg-white p-3 d-flex me-2 mb-2">
							<i class="fas fa-star fa-2x fa-fw text-primary floating"></i>
						</span>
						<figcaption class="info">
							<h6 class="title">Best quality</h6>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
								sed do eiusmor</p>
						</figcaption>
					</figure>
					<!-- itemside // -->
				</div>
				<!-- col // -->
				<div class="col-lg-4 col-md-6">
					<figure class="d-flex align-items-center mb-4">
						<span class="rounded-circle bg-white p-3 d-flex me-2 mb-2">
							<i class="fas fa-plane fa-2x fa-fw text-primary floating"></i>
						</span>
						<figcaption class="info">
							<h6 class="title">Worldwide shipping</h6>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
								sed do eiusmor</p>
						</figcaption>
					</figure>
					<!-- itemside // -->
				</div>
				<!-- col // -->
				<div class="col-lg-4 col-md-6">
					<figure class="d-flex align-items-center mb-4">
						<span class="rounded-circle bg-white p-3 d-flex me-2 mb-2">
							<i class="fas fa-users fa-2x fa-fw text-primary floating"></i>
						</span>
						<figcaption class="info">
							<h6 class="title">Customer satisfaction</h6>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
								sed do eiusmor</p>
						</figcaption>
					</figure>
					<!-- itemside // -->
				</div>
				<!-- col // -->
				<div class="col-lg-4 col-md-6">
					<figure class="d-flex align-items-center mb-4">
						<span class="rounded-circle bg-white p-3 d-flex me-2 mb-2">
							<i class="fas fa-thumbs-up fa-2x fa-fw text-primary floating"></i>
						</span>
						<figcaption class="info">
							<h6 class="title">Happy customers</h6>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
								sed do eiusmor</p>
						</figcaption>
					</figure>
					<!-- itemside // -->
				</div>
				<!-- col // -->
				<div class="col-lg-4 col-md-6">
					<figure class="d-flex align-items-center mb-4">
						<span class="rounded-circle bg-white p-3 d-flex me-2 mb-2">
							<i class="fas fa-box fa-2x fa-fw text-primary floating"></i>
						</span>
						<figcaption class="info">
							<h6 class="title">Thousand items</h6>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
								sed do eiusmor</p>
						</figcaption>
					</figure>
					<!-- itemside // -->
				</div>
				<!-- col // -->
			</div>
		</div>
		<!-- container end.// -->
	</section>
	<!-- Feature -->

	<!-- Blog -->
	<section class="mt-5 mb-4">
		<div class="container text-dark">
			<header class="mb-4">
				<h3>Blog posts</h3>
			</header>

			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6 col-12">
					<article>
						<a href="#" class="img-fluid"> <img class="rounded w-100"
							src="https://mdbootstrap.com/img/bootstrap-ecommerce/posts/1.webp"
							style="object-fit: cover;" height="160" />
						</a>
						<div class="mt-2 text-muted small d-block mb-1">
							<span> <i class="fa fa-calendar-alt fa-sm"></i> 23.12.2022
							</span> <a href="#"><h6 class="text-dark">How to promote brands</h6></a>
							<p>When you enter into any new area of science, you almost
								reach</p>
						</div>
					</article>
				</div>
				<!-- col.// -->
				<div class="col-lg-3 col-md-6 col-sm-6 col-12">
					<article>
						<a href="#" class="img-fluid"> <img class="rounded w-100"
							src="https://mdbootstrap.com/img/bootstrap-ecommerce/posts/2.webp"
							style="object-fit: cover;" height="160" />
						</a>
						<div class="mt-2 text-muted small d-block mb-1">
							<span> <i class="fa fa-calendar-alt fa-sm"></i> 13.12.2022
							</span> <a href="#"><h6 class="text-dark">How we handle
									shipping</h6></a>
							<p>When you enter into any new area of science, you almost
								reach</p>
						</div>
					</article>
				</div>
				<!-- col.// -->
				<div class="col-lg-3 col-md-6 col-sm-6 col-12">
					<article>
						<a href="#" class="img-fluid"> <img class="rounded w-100"
							src="https://mdbootstrap.com/img/bootstrap-ecommerce/posts/3.webp"
							style="object-fit: cover;" height="160" />
						</a>
						<div class="mt-2 text-muted small d-block mb-1">
							<span> <i class="fa fa-calendar-alt fa-sm"></i> 25.11.2022
							</span> <a href="#"><h6 class="text-dark">How to promote brands</h6></a>
							<p>When you enter into any new area of science, you almost
								reach</p>
						</div>
					</article>
				</div>
				<!-- col.// -->
				<div class="col-lg-3 col-md-6 col-sm-6 col-12">
					<article>
						<a href="#" class="img-fluid"> <img class="rounded w-100"
							src="https://mdbootstrap.com/img/bootstrap-ecommerce/posts/4.webp"
							style="object-fit: cover;" height="160" />
						</a>
						<div class="mt-2 text-muted small d-block mb-1">
							<span> <i class="fa fa-calendar-alt fa-sm"></i> 03.09.2022
							</span> <a href="#"><h6 class="text-dark">Success story of
									sellers</h6></a>
							<p>When you enter into any new area of science, you almost
								reach</p>
						</div>
					</article>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog -->
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>