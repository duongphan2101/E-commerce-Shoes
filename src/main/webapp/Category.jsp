<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Category</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/brands.min.css">
<link rel="stylesheet" href="./css/style_style.css">
<style type="text/css">
.icon-hover:hover {
	border-color: #3b71ca !important;
	background-color: white !important;
}

.icon-hover:hover i {
	color: #3b71ca !important;
}

.li-item {
	list-style-type: none;
}
a{text-decoration: none}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<!-- Products -->
	<section>
		<div class="container my-5 ">
			<div class="row d-flex">
				<div class="col-12 col-md-3 col-lg-3 p-2">
					<div class="lst-category">
						<h5 class="cate-title p-3 border bg-primary text-white">Category</h5>

						<ul class="ul-lst m-0 p-0">
							<c:forEach items="${listC}" var="o">
								<li class="li-item p-2"><a href="CategoryID?cid=${o.cid}">${o.cname}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="filter-color my-5">
						<h5 class="cate-title p-3 border bg-primary text-white">Color</h5>

						<div class="d-flex flex-wrap">
							<div class="color-box bg-danger" data-color="red">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box bg-success" data-color="green">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box bg-primary" data-color="blue">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box bg-warning" data-color="yellow">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box bg-purple"
								style="background-color: purple;" data-color="purple">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box bg-info" data-color="cyan">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box bg-dark" data-color="black">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box bg-light" data-color="lightgray">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box" style="background-color: orange;"
								data-color="orange">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box" style="background-color: brown;"
								data-color="brown">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box" style="background-color: limegreen;"
								data-color="limegreen">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box" style="background-color: skyblue;"
								data-color="skyblue">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box" style="background-color: olive;"
								data-color="olive">
								<span class="checkmark">✓</span>
							</div>
							<div class="color-box" style="background-color: gold;"
								data-color="gold">
								<span class="checkmark">✓</span>
							</div>
						</div>
						<a class="clear-all mt-2 d-block">Clear all</a>
					</div>

					<div class="filter-price my-5">
						<h5 class="cate-title p-3 border bg-primary text-white">Price</h5>
						<ul class="ul-lst m-0 p-0">
							<li class="li-item-price p-2"><input type="checkbox"
								name="check-price" value="1" class="form-control-check"
								onchange="getPrice();" /> Dưới 1 Triệu</li>
							<li class="li-item-price p-2"><input type="checkbox"
								name="check-price" value="2" class="form-control-check"
								onchange="getPrice();" /> Từ 1 Triệu - 2 Triệu</li>
							<li class="li-item-price p-2"><input type="checkbox"
								name="check-price" value="3" class="form-control-check"
								onchange="getPrice();" /> Từ 2 Triệu - 3 Triệu</li>
							<li class="li-item-price p-2"><input type="checkbox"
								name="check-price" value="4" class="form-control-check"
								onchange="getPrice();" /> Trên 3 Triệu</li>
						</ul>

					</div>

				</div>
				<div class="right-con p-5 col-12 col-md-9 col-lg-9">
					<header class="mb-4">
						<h3>All products</h3>
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
											<!-- <a href="#!" class="btn btn-primary shadow-0 me-1">Buy</a>  -->
											<a href="#!" class="btn btn-light border px-2 pt-2 icon-hover"><i
												class="fas fa-heart fa-lg text-secondary px-1"></i></a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Products -->

	<jsp:include page="Footer.jsp"></jsp:include>

	<!--  <script>
    // JavaScript để xử lý chọn màu
    document.querySelectorAll('.color-box').forEach(box => {
        box.addEventListener('click', function() {
            this.classList.toggle('selected');
            if (this.classList.contains('selected')) {
                console.log('Màu được chọn: ' + this.getAttribute('data-color'));
            } else {
                console.log('Màu bị bỏ chọn: ' + this.getAttribute('data-color'));
            }

        });
    });

    // Xóa tất cả các lựa chọn
    document.querySelector('.clear-all').addEventListener('click', function() {
        document.querySelectorAll('.color-box').forEach(box => {
            box.classList.remove('selected');
        });
    });

    function getPrice() {

        const checkboxes = document.querySelectorAll('input[name="check-price"]');
        const checkedValues = Array.from(checkboxes)
                                    .filter(checkbox => checkbox.checked)
                                    .map(checkbox => checkbox.value);

        console.log('Checked values:', checkedValues);
        
    }
    
</script>  -->
</body>
</html>