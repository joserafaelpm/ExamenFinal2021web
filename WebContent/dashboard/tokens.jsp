<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
HttpSession misession = (HttpSession) request.getSession();
Usuario user = (Usuario) misession.getAttribute("usuario");
if (user == null) {
	response.sendRedirect("../");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Dashboard Administrativo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../assets/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../assets/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../assets/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../assets/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../assets/css/util.css">
<link rel="stylesheet" type="text/css" href="../assets/css/main.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-general"
			style="background-image: url('../assets/images/img-01.jpg');">
			<div class="sizefull">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand" href="index.jsp">Habilitacion</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNavAltMarkup"
						aria-controls="navbarNavAltMarkup" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
						<div class="navbar-nav">
							<a class="nav-item nav-link active" href="index.jsp">Inicio <span
								class="sr-only">(current)</span></a>
							<%
							if (user.getRol().getId() == 1) {
							%>
							<a class="nav-item nav-link" href="tipoList.jsp">Tipos de BD</a>
							<%
							}
							%>
							<a class="nav-item nav-link" href="tokens.jsp">Tokens de
								conexion</a>


						</div>
					</div>
				</nav>
				<span class="login100-form-title p-t-10 p-b-30"><%=user.getRol().getDescription()%>
					<%=user.getEmail()%> <a href="../user/salir">Salir</a> </span>

				<div class="row">
					<div class="col-sm-6">
						<div class="card">
							<div class="card-header">Nuevo Token</div>
							<div class="card-body">
								<form action="../token/registrar" method="post">
									<div class="input-group mb-3">
										<span class="input-group-text">Hostname:</span> <input
											type="text" name="host" class="form-control">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text">Userbd:</span> <input
											type="text" name="userdb" class="form-control">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text">Puerto</span> <input
											type="number" name="port" class="form-control">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text">Tipo de conexion</span> <select
											class="form-control" name="typedb"
											aria-label="Default select example">
											<%
											TypedbDAO tpdao = new TypedbDAO();
											List<Typedb> tipos = tpdao.list();
											for (Typedb tp : tipos) {
											%>
											<option value="<%=tp.getId()%>"><%=tp.getDescription()%></option>
											<%
											}
											%>
										</select>
									</div>
							</div>
							<div class="col-sm-6">
								<div class="input-group mb-3">
									<span class="input-group-text">Password:</span> <input
										type="password" name="pass" class="form-control">
								</div>
							</div>
						</div>
						<button type="submit" class="w-100 btn btn-success">Enviar</button>
						</form>
					</div>
					<div class="col-sm-6">
						<div class="card">
							<div class="card-header">Lista de tokens</div>
							<div class="card-body">

								<div class="table-responsive">
									<table id="tableTokens" class="display">
										<thead>
											<tr>
												<th>id</th>
												<th>Host</th>
												<th>userDb</th>
												<th>Pass</th>
												<th>Db</th>
												<th>Token</th>
												<th>Port</th>
												<th>Tipo</th>
												<th>Estado</th>
												<th>Acciones</th>
											</tr>
										</thead>
										<tbody>

											<%
											for (Connectiontoken ctk : user.getConnectiontokens()) {
											%>
											<tr>
												<td style="width: 10px;"><%=ctk.getId()%></td>
												<td style="width: 15%;"><%=ctk.getHost()%></td>
												<td><%=ctk.getUserdb()%></td>
												<td><%=ctk.getPass()%></td>
												<td><%=ctk.getDb()%></td>
												<td><%=ctk.getToken()%></td>
												<td><%=ctk.getPort()%></td>
												<td><%=ctk.getTypedb().getDescription()%></td>
												<%
												String estado = ctk.getState() + "";
												if (estado.equals("0")) {
													estado = "Creado sin validar";
												} else if (estado.equals("1")) {
													estado = "Conexion Validada";
												} else if (estado.equals("2")) {
													estado = "Sin Conexion";
												}
												%>
												<td><%=estado%></td>
												<td><a href="#"><i class="fa fa-edit"></i></a></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


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
	<script
		src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<script src="../assets/js/main.js"></script>

</body>
</html>