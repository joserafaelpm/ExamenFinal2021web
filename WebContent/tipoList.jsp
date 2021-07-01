<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Lista de Base de datos tipos</title>
</head>
<body>
<jsp:useBean class="dao.TypedbDAO" id = "tDAO" ></jsp:useBean>
<h1><b>Bases de datos</b></h1>
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
  <c:forEach items="${tDAO.list()}" var = "t" >
    <tr>
      <th scope="row"> <c:out value="${t.id}" /></th>
      <td><c:out value="${t.aditional}" /></td>
      <td><c:out value="${t.description}" /></td>
      <td><c:out value="${t.driver}" /></td>
      <td><a href="TipobdServlet?action=mostrar&id=${t.id}">Editar</a></td>
    </tr>
 </c:forEach>
  </tbody>
</table>
</body>
</html>