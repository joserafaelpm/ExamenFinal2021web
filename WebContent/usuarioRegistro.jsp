<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Formulario de Registro de Usuario</title>
</head>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

<title>Registro de usuarios</title>
</head>
<body>
	<jsp:useBean class="dao.RolDAO" id="rolDAO"></jsp:useBean>
	<jsp:useBean class="dao.UsuarioDAO" id="usuarioDAO"></jsp:useBean>
	<div class="container">

		<c:if test="${usuario == null}">
			<form action="UsuarioServlet?action=registrar" method="POST">
		</c:if>
		<div class="card m-5">
			<div class="card-header bg-red">Registro de usuarios</div>
			<div class="card-body">
				<form>
					<div class="row">
						<div class="col-sm-6">
							<div class="input-group mb-3">
								<span class="input-group-text">Usuario:</span> <input
									type="text" name="usuario" value="${usuario.usuario}"
									class="form-control"
									aria-label="Amount (to the nearest dollar)">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">Password:</span> <input
									type="password" name="pass" value="${usuario.pass}"
									class="form-control"
									aria-label="Amount (to the nearest dollar)">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="input-group mb-3">
								<span class="input-group-text">Email:</span> <input type="email"
									name="email" value="${usuario.email}" class="form-control"
									aria-label="Amount (to the nearest dollar)">
							</div>

							<fieldset class="form-group">
								<label>genero</label> <select class="form-control"
									id="exampleFormControlSelect1" name="genero">
									<option selected value="${heroe.generoBean.getId()} ">
										<c:out value="${heroe.generoBean.getDescripcion()} " />
									</option>
									<c:forEach items="${generoDAO.list()}" var="genero">
										<option value="${genero.id} ">
											<c:out value="${genero.descripcion} " />
										</option>
									</c:forEach>
								</select>
							</fieldset>


							<div class="input-group mb-3">
								<span class="input-group-text">State:</span> <input
									type="number" name="state" value="${usuario.state}"
									class="form-control"
									aria-label="Amount (to the nearest dollar)">
							</div>

						</div>
					</div>
					<button class="btn btn-success w-100">Registrar usuario</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>