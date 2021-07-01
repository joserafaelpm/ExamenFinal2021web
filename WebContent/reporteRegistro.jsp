<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"
	rel="stylesheet">
<title>Registrar Reporte</title>
</head>
<body>
	<jsp:useBean class="dao.ReporteDAO" id="rDAO"></jsp:useBean>
	<jsp:useBean class="dao.ConnectiontokenDAO" id="cDAO"></jsp:useBean>
	<c:if test="${reporte != null}">
		<%--  <form action="${pageContext.request.contextPath}/ActualizarEmpleado?accion=edita&codigo=${empleado.codigo}"  method="post"> --%>
		<form action="ReporteServlet?action=actualizar&id=${reporte.id}"
			method="POST">
	</c:if>
	<c:if test="${reporte == null}">
		<%--  <form action="${pageContext.request.contextPath}/AgregarEmpleado?accion=agregar&codigo=${empleado.codigo}"  method="POST"> --%>
		<form action="ReporteServlet?action=registrar" method="POST">
	</c:if>
	<div class="container">
		<div class="card m-5">
			<div class="card-header bg-red">Registrar Reporte</div>
			<div class="card-body">
				<form>
					<div class="row m-5">
						<div class="input-group mb-3">
							<span class="input-group-text">Seleccione la conexion</span> <select
								class="form-select" aria-label="Default select example" id="exampleFormControlSelect1"
								name="tokenid">
								<option selected value="${reporte.connectiontoken.getId()}"></option>
								<c:forEach items="${cDAO.list()}" var="c">
									<option value="${c.id}">
										<c:out value="${c.host}"/>
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-6">
							<div class="input-group mb-3">
								<span class="input-group-text">Fecha de creacion</span> 
								<input name="datecreate" type="date" id="datecreate"
									class="form-control">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">File Archivo: </span> <input name="file"
									type="text" class="form-control">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">Nombre</span> <input type="text" name="name"
									class="form-control">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="input-group mb-3">
								<span class="input-group-text">Estado</span> <select name="state"
									class="form-select" aria-label="Default select example">
									<option selected></option>
									<option value="Creado sin validar">Creado sin validar</option>
									<option value="conexión validada">conexión validada</option>
									<option value="sin conexión">sin conexión</option>
								</select>
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">Descripcion</span> <input name="description"
									type="text" class="form-control" id="inputEmail3">
							</div>
						</div>
					</div>
					<button type="submit" class=" btn btn-success w-100">Registrar</button>
				</form>
			</div>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>
</body>
</html>