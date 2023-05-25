package net.cibertec.instituto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.cibertec.instituto.entity.Condicion;
import net.cibertec.instituto.interfaces.CondicionDAO;
import net.cibertec.instituto.utils.MySqlConexion;

public class MySqlCondicionDAO implements CondicionDAO{

	@Override
	public List<Condicion> listAll() {
		List<Condicion> lista=new ArrayList<Condicion>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1
			cn=MySqlConexion.getConexion();
			//2
			String sql="select *from tb_condicion";
			//3
			pstm=cn.prepareStatement(sql);
			//4
			
			//5
			rs=pstm.executeQuery();
			//6
			while(rs.next()) {
				//7
				Condicion d=new Condicion();
				//8
				d.setCodigo(rs.getInt(1));
				d.setNombre(rs.getString(2));
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
