package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RolDAO;
import dao.UsuarioDAO;
import model.Rol;
import model.Usuario;

/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/UsuarioServlet/*")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private UsuarioDAO userDAO;
       private RolDAO rDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioServlet() {
        super();
        userDAO = new UsuarioDAO();
        rDAO = new RolDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch (action) {
		case "eliminar":
			this.eliminar(request, response);
			break;
		case "mostrar":
			this.showForm(request, response);
			break;
		/*
		 * case "/buscar": this.buscar(request, response); break;
		 */
		default:
			break;
		}
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		Usuario user = new Usuario();
		Usuario useraux = userDAO.find(id);
		user.setId(id);
		userDAO.delete(useraux);
		request.getRequestDispatcher("usuarioList.jsp").forward(request, response);
	}

	private void showForm(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		System.out.println(action);
		switch (action) {
		case "buscar":
			this.buscar(request, response);
			break;
		case "registrar":
			this.registrar(request, response);
			break;
		case "actualizar":
			this.actualizar(request, response);
			break;
		default:
			break;
		}
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		short state = Short.parseShort(request.getParameter("state"));
		String usuario = request.getParameter("usuario");
		String rol = request.getParameter("rol");
		Rol r = rDAO.find(rol);
		Usuario user = new Usuario();
		user.setEmail(email);
		user.setPass(pass);
		user.setState(state);
		user.setUsuario(usuario);
		user.setRol(r);
		userDAO.insert(user);
		request.getRequestDispatcher("usuarioRegistro.jsp").forward(request, response);
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		short state = Short.parseShort(request.getParameter("state"));
		String usuario = request.getParameter("usuario");
		Rol r = rDAO.find(Integer.parseInt(request.getParameter("Rol")));
		Usuario user = new Usuario();
		user.setEmail(email);
		user.setPass(pass);
		user.setState(state);
		user.setUsuario(usuario);
		user.setRol(r);
		userDAO.update(user);
		request.getRequestDispatcher("usuarioRegistro.jsp").forward(request, response);
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
