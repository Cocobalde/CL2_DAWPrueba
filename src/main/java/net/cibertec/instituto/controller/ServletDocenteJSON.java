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

import net.cibertec.instituto.entity.Docente;
import net.cibertec.instituto.service.DocenteService;

@WebServlet("/ServletDocenteJSON")
public class ServletDocenteJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletDocenteJSON() {
        super();

    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Docente> data=new DocenteService().listarTodos();
		Gson gson=new Gson();
		String info=gson.toJson(data);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(info);
		
	}

}
