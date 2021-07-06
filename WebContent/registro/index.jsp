<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Registro de usuario</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../assets/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../assets/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../assets/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-general" style="background-image: url('../assets/images/img-01.jpg');">
			<div class="wrap-register ">
				<form class="login100-form validate-form" action="../user/registrar" method="POST">
					<div class="login100-form-avatar">
						<img src="../assets/images/logoufps.png" alt="AVATAR">
					</div>

					<span class="login100-form-title p-t-20 p-b-45">
						Sistema de Información para la Gestión de Reportes JasperReports
					</span>

                    <div class="sizefull">
                        <div class="row">
                            <div class="col-sm-6">
                        
                                <div class="wrap-input100 validate-input m-b-10" data-validate = "Nombre de usuario requerido">
                                    <input class="input100" type="text" name="user" placeholder="Usuario">
                                    <span class="focus-input100"></span>
                                    <span class="symbol-input100">
                                        <i class="fa fa-user"></i>
                                    </span>
                                </div>
    
                            </div>
                            <div class="col-sm-6">
                                <div class="wrap-input100 validate-input m-b-10" data-validate = "Contraseña es requerida">
                                    <input class="input100" type="password" name="pass" placeholder="Contraseña">
                                    <span class="focus-input100"></span>
                                    <span class="symbol-input100">
                                        <i class="fa fa-lock"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="wrap-input100 validate-input m-b-10" data-validate = "Correo electronico es requerido">
                                <input class="input100" type="email" name="email" placeholder="Correo electronico">
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class="fa fa-envelope"></i>
                                </span>
                            </div>
                            <div class="container-login100-form-btn p-t-10">
                                <button class="login100-form-btn">
                                    Crear usuario
                                </button>
                            </div>
                        </div>
                    </div>

				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="../assets/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/vendor/bootstrap/js/popper.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/js/main.js"></script>

</body>
</html>