<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Lista de Tokens</title>
</head>
<body>
	<jsp:useBean class="dao.ConnectiontokenDAO" id="tokenDAO"></jsp:useBean>
	<h1>
		<b>Token</b>
	</h1>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Host</th>
				<th scope="col">Userdb</th>
				<th scope="col">pass</th>
				<th scope="col">Db</th>
				<th scope="col">token</th>
				<th scope="col">port</th>
				<th scope="col">user</th>
				<th scope="col">state</th>
				<th scope="col">type</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${tokenDAO.list()}" var="token">
				<tr>
					<th scope="row"><c:out value="${token.id}" /></th>
					<td><c:out value="${token.host}" /></td>
					<td><c:out value="${token.userdb}" /></td>
					<td><c:out value="${token.pass}" /></td>
					<td><c:out value="${token.db}" /></td>
					<td><c:out value="${token.token}" /></td>
					<td><c:out value="${token.port}" /></td>
					<td><c:out value="${token.user}" /></td>
					<td><c:out value="${token.state}" /></td>
					<td><c:out value="${token.type}" /></td>
					<td><a
						href="ConecctiontokenServlet?action=eliminar&id=${token.id}">Eliminar</a></td>
					<td><a
						href="ConecctiontokenServlet?action=mostrar&id=${token.id}">Editar</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>