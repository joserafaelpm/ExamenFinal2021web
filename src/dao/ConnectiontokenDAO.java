package dao;

import model.Connectiontoken;
import util.Conexion;
import util.GenericDAO;

public class ConnectiontokenDAO extends Conexion<Connectiontoken> implements GenericDAO<Connectiontoken>  {

	public ConnectiontokenDAO(){
		super(Connectiontoken.class);
	} 

}
