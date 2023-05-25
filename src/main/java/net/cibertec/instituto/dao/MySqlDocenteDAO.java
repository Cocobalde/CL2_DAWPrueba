package net.cibertec.instituto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.cibertec.instituto.entity.Docente;
import net.cibertec.instituto.interfaces.DocenteDAO;
import net.cibertec.instituto.utils.MySqlConexion;

public class MySqlDocenteDAO implements DocenteDAO {

	@Override
	public int save(Docente bean) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1
			cn=MySqlConexion.getConexion();
			//2
			String sql="insert into tb_docente values(null,?,?,?,?,?,?,?)";
			//3
			pstm=cn.prepareStatement(sql);
			//4
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getPaterno());
			pstm.setString(3, bean.getMaterno());
			pstm.setString(4, bean.getSexo());
			pstm.setInt(5, bean.getHijos());
			pstm.setDouble(6, bean.getSueldo());
			pstm.setInt(7, bean.getCodigoCondicion());
			//5
			salida=pstm.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int update(Docente bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MySqlConexion.getConexion();
			String sql = "update tb_docente set nom_doc=?,pat_doc=?,mat_doc=?,sex_doc=?,"+
												"num_hijo_doc=?,sue_doc=?,cod_condi_doc=? where cod_doc=?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getPaterno());
			pstm.setString(3, bean.getMaterno());
			pstm.setString(4, bean.getSexo());
			pstm.setInt(5, bean.getHijos());
			pstm.setDouble(6, bean.getSueldo());
			pstm.setInt(7, bean.getCodigoCondicion());
			pstm.setInt(8, bean.getCodigo());
			salida = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)pstm.close();
				if (cn != null)cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int eliminar(int cod) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="delete from tb_docente where cod_doc=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, cod);
			salida=pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public Docente buscar(int cod) {
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs = null;
		Docente d = null;
		try {
			//1
			cn=MySqlConexion.getConexion();
			//2
			String sql="select *from tb_docente where cod_doc=?";
			//3
			pstm=cn.prepareStatement(sql);
			//4
			pstm.setInt(1, cod);
			//5
			rs=pstm.executeQuery();
			//6
			if(rs.next()) {
				//7
				d = new Docente();
				//8
				d.setCodigo(rs.getInt(1));
				d.setNombre(rs.getString(2));
				d.setPaterno(rs.getString(3));
				d.setMaterno(rs.getString(4));
				d.setSexo(rs.getString(5));
				d.setHijos(rs.getInt(6));
				d.setSueldo(rs.getDouble(7));
				d.setCodigoCondicion(rs.getInt(8));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return d;
	}

	@Override
	public List<Docente> listAll() {
		List<Docente> lista=new ArrayList<Docente>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1
			cn=MySqlConexion.getConexion();
			//2
			String sql="select *from tb_docente";
			//3
			pstm=cn.prepareStatement(sql);
			//4
			
			//5
			rs=pstm.executeQuery();
			//6
			while(rs.next()) {
				//7
				Docente d=new Docente();
				//8
				d.setCodigo(rs.getInt(1));
				d.setNombre(rs.getString(2));
				d.setPaterno(rs.getString(3));
				d.setMaterno(rs.getString(4));
				d.setSexo(rs.getString(5));
				d.setHijos(rs.getInt(6));
				d.setSueldo(rs.getDouble(7));
				d.setCodigoCondicion(rs.getInt(8));
				//9
				lista.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

}

















