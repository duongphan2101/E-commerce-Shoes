<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        <div class="container-fluid p-5 border" style="margin-left: 60%; width: 30%; margin-top: 5%; border-radius: 20px; position: relative;">
            <div class="blur-background bg-white" style="width: 100%; height: 100%; position: absolute; z-index: -1; top: 0; left: 0; border-radius: 20px; opacity: .7;">

            </div>
            <!-- Pills navs -->
            <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="tab-login" data-mdb-pill-init href="#pills-login" role="tab"
                        aria-controls="pills-login" aria-selected="true">Login</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab-register" data-mdb-pill-init href="Register.jsp" role="tab"
                        aria-controls="pills-register" aria-selected="false">Register</a>
                </li>
            </ul>
            <!-- Pills navs -->
    
            <!-- Pills content -->
            <div class="tab-content">
                <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                    <form action="Login" method="post">
                        <div class="text-center mb-3">
                            <p>Sign in with:</p>
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-facebook-f"></i>
                            </button>
    
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-google"></i>
                            </button>
    
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-twitter"></i>
                            </button>
    
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-github"></i>
                            </button>
                        </div>
    
                        <p class="text-center">or:</p>
    
    					<p class="text-danger" align="center">
						  <strong>${mess}</strong>
						</p>
    
                        <!-- Email input -->
                        <div data-mdb-input-init class="form-outline mb-4">
                        	<label class="form-label" for="loginName">username</label>
                            <input name="user" type="text" id="loginName" class="form-control" />
                            
                        </div>
    
                        <!-- Password input -->
                        <div data-mdb-input-init class="form-outline mb-4">
                        	<label class="form-label" for="loginPassword">Password</label>
                            <input name="pass" type="password" id="loginPassword" class="form-control" />
                            
                        </div>
    
                        <!-- 2 column grid layout -->
                        <div class="row mb-4">
                            <div class="col-md-6 d-flex justify-content-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-3 mb-md-0">
                                    <input class="form-check-input" type="checkbox" value="" id="loginCheck" checked />
                                    <label class="form-check-label" for="loginCheck"> Remember me </label>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex justify-content-center">
                                <!-- Simple link -->
                                <a href="#!">Forgot password?</a>
                            </div>
                        </div>
    
                        <!-- Submit button -->
                        <button type="submit" data-mdb-button-init data-mdb-ripple-init
                            class="btn btn-primary btn-block mb-4 form-control">Sign in</button>
    
                        <!-- Register buttons -->
                        <div class="text-center">
                            <p>Not a member? <a href="Register.jsp">Register</a></p>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
                    <form>
                        <div class="text-center mb-3">
                            <p>Sign up with:</p>
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-facebook-f"></i>
                            </button>
    
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-google"></i>
                            </button>
    
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-twitter"></i>
                            </button>
    
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-link btn-floating mx-1">
                                <i class="fab fa-github"></i>
                            </button>
                        </div>
    
                        <p class="text-center">or:</p>
    
                        <!-- Name input -->
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input type="text" id="registerName" class="form-control" />
                            <label class="form-label" for="registerName">Name</label>
                        </div>
    
                        <!-- Username input -->
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input type="text" id="registerUsername" class="form-control" />
                            <label class="form-label" for="registerUsername">Username</label>
                        </div>
    
                        <!-- Email input -->
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input type="email" id="registerEmail" class="form-control" />
                            <label class="form-label" for="registerEmail">Email</label>
                        </div>
    
                        <!-- Password input -->
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input type="password" id="registerPassword" class="form-control" />
                            <label class="form-label" for="registerPassword">Password</label>
                        </div>
    
                        <!-- Repeat Password input -->
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input type="password" id="registerRepeatPassword" class="form-control" />
                            <label class="form-label" for="registerRepeatPassword">Repeat password</label>
                        </div>
    
                        <!-- Checkbox -->
                        <div class="form-check d-flex justify-content-center mb-4">
                            <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck" checked
                                aria-describedby="registerCheckHelpText" />
                            <label class="form-check-label" for="registerCheck">
                                I have read and agree to the terms
                            </label>
                        </div>
    
                        <!-- Submit button -->
                        <button type="submit" data-mdb-button-init data-mdb-ripple-init
                            class="btn btn-primary btn-block mb-3">Sign in</button>
                    </form>
                </div>
            </div>
            <!-- Pills content -->
        </div>
    </div>
    
</body>

</html>