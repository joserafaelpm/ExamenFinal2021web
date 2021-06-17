package dao;

import model.Usuario;
import util.Conexion;
import util.GenericDAO;

public class UsuarioDAO extends Conexion<Usuario> implements GenericDAO<Usuario>  {

	public UsuarioDAO(){
		super(Usuario.class);
	} 

}
