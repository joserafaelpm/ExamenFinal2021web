<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.*"%>

<%
HttpSession misession = (HttpSession) request.getSession();
Usuario user = (Usuario) misession.getAttribute("usuario");
if (user == null) {
	response.sendRedirect("../");
}
%>

<!DOCTYPE html>
<html>
<head>
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
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Lista de Base de datos tipos</title>
</head>
<body>
	<jsp:useBean class="dao.TypedbDAO" id="tDAO"></jsp:useBean>
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
			<h1>
				<b>Bases de datos</b>
			</h1>
			<a class="nav-item nav-link" href="tipoRegistro.jsp">Registro de
				BD</a>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Aditional</th>
						<th scope="col">description</th>
						<th scope="col">driver</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tDAO.list()}" var="t">
						<tr>
							<th scope="row"><c:out value="${t.id}" /></th>
							<td><c:out value="${t.aditional}" /></td>
							<td><c:out value="${t.description}" /></td>
							<td><c:out value="${t.driver}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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