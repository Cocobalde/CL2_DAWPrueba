<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mantenimiento Docente</title>
 	<!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="css/dataTables.bootstrap5.min.css" rel="stylesheet">  
	<link href="datepicker/bootstrap-datepicker.css" rel="stylesheet">
	
	<style>
		.modal-header{
		color:#fff;
		background: #428bca;
		display: flex;
  		justify-content: center;  		
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
	
		<c:if test="${requestScope.MENSAJE!=null}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
			  <strong>SISTEMA</strong> ${requestScope.MENSAJE}
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
		
		<h3 class="text-center">LISTADO DE DOCENTES</h3>	  
	  	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDocente">
	  		Nuevo Docente
	  	</button>
	  	
	  	<!-- Modal PARA REGISTRAR-->
		<div class="modal fade" id="modalDocente" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">DOCENTE</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form id="formDocente" action="ServletDocente?accion=GRABAR" method="post">
				  <div class="form-group">
				    <label for="exampleNombre" class="form-label">Código</label>
				    <input type="text" class="form-control" name="codigo" readonly value="0" id="id-codigo">
				  </div>
				  <div class="form-group">
				    <label for="exampleNombre" class="form-label">Nombre</label>
				    <input type="text" class="form-control" name="nombre" id="id-nombre">
				  </div>
				  <div class="form-group">
				    <label for="examplePaterno" class="form-label">Paterno</label>
				    <input type="text" class="form-control" name="paterno" id="id-paterno">
				  </div>
				 <div class="form-group">
				    <label for="exampleMaterno" class="form-label">Materno</label>
				    <input type="text" class="form-control" name="materno" id="id-materno">
				  </div>	
				 <div class="form-group">
				    <label for="exampleHijos" class="form-label">Hijos</label>
				    <input type="text" class="form-control" name="hijos" id="id-hijos">
				  </div> 
				  <div class="form-group">
				    <label for="exampleSueldo" class="form-label">Sueldo</label>
				    <i class="fas fa-prescription-bottle-alt form-control-feedback2"></i>
				    <input type="text" class="form-control" name="sueldo" id="id-sueldo">
				  </div>
				  <div class="form-group">
				    <label for="exampleSexo" class="form-label">Sexo</label>
				    <select class="form-select form-control" name="sexo" id="id-sexo">
					  <option value="" selected>[Seleccione Sexo]</option>
					  <option value="Femenino">Femenino</option>
					  <option value="Masculino">Masculino</option>
					</select>
				  </div>
				  <div class="form-group">
				    <label for="exampleCondicion" class="form-label">Condición</label>
				    <select class="form-select form-control" name="condicion" id="id-condicion">
					  <option value="" selected>[Seleccione Condición]</option>
					  	<c:forEach items="${requestScope.condiciones}" var="bean">
					  		<option value="${bean.codigo}">${bean.nombre}</option>
						</c:forEach>

					</select>
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
	    <!--fin modal PARA REGISTRAR-->
	    
	    
	  	<!-- Modal PARA ELIMINAR-->
		<div class="modal fade" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">SISTEMA</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form id="formDocente" action="ServletDocente?accion=ELIMINAR" method="post">
		        	<h4>Seguro de eliminar Docente?</h4>
				    <input type="hidden" class="form-control" name="codigoEliminar" id="codEliminar">
				  <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary">SI</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
			      </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	    <!--fin modal PARA ELIMINAR-->	    
	    
	    
	    
	    
	    
	    <div class="mt-5">
	    <table id="tableDocente" class="table table-striped" style="width:100%">
        <thead>
            <tr>
                <th>CÓDIGO</th>
                <th>NOMBRE</th>
                <th>PATERNO</th>
                <th>MATERNO</th>
                <th>SEXO</th>
                <th>HIJOS</th>
                <th>SUELDO</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${requestScope.docentes}" var="row">
	            <tr>
	                <td>${row.codigo}</td>
	                <td>${row.nombre}</td>
	                <td>${row.paterno}</td>
	                <td>${row.materno}</td>
	                <td>${row.sexo}</td>
	                <td>${row.hijos}</td>
	                <td>${row.sueldo}</td>
	                <td><button type="button" class="btn btn-info btn-buscar" data-bs-toggle="modal" data-bs-target="#modalDocente">VER DATOS</button></td>
	                <td><button type="button" class="btn btn-danger btn-eliminar" data-bs-toggle="modal" data-bs-target="#modalEliminar">ELIMINAR</button></td>
	            </tr>
            </c:forEach>
            
        </tbody>
    </table>
	</div>    
	    
	  
	</div>
	
	<!-- JS principal -->
	<script src="js/jquery-3.5.1.js"></script>

	
	
	
	<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<!-- JS para la tabla -->
	<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

	<!--JS para validar  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
	
	<script src="datepicker/bootstrap-datepicker.js"></script> 
	
	
	<script>
		//asignar evento click a todos los botones con CLASE "btn-eliminar"
		//usamos jquery
		$(document).on("click",".btn-eliminar",function(){
			//variable
			let cod;
			//leer columna còdigo de la fila actual según el botòn eliminar que hizo click
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			//alert(cod);
			$("#codEliminar").val(cod);
		})
		//asignar evento click a todos los botones con CLASE "btn-buscar"
		//usamos jquery
		$(document).on("click",".btn-buscar",function(){
			//variables
			let cod,nom,pat,mat,sexo,hijos,sue;
			//leer columnas de la fila actual según el botòn buscar que hizo click
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			nom=$(this).parents("tr").find("td")[1].innerHTML;
			pat=$(this).parents("tr").find("td")[2].innerHTML;
			mat=$(this).parents("tr").find("td")[3].innerHTML;
			sexo=$(this).parents("tr").find("td")[4].innerHTML;
			hijos=$(this).parents("tr").find("td")[5].innerHTML;
			sue=$(this).parents("tr").find("td")[6].innerHTML;
			//mostrar en las controles del modalDocente
			$("#id-codigo").val(cod);
			$("#id-nombre").val(nom);
			$("#id-paterno").val(pat);
			$("#id-materno").val(mat);
			$("#id-sexo").val(sexo);
			$("#id-hijos").val(hijos);
			$("#id-sueldo").val(sue);
		})
		
		
	</script>

	<script>
		$(document).ready(function () {
		    $('#tableDocente').DataTable();
		    //validación
		    $('#formDocente').bootstrapValidator({      
	        	 fields:{
	        		 	nombre:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo nombre es obligatorio'
	        		 			},
	        		 			regexp:{
	        		 				regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú]{3,20}$/,
	        		 				message:'Campo nombre solo letras MIN:3 MAX:20'
	        		 			}
	        		 		}
	        		 	},
	        		 	paterno:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo paterno es obligatorio'
	        		 			},
	        		 			regexp:{
	        		 				regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú]{5,25}$/,
	        		 				message:'Campo paterno solo letras MIN:5 MAX:25'
	        		 			}
	        		 		}
	        		 	},
	        		 	materno:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo materno es obligatorio'
	        		 			},
	        		 			regexp:{
	        		 				regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú]{5,25}$/,
	        		 				message:'Campo materno solo letras MIN:5 MAX:25'
	        		 			}
	        		 		}
	        		 	},
	        		 	hijos:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo hijos es obligatorio'
	        		 			},
	        		 			regexp:{
	        		 				regexp:/^([0-9]||[1][0-2])$/,
	        		 				message:'Campo hijos MIN:0 MAX:12'
	        		 			}
	        		 		}
	        		 	},
	        		 	sueldo:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo sueldo es obligatorio'
	        		 			}
	        		 		}
	        		 	},
	        		 	sexo:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo sexo es obligatorio'
	        		 			}
	        		 		}
	        		 	},
	        		 	condicion:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo condición es obligatorio'
	        		 			}
	        		 		}
	        		 	},
	        		 	
	        	 }
	        })
	        
		});
	</script>
	
	
</body>
</html>









