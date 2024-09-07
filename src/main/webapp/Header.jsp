<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--Main Navigation-->
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
		.tab-user {
			display: none;
		}
	</style>
</head>
<body>
	<header>
	<!-- Jumbotron -->
	<div class="p-3 text-center bg-white border-bottom">
		<div class="container">
			<div class="row gy-3">
				<!-- Left elements -->
				<div class="col-lg-2 col-sm-4 col-4">
					<a href="home" target="_blank" class="float-start"> <img
						src="https://mdbootstrap.com/img/logo/mdb-transaprent-noshadows.png"
						height="35" />
					</a>
				</div>
				<!-- Left elements -->

				<!-- Center elements -->
				<div class="order-lg-last col-lg-5 col-sm-8 col-8">
					<ul class="d-flex float-end">
						<c:if test="${sessionScope.a == null}">
							<li>
								<a href="Login.jsp"
								class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"
								target="_blank"><i class="fas fa-user m-1 me-md-2"></i><p class="d-none d-md-block mb-0">Sign in</p>
								</a>							
							</li>
							<li>
								<a href=""
									class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"
									target="_blank"> <i class="fas fa-heart m-1 me-md-2"></i><p class="d-none d-md-block mb-0">Wishlist</p>
								</a>
							</li>
							
							<li class="border rounded py-1 px-3 nav-link d-flex align-items-center user-tab" style="position: relative;">
							    <i class="fas fa-shopping-cart m-1 me-md-2"></i>
							    <p class="d-none d-md-block mb-0">My cart</p>
							    <ul class="tab-user_ul p-0 m-0 tab-user" style="width: 350px; left: -235px;">
							        <c:forEach items="${listVariant}" var="p">
							        	<c:set var="productId" value="${p.product.id}"/>
									    <c:if test="${productImagesCart[productId] != null}">
									        <c:set var="productImageLink" value="${productImagesCart[productId]}"/>
									    </c:if>
							        	<li class="user-ul-li p-2" style="width: 100%; height: 60px; position: relative;">
										    <a href="Product?pid=${p.product.id}" class="d-flex w-100 h-100 align-items-center" style="position: relative; text-decoration: none;">
										        <img src="${productImageLink}" alt="Product Image" style="width: 50px; height: 50px;">
										        <div class="d-flex justify-content-between align-items-center flex-grow-1 ms-2" style="padding: 5px;">
										            <div class="px-2">${p.product.name}</div>
										            <div class="d-flex align-items-center">
										                <div class="me-2">Size ${p.size}</div>
										                <div class="input-number d-flex">
										                    <input type="number" min="1" value="${p.amount}" class="form-control" style="width: 60px;">
										                </div>
										            </div>
										        </div>
										    </a>
										</li>

							        </c:forEach>
							    </ul>
							</li>
						</c:if>
						<c:if test="${sessionScope.a != null}">
							<li
								class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center user-tab"
								target="_blank" style="position: relative;">
								<i class="fas fa-user m-1 me-md-2"></i>
								<p class="d-none d-md-block mb-0">${sessionScope.a.username}</p>
								<div class="tab-user">
									<ul class="tab-user_ul p-0 m-0">
										<li class="user-ul-li p-2"><a data-bs-toggle="modal"
											data-bs-target="#myModal">Thông tin cá nhân</a></li>
										<li class="user-ul-li p-2"><a data-bs-toggle="modal"
											data-bs-target="#changePass">Đổi Mật Khẩu</a></li>
										<li class="user-ul-li p-2"><a href="Logout">Đăng Xuất</a></li>
									</ul>
								</div>
							</li>
							<li href=""
								class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center"
								target="_blank"><i class="fas fa-heart m-1 me-md-2"></i> <a
								href="#"><p class="d-none d-md-block mb-0">Wishlist</p></a>
							</li>
							<li class="border rounded py-1 px-3 nav-link d-flex align-items-center user-tab" style="position: relative;">
							    <i class="fas fa-shopping-cart m-1 me-md-2"></i>
							    <p class="d-none d-md-block mb-0">My cart</p>
							    <ul class="tab-user_ul p-0 m-0 tab-user" style="width: 350px; left: -235px;">
							        <c:forEach items="${listVariant}" var="p">
							        	<c:set var="productId" value="${p.product.id}"/>
									    <c:if test="${productImagesCart[productId] != null}">
									        <c:set var="productImageLink" value="${productImagesCart[productId]}"/>
									    </c:if>
							        	<li class="user-ul-li p-2" style="width: 100%; height: 60px; position: relative;">
										    <a href="Product?pid=${p.product.id}" class="d-flex w-100 h-100 align-items-center" style="position: relative; text-decoration: none;">
										        <img src="${productImageLink}" alt="Product Image" style="width: 50px; height: 50px;">
										        <div class="d-flex justify-content-between align-items-center flex-grow-1 ms-2" style="padding: 5px;">
										            <div class="px-2">${p.product.name}</div>
										            <div class="d-flex align-items-center">
										                <div class="me-2">Size ${p.size}</div>
										                <div class="input-number d-flex">
										                    <input type="number" min="1" value="${p.amount}" class="form-control" style="width: 60px;">
										                </div>
										            </div>
										        </div>
										    </a>
										</li>

							        </c:forEach>
							    </ul>
							</li>
						</c:if>
					</ul>
				</div>
				<!-- Center elements -->

				<!-- Right elements -->
				<div class="col-lg-5 col-md-12 col-12">
					<form class="input-group float-center" action="Search">
						<div class="form-outline" style="width: 80%;">
							<input value="${search}" type="search" id="form1"
								class="form-control" name="txtSearch" placeholder="Search ..." />
						</div>
						<button type="submit" class="btn btn-primary shadow-0">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
				<!-- Right elements -->
			</div>
		</div>
	</div>
	<!-- Jumbotron -->

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
		<!-- Container wrapper -->
		<div
			class="container justify-content-center justify-content-md-between">
			<!-- Toggle button -->
			<button class="navbar-toggler border py-2 text-dark" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarLeftAlignExample"
				aria-controls="navbarLeftAlignExample" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarLeftAlignExample">
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link text-dark"
						aria-current="page" href="home">Home</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="Category">Categories</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Hot
							offers</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Gift
							boxes</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Projects</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Menu
							item</a></li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">Menu
							name</a></li>
					<!-- Navbar dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-dark" href="#"
						id="navbarDropdown" role="button" data-mdb-toggle="dropdown"
						aria-expanded="false"> Others </a> <!-- Dropdown menu -->
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
				<!-- Left links -->
			</div>
		</div>
		<!-- Container wrapper -->
	</nav>
	<!-- Navbar -->

	<form class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h4 style="width: 100%; text-align: center; color: white;">Thông Tin Cá Nhân</h4>
					<button class="btn-close text-white" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<c:if test="${sessionScope.a != null}">
						<div class="row">
							<div class="col-sm-3">Username:</div>
							<div class="col-sm-6" align="center">
								${sessionScope.a.username}</div>
						</div>
						
						<div class="row mt-3">
							<div class="col-sm-3">Name:</div>
							<div class="col-sm-6" align="center">
								${sessionScope.u.name}</div>
						</div>
						
						<div class="row mt-3">
							<div class="col-sm-3">Phone number</div>
							<div class="col-sm-6" align="center">
								${sessionScope.u.phone_number}</div>

						</div>
						<div class="row mt-3">
							<div class="col-sm-3">ID number</div>
							<div class="col-sm-6" align="center">
								${sessionScope.u.idnumber}</div>
						</div>
						<div class="row mt-3">
							<div class="col-sm-3">Address</div>
							<div class="col-sm-6" align="center">
								${sessionScope.u.address}</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</form>

	<!-- Change Pass -->
	<form class="modal fade" id="changePass" action="ChangePass" method="post">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary"> 
					<h4 style="width: 100%; text-align: center;" class="text-white">Đổi Mật Khẩu</h4>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-3">Mật Khẩu cũ:</div>
						<div class="col-sm-9" align="center">
							<input name="oldPass" type="password" class="form-control" />
							<input name="user" type="hidden" class="form-control" value="${sessionScope.a.username}" />
							<input name="uid" type="hidden" class="form-control" value="${sessionScope.a.uID}" />
							<span class="text-danger">${mess}</span>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-sm-3">Mật Khẩu mới:</div>
						<div class="col-sm-9" align="center">
							<input name="newPass" type="password" class="form-control" />
						</div>

					</div>
					<div class="row mt-3">
						<div class="col-sm-3">Xác nhận mật Khẩu:</div>
						<div class="col-sm-9" align="center">
							<input name="rePass" type="password" class="form-control" />
							<span class="text-danger">${mess1}</span>
						</div>

					</div>
					<div class="row mt-3">
						<div class="col-sm-3"></div>
						<div class="col-sm-6">
							<button class="form-control btn btn-primary" type="submit">Đổi
								Mật Khẩu</button>
						</div>
						<div class="col-sm-3"></div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- end change pass -->
</header>
</body>
</html>