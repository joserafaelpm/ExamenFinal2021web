package dao;

import model.Typedb;
import util.Conexion;
import util.GenericDAO;

public class TypedbDAO extends Conexion<Typedb> implements GenericDAO<Typedb>  {

	public TypedbDAO(){
		super(Typedb.class);
	} 

}
