package net.cibertec.instituto.fabrica;

import net.cibertec.instituto.dao.SqlServerCondicionDAO;
import net.cibertec.instituto.dao.SqlServerDocenteDAO;
import net.cibertec.instituto.interfaces.BienDAO;
import net.cibertec.instituto.interfaces.CondicionDAO;
import net.cibertec.instituto.interfaces.DocenteDAO;
import net.cibertec.instituto.interfaces.UsuarioDAO;

public class SqlServerDAOFactory extends DAOFactory {

	@Override
	public CondicionDAO getCondicionDAO() {
		// TODO Auto-generated method stub
		return new SqlServerCondicionDAO();
	}

	@Override
	public DocenteDAO getDocenteDAO() {
		// TODO Auto-generated method stub
		return new SqlServerDocenteDAO();
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BienDAO getBienDAO() {
		// TODO Auto-generated method stub
		return null;
	}

}
