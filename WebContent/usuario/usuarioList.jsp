<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Lista de Usuarios</title>
</head>
<body>
<jsp:useBean class="dao.UsuarioDAO" id = "userDAO" ></jsp:useBean>
<jsp:useBean class="dao.RolDAO" id = "RolDAO" ></jsp:useBean>
<h1><b>Usuarios</b></h1>
  	<table class="table">
  <thead>
    <tr>
    <th scope="col">Id</th>
      <th scope="col">Usuario</th>
      <th scope="col">email</th>
      <th scope="col">pass</th>
      <th scope="col">role</th>
      <th scope="col">state</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${userDAO.list()}" var = "user" >
    <tr>
      <th scope="row"> <c:out value="${user.id}" /></th>
      <td><c:out value="${user.usuario}" /></td>
      <td><c:out value="${user.email}" /></td>
      <td><c:out value="${user.pass}" /></td>
      <td><c:out value="${user.rol.getId()}" /></td>
      <td><c:out value="${user.state}" /></td>
      
    </tr>
 </c:forEach>
  </tbody>
</table>
</body>
</html>