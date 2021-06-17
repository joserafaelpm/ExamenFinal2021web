<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<title>Conexion Token</title>
</head>
<body>
<jsp:useBean class="dao.ConnectiontokenDAO" id="connectiontokenDAO"></jsp:useBean>
<jsp:useBean class="dao.TypedbDAO" id="typedbDAO"></jsp:useBean>
<c:if test="${connectiontoken != null}">
                           <%--  <form action="${pageContext.request.contextPath}/ActualizarEmpleado?accion=edita&codigo=${empleado.codigo}"  method="post"> --%>
                           <form action="ConnectiontokenServlet?action=actualizar&id=${connectiontoken.id}"  method="POST">
                        </c:if>
                        <c:if test="${connectiontoken == null}">
                           <%--  <form action="${pageContext.request.contextPath}/AgregarEmpleado?accion=agregar&codigo=${empleado.codigo}"  method="POST"> --%>
                            <form action="ConnectiontokenServlet?action=registrar"  method="POST">
                        </c:if>
    <div class="container">
        <div class="card m-5">
            <div class="card-header bg-red">
                Conexion Token
            </div>
            <div class="card-body">
                <form>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="input-group mb-3">
                            <span class="input-group-text">Hostname:</span>
                            <input type="text" name="hostname" value="${connectiontoken.hostname}"  class="form-control" aria-label="Amount (to the nearest dollar)">
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">Userbd:</span>
                            <input type="text" name="userdb" value="${connectiontoken.userdb}" class="form-control" aria-label="Amount (to the nearest dollar)">
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">Puerto</span>
                            <input type="number" name="puerto" value="${connectiontoken.port}" class="form-control" aria-label="Amount (to the nearest dollar)">
                          </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="input-group mb-3">
                            <span class="input-group-text">Password:</span>
                            <input type="password" name="password" value="${connectiontoken.pass}" class="form-control" aria-label="Amount (to the nearest dollar)">
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">Token:</span>
                            <input type="text" name="token" value="${connectiontoken.token}" class="form-control" aria-label="Amount (to the nearest dollar)">
                          </div>
                          <div class="input-group mb-3">
                            <select class="form-select" aria-label="Default select example" name="type">
								<option selected value="${connectiontoken.typedb.getId()} ">Tipo:</option>
								<c:forEach items="${typedbDAO.list()}" var="typedb">
									<option value="${typedb.id} ">
										<c:out value="${typedb.descripcion} " />
									</option>
								</c:forEach>
							</select>
                          </div>
                    </div>
                </div>
                <button  type="submit" class="btn btn-success w-100">Registrar</button>
            </form>
            </div>
        </div>
        
    </div>

  </body>
</html>