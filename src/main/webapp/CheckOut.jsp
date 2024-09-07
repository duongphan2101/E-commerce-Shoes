<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>CheckOut</title>

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
		document.addEventListener("DOMContentLoaded", function() {
            var deleteButtons = document.querySelectorAll('#btn-delete');
            deleteButtons.forEach(function(button) {
                button.addEventListener('click', function() {
 
                    var row = button.closest('tr');
                    if (row) {
                        row.remove();
                    }
                });
            });
        });	
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

                <div class="col-md-7">
                <c:set var="productId" value="${pv.product.id}"/>
				<c:if test="${productImages[productId] != null}">
					<c:set var="productImageLink" value="${productImages[productId]}"/>
				</c:if>
                    <table class="table border mt-0">
                            <tr class="row-product_total" style=" vertical-align: middle; text-align: center; ">
								<th class="col-md-4">${p.name}</th>
                                <td class="col-md-3"><img style="max-width: 50%; height: auto;" src="${productImageLink}" alt=""></td>
                                <td class="col-md-1"><strong>Price</strong> <br> $${p.price}</td>
                                <td class="col-md-1"><strong>Amount</strong> <br> ${pv.amount}</td>
                                <td class="col-md-1"><strong>Size</strong> ${pv.size}</td>
                                <td class="col-md-2"><button id="btn-delete" class="btn btn-danger">Delete</button></td>
                            </tr>
                    </table>
                    <!-- Billing Details -->
                    <div class="billing-details">
                        <div class="section-title">
                            <h3 class="title">Địa Chỉ Thanh Toán</h3>
                        </div>
                        <c:if test="${sessionScope.a != null}">
                        	<form action="">
	                            <div class="form-group">
	                                <input class="input" type="text" name="name" placeholder="Name" value="${sessionScope.u.name}">
	                            </div>
	                            <div class="form-group mt-2">
	                                <input class="input" type="email" name="email" placeholder="Email">
	                            </div>
	                            <div class="form-group mt-2">
	                                <input class="input" type="text" name="address" placeholder="Address" value="${sessionScope.u.address}">
	                            </div>
	                            <div class="form-group mt-2">
	                                <input class="input" type="text" name="id_number" placeholder="CCCD" value="${sessionScope.u.idnumber}">
	                            </div>
	                            <div class="form-group mt-2">
	                                <input class="input" type="tel" name="tel" placeholder="Telephone" value="${sessionScope.u.phone_number}">
	                            </div>
	                        </form>
                        </c:if>
                        <c:if test="${sessionScope.a == null}">
                        	<form action="">
	                            <div class="form-group">
	                                <input class="input" type="text" name="name" placeholder="Name">
	                            </div>
	                            <div class="form-group mt-2">
	                                <input class="input" type="email" name="email" placeholder="Email">
	                            </div>
	                            <div class="form-group mt-2">
	                                <input class="input" type="text" name="address" placeholder="Address">
	                            </div>
	                            <div class="form-group mt-2">
	                                <input class="input" type="text" name="id_number" placeholder="CCCD">
	                            </div>
	                            <div class="form-group mt-2">
	                                <input class="input" type="tel" name="tel" placeholder="Telephone">
	                            </div>
	                        </form>
                        </c:if>
                        
                        <div class="form-group mt-2">
                            <div class="input-checkbox">
                                <c:if test="${sessionScope.a == null}">
                                	<input type="checkbox" id="create-account">
	                                <label for="create-account">
	                                    <span></span>
	                                    Create Account?
	                                </label>
                                </c:if>
                                <div class="caption">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                        incididunt.</p>
                                    <input class="input" type="password" name="password"
                                        placeholder="Enter Your Password">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Billing Details -->

                    <!-- Shiping Details -->
                    <div class="shiping-details">
                        <div class="section-title">
                            <h3 class="title">Địa Chỉ Giao Hàng</h3>
                        </div>
                        <div class="input-checkbox">
                            <input type="checkbox" id="shiping-address">
                            <label for="shiping-address">
                                <span></span>
                                Ship to a diffrent address?
                            </label>
                            <div class="caption">
                                <form action="">
                                    <div class="form-group">
                                        <input class="input" type="text" name="name" placeholder="Name">
                                    </div>
                                    <div class="form-group mt-2">
                                        <input class="input" type="email" name="email" placeholder="Email">
                                    </div>
                                    <div class="form-group mt-2">
                                        <input class="input" type="text" name="address" placeholder="Address">
                                    </div>
                                    <div class="form-group mt-2">
                                        <input class="input" type="text" name="id_number" placeholder="CCCD">
                                    </div>
                                    <div class="form-group mt-2">
                                        <input class="input" type="tel" name="tel" placeholder="Telephone">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- /Shiping Details -->

                    <!-- Order notes -->
                    <div class="order-notes">
                        <textarea class="input" placeholder="Order Notes"></textarea>
                    </div>
                    <!-- /Order notes -->
                </div>

                <!-- Order Details -->
                <div class="col-md-5 order-details">
                    <div class="section-title text-center">
                        <h3 class="title">Your Order</h3>
                    </div>
                    <div class="order-summary">
                        <div class="order-col">
                            <div><strong>PRODUCT</strong></div>
                            <div><strong>TOTAL</strong></div>
                        </div>
                        <div class="order-products">
                            <div class="order-col">
                                <div>x${pv.amount} ${p.name} size ${pv.size}</div>
                                <div>$${p.price}</div>
                            </div>
                        </div>
                        <div class="order-col">
                            <div>Shiping</div>
                            <div><strong>FREE</strong></div>
                        </div>
                        <div class="order-col">
                            <div><strong>TOTAL</strong></div>
                            <div><strong class="order-total">$${total}</strong></div>
                        </div>
                    </div>
                    <div class="payment-method">
                        <div class="input-radio">
                            <input type="radio" name="payment" id="payment-1">
                            <label for="payment-1">
                                <span></span>
                                Direct Bank Transfer
                            </label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div class="input-radio">
                            <input type="radio" name="payment" id="payment-2">
                            <label for="payment-2">
                                <span></span>
                                Cheque Payment
                            </label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div class="input-radio">
                            <input type="radio" name="payment" id="payment-3">
                            <label for="payment-3">
                                <span></span>
                                Paypal System
                            </label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                    </div>
                    <div class="input-checkbox">
                        <input type="checkbox" id="terms">
                        <label for="terms">
                            <span></span>
                            I've read and accept the <a href="#">terms - conditions</a>
                        </label>
                    </div>
                    <a href="#" class="primary-btn order-submit">Place order</a>
                </div>
                <!-- /Order Details -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->

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
