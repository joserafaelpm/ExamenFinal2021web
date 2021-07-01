<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Lista de Reportes</title>
</head>
<body>
<jsp:useBean class="dao.ReporteDAO" id = "reporteDAO" ></jsp:useBean>
<h1><b>Reportes</b></h1>
  	<table class="table">
  <thead>
    <tr>
    <th scope="col">Id</th>
     <th scope="col">Conexion</th>
      <th scope="col">Datecreate</th>
      <th scope="col">Description</th>
      <th scope="col">file</th>
      <th scope="col">name</th>
      <th scope="col">state</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${reporteDAO.list()}" var = "report" >
    <tr>
      <th scope="row"> <c:out value="${report.id}" /></th>
      <td><c:out value="${report.connectiontoken.host}" /></td>
      <td><c:out value="${report.datecreate}" /></td>
      <td><c:out value="${report.description}" /></td>
      <td><c:out value="${report.file}" /></td>
      <td><c:out value="${report.name}" /></td>
      <td><c:out value="${report.state}" /></td>
      <td><a href="ReporteServlet?action=mostrar&id=${report.id}">Editar</a></td>
    </tr>
 </c:forEach>
  </tbody>
</table>
</body>
</html>