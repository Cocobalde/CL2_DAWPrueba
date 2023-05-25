package net.cibertec.instituto.service;

import java.util.List;

import net.cibertec.instituto.entity.Bien;
import net.cibertec.instituto.fabrica.DAOFactory;
import net.cibertec.instituto.interfaces.BienDAO;

public class RequerimientoService {
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	private BienDAO objBien=fabrica.getBienDAO();
	
	
	public List<Bien> listarBienes() {
		return objBien.listAll();
	}
}
