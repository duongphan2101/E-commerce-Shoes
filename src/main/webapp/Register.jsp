<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/brands.min.css">

</head>

<body style="background-color: black;">
    <div class="background">
        <video id="video-background" autoplay muted loop style="width: 100%;height: 100%; z-index: -2; position: absolute; top: 0; left: 0; right: 0; bottom: 0;">
            <source src="https://brand.assets.adidas.com/video/upload/f_auto:video,q_auto/if_w_gt_1920,w_1920/fw24_sl_72_launch_hp_mh_d_06c0f94f89.mp4" type="">
        </video>
        <div class="container-fluid p-3 border" style="margin-left: 60%; width: 30%; margin-top: 5%; border-radius: 20px; position: relative;">
            <div class="blur-background bg-white" style="width: 100%; height: 100%; position: absolute; z-index: -1; top: 0; left: 0; border-radius: 20px; opacity: .7;">

            </div>
            <!-- Pills navs -->
            <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                <li class="nav-item " role="presentation">
                    <a class="nav-link" id="tab-register" data-mdb-pill-init href="Login.jsp" role="tab"
                        aria-controls="pills-register" aria-selected="false">Login</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="tab-login" data-mdb-pill-init href="#pills-login" role="tab"
                        aria-controls="pills-login" aria-selected="true">Register</a>
                </li>    
            </ul>
            <!-- Pills navs -->
    
            <!-- Pills content -->
            <div class="tab-content">
                <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
					<form id="registerForm" action="Register" method="post">
                        <div class="text-center mb-3">
                            <p>Sign In with:</p>
                            <!-- Social buttons -->
                            <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-facebook-f"></i>
                            </button>
                            <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-google"></i>
                            </button>
                            <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-twitter"></i>
                            </button>
                            <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-github"></i>
                            </button>
                        </div>
                    
                        <p class="text-center">or:</p>
                        <!-- Error message -->
                        <p class="text-center"> 
                            <span id="error-message" class="text-danger"></span>
                        </p>
                    
                        <!-- Name and Username input -->
                        <div data-mdb-input-init class="form-outline mb-4 row">
                            <div class="col-sm-8">
                                <label class="form-label" for="loginName">Name</label>
                                <input name="name" type="text" id="name" class="form-control" />
                            </div>
                            <div class="col-sm-4">
                                <label class="form-label" for="loginUser">Username</label>
                                <input name="user" type="text" id="user" class="form-control" />
                            </div>
                        </div>
                    
                        <!-- Password and Confirm Password input -->
                        <div data-mdb-input-init class="form-outline mb-4 row">
                            <div class="col-sm-6">
                                <label class="form-label" for="loginPassword">Password</label>
                                <input name="pass" type="password" id="pass" class="form-control" />
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label" for="confirmPassword">Confirm Password</label>
                                <input name="repass" type="password" id="repass" class="form-control" />
                            </div>
                        </div>
                    
                        <!-- Phone number and ID number input -->
                        <div data-mdb-input-init class="form-outline mb-4 row">
                            <div class="col-sm-5">
                                <label class="form-label" for="phone">Phone number</label>
                                <input name="phone" type="tel" id="phone" class="form-control" />
                            </div>
                            <div class="col-sm-7">
                                <label class="form-label" for="cccd">Id number</label>
                                <input name="cccd" type="text" id="cccd" class="form-control" />
                            </div>
                        </div>
                    
                        <!-- Email and Address input -->
                        <div data-mdb-input-init class="form-outline mb-4 row">
                            <div class="col-sm-12">
                                <label class="form-label" for="address">Address</label>
                                <input name="address" type="text" id="address" class="form-control" />
                            </div>
                        </div>
                    
                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block mb-4 form-control">Register</button>
                    
                        <!-- Login link -->
                        <div class="text-center mt-3">
                            <p>Already have an account? <a href="login.html">Login here</a></p>
                        </div>
                    </form>
                </div>
            <!-- Pills content -->
        </div>
    </div>
    
</body>
<script>
    document.getElementById("registerForm").addEventListener("submit", function(event) {
        // Lấy giá trị từ các trường
        var name = document.getElementById("name").value;
        var username = document.getElementById("user").value;
        var password = document.getElementById("pass").value;
        var confirmPassword = document.getElementById("repass").value;
        var phone = document.getElementById("phone").value;
        var idNumber = document.getElementById("cccd").value;
        var email = document.getElementById("email").value;
        var address = document.getElementById("address").value;

        // Thẻ để hiển thị lỗi
        var errorMessage = document.getElementById("error-message");
        errorMessage.innerText = ""; // Xóa lỗi trước đó

        // Biểu thức regex
        var nameRegex = /^[A-Za-z\s]+$/;
        var usernameRegex = /^[A-Za-z0-9]+$/;
        var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        var phoneRegex = /^[0-9]{10}$/;
        var idNumberRegex = /^[0-9]{9,12}$/;
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var addressRegex = /.+/;

        // Kiểm tra các trường hợp rỗng
        if (!name || !username || !password || !confirmPassword || !phone || !idNumber || !email || !address) {
            errorMessage.innerText = "Không được để trống trường nào.";
            event.preventDefault(); // Ngăn form submit
            return;
        }

        // Kiểm tra theo từng loại
        if (!nameRegex.test(name)) {
            errorMessage.innerText = "Tên chỉ được chứa chữ cái và khoảng trắng.";
            event.preventDefault();
            return;
        }

        if (!usernameRegex.test(username)) {
            errorMessage.innerText = "Username chỉ được chứa chữ cái và số.";
            event.preventDefault();
            return;
        }

        if (!passwordRegex.test(password)) {
            errorMessage.innerText = "Mật khẩu phải ít nhất 8 ký tự, bao gồm cả chữ cái và số.";
            event.preventDefault();
            return;
        }

        if (password !== confirmPassword) {
            errorMessage.innerText = "Mật khẩu xác nhận không khớp.";
            event.preventDefault();
            return;
        }

        if (!phoneRegex.test(phone)) {
            errorMessage.innerText = "Số điện thoại phải là 10 chữ số.";
            event.preventDefault();
            return;
        }

        if (!idNumberRegex.test(idNumber)) {
            errorMessage.innerText = "Số CCCD phải từ 9 đến 12 chữ số.";
            event.preventDefault();
            return;
        }

        if (!emailRegex.test(email)) {
            errorMessage.innerText = "Email không hợp lệ.";
            event.preventDefault();
            return;
        }

        if (!addressRegex.test(address)) {
            errorMessage.innerText = "Địa chỉ không được để trống.";
            event.preventDefault();
            return;
        }
    });
</script>
</html>