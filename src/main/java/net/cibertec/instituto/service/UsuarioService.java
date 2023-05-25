package net.cibertec.instituto.service;

import java.util.List;

import net.cibertec.instituto.entity.Menu;
import net.cibertec.instituto.entity.Usuario;
import net.cibertec.instituto.fabrica.DAOFactory;
import net.cibertec.instituto.interfaces.UsuarioDAO;

public class UsuarioService {
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	private UsuarioDAO objUsu=fabrica.getUsuarioDAO();
	
	public Usuario sesionUsuario(String vLogin, String vClave) {
		return objUsu.iniciarSesion(vLogin, vClave);
	}
	public List<Menu> menusDelUsuario(int codigo) {
		return objUsu.traerMenusDelUsuario(codigo);
	}
	
	
}
