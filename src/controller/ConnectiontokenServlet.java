package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectiontokenDAO;
import dao.TypedbDAO;
import dao.UsuarioDAO;
import model.Connectiontoken;
import model.Typedb;
import model.Usuario;

/**
 * Servlet implementation class ConnectiontokenServlet
 */
@WebServlet("/ConnectiontokenServlet/*")
public class ConnectiontokenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ConnectiontokenDAO connecDAO;
	private TypedbDAO tDAO;
	private UsuarioDAO uDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConnectiontokenServlet() {
		super();
		connecDAO = new ConnectiontokenDAO();
		tDAO = new TypedbDAO();
		uDAO = new UsuarioDAO();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch (action) {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

	private void registrar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String db = request.getParameter("db");
		String host = request.getParameter("host");
		String pass = request.getParameter("pass");
		short port = Short.parseShort(request.getParameter("port"));
		short state = Short.parseShort(request.getParameter("state"));
		String token = request.getParameter("token");
		String userdb = request.getParameter("userdb");
		String type = request.getParameter("type");
		Integer usuario = Integer.parseInt(request.getParameter("usuario"));
		Connectiontoken connec = new Connectiontoken();
		Typedb ty = tDAO.find(type);
		Usuario u = uDAO.find(usuario);
		connec.setDb(db);
		connec.setHost(host);
		connec.setPass(pass);
		connec.setPort(port);
		connec.setState(state);
		connec.setToken(token);
		connec.setUserdb(userdb);
		connec.setTypedb(ty);
		connec.setUsuario(u);
		connecDAO.insert(connec);
		request.getRequestDispatcher("tokenRegistro.jsp").forward(request, response);

	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		String db = request.getParameter("db");
		String host = request.getParameter("host");
		String pass = request.getParameter("pass");
		short port = Short.parseShort(request.getParameter("port"));
		short state = Short.parseShort(request.getParameter("state"));
		String token = request.getParameter("token");
		String userdb = request.getParameter("userdb");
		String type = request.getParameter("type");
		Integer usuario = Integer.parseInt(request.getParameter("usuario"));
		Connectiontoken connec = new Connectiontoken();
		Typedb ty = tDAO.find(type);
		Usuario u = uDAO.find(usuario);
		connec.setId(id);
		connec.setDb(db);
		connec.setHost(host);
		connec.setPass(pass);
		connec.setPort(port);
		connec.setState(state);
		connec.setToken(token);
		connec.setUserdb(userdb);
		connec.setTypedb(ty);
		connec.setUsuario(u);
		connecDAO.update(connec);
		request.getRequestDispatcher("tokenList.jsp").forward(request, response);
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		Connectiontoken connec = new Connectiontoken();
		connec.setId(id);
		Connectiontoken aux = connecDAO.find(connec.getId());
		request.getSession().setAttribute("connectiontoken", aux);
		request.getRequestDispatcher("tokenRegistro.jsp").forward(request, response);
	}

	private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		Connectiontoken connec = new Connectiontoken();
		connec.setId(id);
		Connectiontoken aux = connecDAO.find(connec.getId());
		request.getSession().setAttribute("connectiontoken", aux);
		request.getRequestDispatcher("tokenRegistro.jsp").forward(request, response);
	}

}
