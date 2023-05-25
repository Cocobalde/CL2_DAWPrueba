package net.cibertec.instituto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.cibertec.instituto.entity.Bien;
import net.cibertec.instituto.interfaces.BienDAO;
import net.cibertec.instituto.utils.MySqlConexion;

public class MySqlBienDAO implements BienDAO {

	@Override
	public List<Bien> listAll() {
		List<Bien> lista=new ArrayList<Bien>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1
			cn=MySqlConexion.getConexion();
			//2
			String sql="select *from tb_bien";
			//3
			pstm=cn.prepareStatement(sql);
			//4
			//5
			rs=pstm.executeQuery();
			//6
			while(rs.next()) {
				//7
				Bien b=new Bien();
				//8
				b.setCodigoBien(rs.getInt(1));
				b.setDescripcion(rs.getString(2));
				b.setCodigoTipoBien(rs.getInt(3));
				//9
				lista.add(b);
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
