<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="ISO-8859-1">
<title>Buscar Reporte</title>
</head>
<body>
	<h1> <b>Buscar Reporte</b> </h1>
<div class="form-group row">
  <form action="ReporteServlet?action=buscar" method="post">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Id:</label>
    <div class="col-sm-10">
      <input type="text" name="id" class="form-control" id="inputEmail3">
    </div>
  </div>
  
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">Buscar</button>
      </form>
    </div>

</body>
</html>