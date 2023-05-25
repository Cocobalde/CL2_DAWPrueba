<!-- incluir página menu.jsp -->
<jsp:include page="menu.jsp"/>
<!-- trabajar con la libreria core de jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/dataTables.bootstrap5.min.css" rel="stylesheet">

<title>Requerimiento</title>
<style>
	.modal-header{
		color:#fff;
		background: #428bca;
		display: flex;
  		justify-content: center;
  		
	}
	.modal-card{
		color:#fff;
		background: #428bca;
	}
	.help-block {
	  		color: red;
	}
	.form-group.has-error .form-control-label {
	  color: red;
	}
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}
</style>
</head>
<body>
	<div class="container">
	
		<c:if test="${param.MENSAJE!=null}">	
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
			  <strong>Sistema : </strong> ${param.MENSAJE}
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
	
	
	  <h2 class="text-center mt-3">LISTADO DE REQUERIMIENTOS</h2>
	  <div class="card">
		  <div class="card-header modal-card">
			   <button type="button" class="btn btn-success mt-3" data-bs-toggle="modal" 
			   				data-bs-target="#modalRequerimiento">
			  	Nuevo Requerimiento
			  </button>
	  	  </div>
		  
		  <div class="card-body">
		    	  <div class="mt-5">
					  <table id="tableDocente" class="table table-striped" style="width:100%">
				        <thead>
				            <tr>
				                <th>CÓDIGO</th>
				                <th>NÚMERO</th>
				                <th>NOMBRE</th>
				                <th>FECHA</th>
				                <th>ESTADO</th>
				                <th></th>
				                <th></th>
				            </tr>
				        </thead>
				        <tbody>
					       
				        </tbody>
				    </table>
			  	</div>
		  </div>
		</div>
	  
	  
	  
	  
	  <!-- Modal -->
		<div class="modal fade" id="modalRequerimiento" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-xl">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Nuevo Requerimiento</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        	<form class="row g-3">
					  <div class="col-md-4">
					    <label for="inputEmail4" class="form-label">Número</label>
					    <input type="email" class="form-control" id="inputEmail4">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Nombre Requerimiento</label>
					    <input type="password" class="form-control" id="inputPassword4">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Fecha Requerimiento</label>
					    <input type="password" class="form-control" id="inputPassword4">
					  </div>
					  <div class="col-md-4">
					    <label for="inputEmail4" class="form-label">Remitente</label>
					    <input type="email" class="form-control" id="inputEmail4">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Cargo</label>
					    <input type="password" class="form-control" id="inputPassword4">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Estado</label>
					    <input type="password" class="form-control" id="inputPassword4">
					  </div>
					  <div class="col-md-6">
					    <label for="inputCity" class="form-label">Cantidad a solicitar</label>
					    <input type="text" class="form-control" id="inputCity">
					  </div>
					  <div class="col-md-6">
					    <label for="inputState" class="form-label">Detalle</label>
						    <table id="tableDetalle" class="table table-striped" style="width:100%">
					        <thead>
					            <tr>
					                <th>CÓDIGO</th>
					                <th>DESCRIPCIÓN</th>
					                <th>CANTIDAD</th>
					                <th></th>
					            </tr>
					        </thead>
					        <tbody>
						       
					        </tbody>
					    </table>
					  </div>
					  <div class="col-md-6">
					    <label for="inputState" class="form-label">Listado de Bienes</label>
						    <table id="tableBienes" class="table table-striped" style="width:100%">
					        <thead>
					            <tr>
					                <th>CÓDIGO</th>
					                <th>DESCRIPCIÓN</th>
					                <th></th>
					            </tr>
					        </thead>
					        <tbody>
						       
					        </tbody>
					    </table>
					  </div>
					  <div class="modal-footer">
					  	<button type="submit" class="btn btn-primary">Grabar</button>
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
				      </div>
					</form>
		      </div>
		    </div>
		  </div>
		</div>
	  <!-- FIN MODAL -->
	 
	  
	</div>
<script src="js/jquery-3.5.1.js"></script>
	
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- JS para la tabla -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

<!-- JS para la validación-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

	
</body>
</html>

















