package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuarioDAO;
import model.*;
import util.EnviarEmail;


/**
 * Servlet implementation class UserController
 */
@WebServlet("/UsuarioServlet/*")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO udao=new UsuarioDAO();
    /**
     * Default constructor. 
     */
    public UsuarioServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		try {
			switch(action) {
				case "registrar":agregarUsuario(request,response);
				break;
			}
		}catch(Exception e) {
			System.out.print("Ha ocurrido un error\n"+e.getMessage());
		}
		
	}
	
	private void agregarUsuario(HttpServletRequest request,HttpServletResponse response ) 
			throws ServletException, SQLException, IOException{
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		String email=request.getParameter("email");
		Usuario u=new Usuario();
		u.setUsuario(user);
		u.setEmail(email);
		u.setPass(pass);
		Rol rol=new Rol();
		rol.setId(0);
		u.setRol(rol);
		u.setState(Short.parseShort(""+0));
		UsuarioDAO udao=new UsuarioDAO();
		udao.insert(u);
		String mensaje="Hola! <strong>"+u.getUsuario()+"</strong>,<p>Se ha creado correctamente su usuario en el sistema pero requiere confirmar su registro.</p>"+
		"<p>Para ello deberá dar click en el <a href='http://localhost:8080/ExamenWeb/user/validar/"+u.getUsuario()+"'>Siguiente Enlace</a>. </p>"
				+ "<p>Atentamente,</p><p>Equipo de soporte del sistema</p>";
		EnviarEmail em=new EnviarEmail("progwebtesteos@gmail.com","Programacion2021");
		em.sendEmail(u.getEmail(), "Creacion de usuario SISREPORT", mensaje);
		
		
		request.getRequestDispatcher("usuarioRegistro.jsp").forward(request, response);;
		
		
	}

}
