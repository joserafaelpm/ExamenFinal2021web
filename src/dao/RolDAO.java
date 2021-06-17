package dao;

import model.Rol;
import util.Conexion;
import util.GenericDAO;

public class RolDAO extends Conexion<Rol> implements GenericDAO<Rol>  {

	public RolDAO(){
		super(Rol.class);
	}

}
