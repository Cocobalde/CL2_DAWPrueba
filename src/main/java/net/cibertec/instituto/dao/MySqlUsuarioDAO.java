package net.cibertec.instituto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.cibertec.instituto.entity.Menu;
import net.cibertec.instituto.entity.Usuario;
import net.cibertec.instituto.interfaces.UsuarioDAO;
import net.cibertec.instituto.utils.MySqlConexion;

public class MySqlUsuarioDAO implements UsuarioDAO {

	@Override
	public Usuario iniciarSesion(String vLogin, String vClave) {
		Usuario bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="select cod_usu, nom_usu, ape_usu from tb_usuario "+
					   "where log_usu = ? and pas_usu = BINARY ?";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, vLogin);
			pstm.setString(2, vClave);
			rs=pstm.executeQuery();
			if(rs.next()) {
				bean=new Usuario();
				bean.setCodigo(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setApellido(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}

	@Override
	public List<Menu> traerMenusDelUsuario(int codigo) {
		List<Menu> lista=new ArrayList<Menu>();
		Menu bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="select m.* from tb_menu m inner join tb_acceso a "+
						"on a.cod_men = m.cod_men where a.cod_usu=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, codigo);
			rs=pstm.executeQuery();
			while(rs.next()) {
				bean=new Menu();
				bean.setCodigo(rs.getInt(1));
				bean.setDescripcion(rs.getString(2));
				bean.setUrl(rs.getString(3));
				lista.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

}
