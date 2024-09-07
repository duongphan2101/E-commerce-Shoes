<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Product</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="./css/slick.css" />
<link type="text/css" rel="stylesheet" href="./css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="./css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="./css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/brands.min.css">
<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/style_style.css">
	<script>
		function showAlert(message) {
	        alert(message);
	    }
	</script>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- Product main img -->
				<div class="col-md-5 col-md-push-2">
					<div id="product-main-img">
						<div class="product-preview">
							<img src="${ListImage[0]}" alt="">
						</div>

						<div class="product-preview">
							<img src="${ListImage[1]}" alt="">
						</div>

						<div class="product-preview">
							<img src="${ListImage[2]}" alt="">
						</div>

						<div class="product-preview">
							<img src="${ListImage[3]}" alt="">
						</div>
						<div class="product-preview">
							<img src="${ListImage[4]}" alt="">
						</div>
					</div>
				</div>
				<!-- /Product main img -->

				<!-- Product thumb imgs -->
				<div class="col-md-2  col-md-pull-5">
					<div id="product-imgs">
						<div class="product-preview">
							<img src="${ListImage[0]}" alt="">
						</div>

						<div class="product-preview">
							<img src="${ListImage[1]}" alt="">
						</div>

						<div class="product-preview">
							<img src="${ListImage[2]}" alt="">
						</div>

						<div class="product-preview">
							<img src="${ListImage[3]}" alt="">
						</div>
						<div class="product-preview">
							<img src="${ListImage[4]}" alt="">
						</div>
					</div>
				</div>
				<!-- /Product thumb imgs -->

				<!-- Product details -->
				<div class="col-md-5">
					<div class="product-details">
						<h2 class="product-name">${Product.name}</h2>
						<div>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o"></i>
							</div>
							<a class="review-link" href="#reviews">${num} Review(s) | Add your
								review</a>
						</div>
						<div>
							<h3 class="product-price">${Product.price}$</h3>

						</div>
						<p>${Product.title}</p>
						<p>${Product.description}</p>
						<form action="addtocart" method="post">
							<input type="hidden" value="${Product.id}" name="product_id">
							<div class="product-options">
								<label> Size 
									<select class="input-select" name="size">
										<c:forEach items="${listSize}" var="o">
											<option value="${o}">${o}</option>
										</c:forEach>
									</select>
								</label>
							</div>
	
							<div class="add-to-cart">
								<div class="qty-label">
									Qty
									<div class="input-number">
										<input type="number" name="quantity" value="1" min="1"/> <span class="qty-up">+</span> <span
											class="qty-down">-</span>
									</div>
								</div>
								<button class="add-to-cart-btn" type="submit" name="action" value="add">
									<i class="fa fa-shopping-cart"></i> Add to Cart
								</button>
								<button class="add-to-cart-btn" type="submit" name="action" value="order">
									<i class="fa fa-shopping-cart"></i> Oder
								</button>
							</div>
						</form>
						

						<ul class="product-btns">
							<li><a href="#"><i class="fa fa-heart-o"></i> add to
									wishlist</a></li>
							<li><a href="#"><i class="fa fa-exchange"></i> add to
									compare</a></li>
						</ul>


					</div>
				</div>
				<!-- /Product details -->

				<!-- Product tab -->
				<div class="col-md-12">
					<div id="product-tab">

						<ul class="tab-nav">
							<li class="active">Reviews</li>
						</ul>

						<!-- tab3  -->
						<div>
							<div class="row">						

								<!-- Reviews -->
								<div class="col-md-5">
									<div id="reviews" style="max-height: 350px; overflow-y: auto;">
										<ul class="reviews">
											<c:forEach items="${listReview}" var="x">
											    <li>
											        <div class="review-heading">
											            <h5 class="name">${Uname[x.user.user_id]}</h5>
											            <p class="date">${x.review_date}</p>
											            <div class="review-rating">
											                <c:forEach var="i" begin="1" end="${x.rating}">
											                    <i class="fa fa-star"></i>
											                </c:forEach>
											                <c:forEach var="i" begin="${x.rating + 1}" end="5">
											                    <i class="fa fa-star-o empty"></i>
											                </c:forEach>
											            </div>
											        </div>
											        <div class="review-body">
											            <p>${x.review_text}</p>
											        </div>
											    </li>
											</c:forEach>

										</ul>
										 <!--<ul class="reviews-pagination">
											<li class="active">1</li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
										</ul> -->
									</div>
								</div>
								<!-- /Reviews -->
								<%
								HttpSession session2 = request.getSession(false);
								if (session2 != null) {
									String alertMessage = (String) session2.getAttribute("alertMessage");
									String alertType = (String) session2.getAttribute("alertType");
									if (alertMessage != null && alertType != null) {
								%>
								<div
									class="alert alert-<%=alertType%> alert-dismissible fade show"
									role="alert">
									<%=alertMessage%>
									<button type="button" class="btn-close" data-bs-dismiss="alert"
										aria-label="Close"></button>
								</div>
								<%
								session2.removeAttribute("alertMessage");
								session2.removeAttribute("alertType");
								}
								}
								%>
								<!-- Review Form -->
								<div class="col-md-7">
									<div id="review-form">
										<form class="review-form" action="Review" method="post">
											<textarea name="review-text" class="input"
												placeholder="Your Review"></textarea>
											<div class="input-rating">
												<span>Your Rating: </span>
												<div class="stars">
													<input id="star5" name="rating" value="5" type="radio"><label
														for="star5"></label> <input id="star4" name="rating"
														value="4" type="radio"><label for="star4"></label>
													<input id="star3" name="rating" value="3" type="radio"><label
														for="star3"></label> <input id="star2" name="rating"
														value="2" type="radio"><label for="star2"></label>
													<input id="star1" name="rating" value="1" type="radio"><label
														for="star1"></label>
													<input value="${Product.id}"
														type="hidden" name="product_id"> 
													<input
														value="${sessionScope.a.uID}" type="hidden"
														name="account_id">
												</div>
											</div>
											<button class="primary-btn" type="submit">Submit</button>
										</form>
									</div>
								</div>
								<!-- /Review Form -->
								
							</div>
						</div>
						<!-- /tab3  -->
					</div>
					<!-- /product tab content  -->
				</div>
			</div>
			<!-- /product tab -->

		</div>
		<!-- /row -->
	<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- Section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-12">
					<div class="section-title text-center">
						<h3 class="title">Related Products</h3>
					</div>
				</div>

				<!-- product -->
				<c:forEach items="${lst}" var="o">
					<div class="col-md-3 col-xs-6">
						<div class="product">
							<a href="Product?pid=${o.id}" class="product-img"> <img
								src="${productImagesMap[o.id]}" alt="">
							</a>
							<div class="product-body">
								<p class="product-category">Category</p>
								<h3 class="product-name">
									<a href="#">${o.name}</a>
								</h3>
								<h4 class="product-price">$${o.price}</h4>
								<div class="product-rating"></div>
								<div class="product-btns">
									<button class="add-to-wishlist">
										<i class="fa fa-heart-o"></i><span class="tooltipp">add
											to wishlist</span>
									</button>
									<button class="add-to-compare">
										<i class="fa fa-exchange"></i><span class="tooltipp">add
											to compare</span>
									</button>
									<button class="quick-view">
										<i class="fa fa-eye"></i><span class="tooltipp">quick
											view</span>
									</button>
								</div>
							</div>
							<div class="add-to-cart">
								<button class="add-to-cart-btn">
									<i class="fa fa-shopping-cart"></i> add to cart
								</button>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- /product -->


			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /Section -->

	<jsp:include page="Footer.jsp"></jsp:include>

	<!-- jQuery Plugins -->
	<script src="./js/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="./js/slick.min.js"></script>
	<script src="./js/nouislider.min.js"></script>
	<script src="./js/jquery.zoom.min.js"></script>
	<script src="./js/main.js"></script>

</body>
</html>
