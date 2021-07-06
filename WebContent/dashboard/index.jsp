<%@page import="model.*"%>
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
							<a class="nav-item nav-link" href="reporteRegistro.jsp">Registrar
								Reporte</a>


						</div>
					</div>
				</nav>
				<span class="login100-form-title p-t-10 p-b-30"><%=user.getRol().getDescription()%>
					<%=user.getEmail()%> <a href="../user/salir">Salir</a> </span>

				<div class="row">
					<div class="col-sm-6">
						<div class="card">
							<div class="card-header">Cantidad de tokens de conexion</div>
							<div class="card-body"><%=(user.getConnectiontokens().size() > 0) ? user.getConnectiontokens().size() : "0"%></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card">
							<div class="card-header">Cantidad de reportes registrados</div>
							<%
							int cantidad = 0;
							for (Connectiontoken c : user.getConnectiontokens()) {
								cantidad += c.getReportes().size();
							}
							%>
							<div class="card-body"><%=cantidad%></div>
						</div>
					</div>
				</div>
				<div class="row p-t-30">
					<div class="col-sm-12">
						<div class="table-responsive card-body bg-white">
							<h1 class="text-center p-b-30">Seguimientos</h1>
							<table id="tableTokens" class="display">
								<thead>
									<tr>
										<th>id</th>
										<th>Reporte</th>
										<th>fechaGeneracion</th>
										<th>Estado</th>
										<th>Resultado</th>
										<th>DetailRequest</th>
										<th>Tipo</th>
										<th>FileGenerate</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (Connectiontoken c : user.getConnectiontokens()) {
										for (Reporte r : c.getReportes()) {
											for (Seguimiento seg : r.getSeguimientos()) {
									%>
									<tr>
										<td><%=seg.getId()%></td>
										<td><%=seg.getReporte().getDescription()%></td>
										<td><%=seg.getDategenerate()%></td>
										<td><%=seg.getState()%></td>
										<td><%=seg.getResult()%></td>
										<td><%=seg.getDetailrequest()%></td>
										<td><%=seg.getType()%></td>
										<td><%=seg.getFilegenerate()%></td>
									</tr>
									<%
									}
									}
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