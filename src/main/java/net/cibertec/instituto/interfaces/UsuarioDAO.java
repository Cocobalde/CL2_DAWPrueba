package net.cibertec.instituto.interfaces;

import java.util.List;

import net.cibertec.instituto.entity.Menu;
import net.cibertec.instituto.entity.Usuario;

public interface UsuarioDAO {
	public Usuario iniciarSesion(String vLogin,String vClave);
	public List<Menu> traerMenusDelUsuario(int codigo);
}
