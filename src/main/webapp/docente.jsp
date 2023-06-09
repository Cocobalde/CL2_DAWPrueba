<%
	if(request.getSession().getAttribute("listaMenus")==null)
		response.sendRedirect("login.jsp?MENSAJE=Iniciar login");
%>

<jsp:include page="menu.jsp" />
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
	
		<c:if test="${param.MENSAJE!=null}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
			  <strong>SISTEMA</strong> ${param.MENSAJE}
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
				    <label for="exampleNombre" class="form-label">C�digo</label>
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
				    <label for="exampleCondicion" class="form-label">Condici�n</label>
				    <select class="form-select form-control" name="condicion" id="id-condicion">
					  <option value="" selected>[Seleccione Condici�n]</option>
					  	
						

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
                <th>C�DIGO</th>
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
		
		cargarCondiciones();
		cargarDocentes();
		
		//asignar evento click a todos los botones con CLASE "btn-eliminar"
		//usamos jquery
		$(document).on("click",".btn-eliminar",function(){
			//variable
			let cod;
			//leer columna c�digo de la fila actual seg�n el bot�n eliminar que hizo click
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			//alert(cod);
			$("#codEliminar").val(cod);
		})
		//asignar evento click a todos los botones con CLASE "btn-buscar"
		//usamos jquery
		$(document).on("click",".btn-buscar",function(){
			//variables
			let cod,nom,pat,mat,sexo,hijos,sue;
			//leer columnas de la fila actual seg�n el bot�n buscar que hizo click
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			/*nom=$(this).parents("tr").find("td")[1].innerHTML;
			pat=$(this).parents("tr").find("td")[2].innerHTML;
			mat=$(this).parents("tr").find("td")[3].innerHTML;
			sexo=$(this).parents("tr").find("td")[4].innerHTML;
			hijos=$(this).parents("tr").find("td")[5].innerHTML;
			sue=$(this).parents("tr").find("td")[6].innerHTML;*/
			$.get("ServletDocente?accion=BUSCAR&codigo="+cod,function(response){
				console.log(response);
				//mostrar en las controles del modalDocente
				$("#id-codigo").val(response.codigo);
				$("#id-nombre").val(response.nombre);
				$("#id-paterno").val(response.paterno);
				$("#id-materno").val(response.materno);
				$("#id-sexo").val(response.sexo);
				$("#id-hijos").val(response.hijos);
				$("#id-sueldo").val(response.sueldo);	
				$("#id-condicion").val(response.codigoCondicion);
			})
			
		})
		//crear funci�n que lea el json que retorna el servlet "ServletCondicionJSON" 
		function cargarCondiciones(){
			//funci�n en JQUERY que permite leer un JSON
			$.get("ServletCondicionJSON",function(response){
				//console.log(response);
				//bucle para realizar recorrido sobre "response"
				$.each(response,function(index,item){
					$("#id-condicion").append("<option value='"+item.codigo+"'>"+item.nombre+"</option>");
				})
			})
		}
		//crear funci�n que lea el json que retorna el servlet "ServletDocenteJSON" 
		function cargarDocentes(){
			$.get("ServletDocenteJSON",function(e){
				//console.log(e);
				$.each(e,function(i,item){
					$("#tableDocente").append("<tr>"+
			                "<td>"+item.codigo+"</td>"+
			                "<td>"+item.nombre+"</td>"+
			                "<td>"+item.paterno+"</td>"+
			                "<td>"+item.materno+"</td>"+
			                "<td>"+item.sexo+"</td>"+
			                "<td>"+item.hijos+"</td>"+
			                "<td>"+item.sueldo+"</td>"+
			                "<td><button type='button' class='btn btn-info btn-buscar' data-bs-toggle='modal' data-bs-target='#modalDocente'>BUSCAR</button></td>"+
			                "<td><button type='button' class='btn btn-danger btn-eliminar' data-bs-toggle='modal' data-bs-target='#modalEliminar'>ELIMINAR</button></td>"+
			            "</tr>");
				})
			    $('#tableDocente').DataTable();
			})
			
		}
		
		
		
	</script>

	<script>
		$(document).ready(function () {
		    //validaci�n
		    $('#formDocente').bootstrapValidator({      
	        	 fields:{
	        		 	nombre:{
	        		 		validators:{
	        		 			notEmpty:{
	        		 				message:'Campo nombre es obligatorio'
	        		 			},
	        		 			regexp:{
	        		 				regexp:/^[a-zA-Z\s\�\�\�\�\�\�\�\�\�\�\�\�]{3,20}$/,
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
	        		 				regexp:/^[a-zA-Z\s\�\�\�\�\�\�\�\�\�\�\�\�]{5,25}$/,
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
	        		 				regexp:/^[a-zA-Z\s\�\�\�\�\�\�\�\�\�\�\�\�]{5,25}$/,
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
	        		 				message:'Campo condici�n es obligatorio'
	        		 			}
	        		 		}
	        		 	},
	        		 	
	        	 }
	        })
	        
		});
	</script>
	
	
</body>
</html>









