package net.cibertec.instituto.service;

import java.util.List;

import net.cibertec.instituto.entity.Condicion;
import net.cibertec.instituto.entity.Docente;
import net.cibertec.instituto.fabrica.DAOFactory;
import net.cibertec.instituto.interfaces.CondicionDAO;
import net.cibertec.instituto.interfaces.DocenteDAO;

public class DocenteService {
	//Paso 1: enviar origen de datos "4" al método getDAOFactory
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	//Paso 2: indicar con que método del objeto "fabrica" se va a trabajar
	private DocenteDAO objDoc=fabrica.getDocenteDAO();
	private CondicionDAO objCondi=fabrica.getCondicionDAO();
	
	
	//mètodos de servicio  que sirven para invocar a los métodos del objeto "objDoc" 
	public int registrar(Docente bean) {
		return objDoc.save(bean);
	}
	public int actualizar(Docente bean) {
		return objDoc.update(bean);
	}
	public int eliminarPorID(int cod) {
		return objDoc.eliminar(cod);
	}
	public Docente buscarPorID(int cod) {
		return objDoc.buscar(cod);
	}
	public List<Docente> listarTodos(){
		return objDoc.listAll();
	}
	public List<Condicion> listarCondiciones() {
		return objCondi.listAll();
	}
	
	
}
