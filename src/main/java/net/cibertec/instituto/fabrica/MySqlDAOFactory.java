package net.cibertec.instituto.fabrica;

import net.cibertec.instituto.dao.MySqlBienDAO;
import net.cibertec.instituto.dao.MySqlCondicionDAO;
import net.cibertec.instituto.dao.MySqlDocenteDAO;
import net.cibertec.instituto.dao.MySqlUsuarioDAO;
import net.cibertec.instituto.interfaces.BienDAO;
import net.cibertec.instituto.interfaces.CondicionDAO;
import net.cibertec.instituto.interfaces.DocenteDAO;
import net.cibertec.instituto.interfaces.UsuarioDAO;

public class MySqlDAOFactory extends DAOFactory {

	@Override
	public CondicionDAO getCondicionDAO() {
		// TODO Auto-generated method stub
		return new MySqlCondicionDAO();
	}

	@Override
	public DocenteDAO getDocenteDAO() {
		// TODO Auto-generated method stub
		return new MySqlDocenteDAO();
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		// TODO Auto-generated method stub
		return new MySqlUsuarioDAO();
	}

	@Override
	public BienDAO getBienDAO() {
		// TODO Auto-generated method stub
		return new MySqlBienDAO();
	}

}
