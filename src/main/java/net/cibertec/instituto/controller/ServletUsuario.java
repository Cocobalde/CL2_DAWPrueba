package net.cibertec.instituto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cibertec.instituto.entity.Menu;
import net.cibertec.instituto.entity.Usuario;
import net.cibertec.instituto.service.UsuarioService;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioService servicio=new UsuarioService();
	
    public ServletUsuario() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo=request.getParameter("accion");
		if(tipo.equals("INICIAR"))
			iniciaLogin(request,response);
		else if(tipo.equals("CERRAR"))
			cerrarLogin(request,response);
	}

	private void cerrarLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//obtener sesión actual
		HttpSession sesionActual=request.getSession();
		//invalidar atributos de tipo sesión
		sesionActual.invalidate();
		response.sendRedirect("login.jsp?MENSAJE=Sesion terminada");
		
	}

	private void iniciaLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String vLogin,vClave;
		//leer cajas del formulario login.jsp
		vLogin=request.getParameter("login");
		vClave=request.getParameter("clave");
		//invocar al método sesionUsuario
		Usuario usu=servicio.sesionUsuario(vLogin, vClave);
		//validar usu
		if(usu==null) {
			response.sendRedirect("login.jsp?MENSAJE=Usuario y/o clave incorrectos");
		}
		else {
			//invocar al método menusDelUsuario
			List<Menu> data=servicio.menusDelUsuario(usu.getCodigo());
			//crear atributo de tipo sesión con el valor del arreglo "data"
			request.getSession().setAttribute("listaMenus", data);
			
			//direccionar a la página menu.jsp
			request.getRequestDispatcher("/menu.jsp").forward(request, response);
		}
		
		
	}

}
