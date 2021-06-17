package dao;

import model.Reporte;
import util.Conexion;
import util.GenericDAO;

public class ReporteDAO extends Conexion<Reporte> implements GenericDAO<Reporte>  {

	public ReporteDAO(){
		super(Reporte.class);
	} 

}
