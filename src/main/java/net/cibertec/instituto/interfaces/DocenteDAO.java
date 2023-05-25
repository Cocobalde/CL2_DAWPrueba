package net.cibertec.instituto.interfaces;

import java.util.List;

import net.cibertec.instituto.entity.Docente;

public interface DocenteDAO {
	public int save(Docente bean);
	public int update(Docente bean);
	public int eliminar(int cod);
	public Docente buscar(int cod);
	public List<Docente> listAll();
	
}
