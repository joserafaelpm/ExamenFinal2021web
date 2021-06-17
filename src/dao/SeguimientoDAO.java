package dao;

import model.Seguimiento;
import util.Conexion;
import util.GenericDAO;

public class SeguimientoDAO extends Conexion<Seguimiento> implements GenericDAO<Seguimiento>  {

	public SeguimientoDAO(){
		super(Seguimiento.class);
	} 

}
