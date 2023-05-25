package net.cibertec.instituto.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import net.cibertec.instituto.dao.MySqlCondicionDAO;
import net.cibertec.instituto.dao.MySqlDocenteDAO;
import net.cibertec.instituto.entity.Condicion;
import net.cibertec.instituto.entity.Docente;
import net.cibertec.instituto.service.DocenteService;

/**
 * Servlet implementation class ServletDocente
 */
@WebServlet("/ServletDocente")
public class ServletDocente extends HttpServlet {
	//crear objeto de la clase DocenteService
	private DocenteService servicioDoc=new DocenteService();
	
	private static final long serialVersionUID = 1L;
       
    public ServletDocente() {
        super();

    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recuperar párametro "accion" que viene de la pàgina docente.jsp para saber que acción se va a realizar
		String tipo;
		tipo=request.getParameter("accion");
		//evaluar el tipo de acción
		if(tipo.equals("GRABAR"))
			grabarDocente(request,response);
		else if(tipo.equals("ELIMINAR"))
			eliminarDocente(request,response);
		else if(tipo.equals("LISTAR"))
			listarDocente(request,response);	
		else if(tipo.equals("BUSCAR"))
			buscarDocente(request,response);	
	}

	private void buscarDocente(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String cod=request.getParameter("codigo");
		Docente data=servicioDoc.buscarPorID(Integer.parseInt(cod));
		Gson gson=new Gson();
		String info=gson.toJson(data);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(info);
		
		
	}
	private void listarDocente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//invocar al mètodo listAll
		List<Docente> datos=servicioDoc.listarTodos();
		//crear atributo
		request.setAttribute("docentes", datos);
		//crear atributo para almacenar todas las condiciones
		List<Condicion> datosCondi=servicioDoc.listarCondiciones();
		request.setAttribute("condiciones", datosCondi);
		//direccionar a la pàgina para enviar atributo
		request.getRequestDispatcher("/docenteJSTL.jsp").forward(request, response);
		
	}

	private void eliminarDocente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//reuperar còdigo a eliminar caja con atrinuto name "codigoEliminar" del modal "modalEliminar"
		String cod=request.getParameter("codigoEliminar");
		//
		String msj;
		//invocar al mètodo eliminar
		int salida=servicioDoc.eliminarPorID(Integer.parseInt(cod));
		//validar salida
		if(salida>0)
			//mensaje cuando es +
			//request.setAttribute("MENSAJE", "Docente eliminado");
			msj="Docente eliminado";
		else
			//mensaje cuando es -
			//request.setAttribute("MENSAJE", "Error en la eliminaciòn");
			msj="Error en la eliminaciòn";
		//listarDocente(request, response);
		response.sendRedirect("docente.jsp?MENSAJE="+msj);
	}

	private void grabarDocente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//variables
		String cod,nom,pat,mat,sexo,hijos,sue,codCondi,msj;
		//leer los controles del formulario(cajas,select)
		cod=request.getParameter("codigo");
		nom=request.getParameter("nombre");
		pat=request.getParameter("paterno");
		mat=request.getParameter("materno");
		sexo=request.getParameter("sexo");
		hijos=request.getParameter("hijos");
		sue=request.getParameter("sueldo");
		codCondi=request.getParameter("condicion");
		//crear objeto de la clase Docente
		Docente bean=new Docente();
		//setear los atributos del objeto "bean" con las variables
		bean.setCodigo(Integer.parseInt(cod));
		bean.setNombre(nom);
		bean.setPaterno(pat);
		bean.setMaterno(mat);
		bean.setSexo(sexo);
		bean.setHijos(Integer.parseInt(hijos));
		bean.setSueldo(Double.parseDouble(sue));
		bean.setCodigoCondicion(Integer.parseInt(codCondi));
		
		//validar código
		if(Integer.parseInt(cod)==0) {
			//invocar al mètodo save
			int estado;
			estado=servicioDoc.registrar(bean);
			//validar "estado"		
			if(estado>0)
				//crear atributo
				//request.setAttribute("MENSAJE", "Docente registrado correctamente");
				msj="Docente registrado correctamente";
			else
				//crear atributo
				//request.setAttribute("MENSAJE", "Error en el registro de Docente");
				msj="Error en el registro de Docente";
		}
		else {
			//invocar al mètodo update
			int estado;
			estado=servicioDoc.actualizar(bean);
			//validar "estado"		
			if(estado>0)
				//crear atributo
				//request.setAttribute("MENSAJE", "Docente actualizado correctamente");
				msj="Docente actualizado correctamente";
			else
				//crear atributo
				//request.setAttribute("MENSAJE", "Error en la actualizaciòn");
				msj="Error en la actualizaciòn";
		}
		//invocar
		//listarDocente(request, response);
		response.sendRedirect("docente.jsp?MENSAJE="+msj);
		
		
		
	}

	
}













