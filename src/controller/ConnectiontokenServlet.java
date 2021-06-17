package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectiontokenDAO;
import model.Connectiontoken;

/**
 * Servlet implementation class ConnectiontokenServlet
 */
@WebServlet("/ConnectiontokenServlet/*")
public class ConnectiontokenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ConnectiontokenDAO connecDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConnectiontokenServlet() {
		super();
		connecDAO = new ConnectiontokenDAO();
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

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String db = request.getParameter("db");
		String host = request.getParameter("host");
		String pass = request.getParameter("pass");
		short port = Short.parseShort(request.getParameter("port"));
		short state = Short.parseShort(request.getParameter("state"));
		String token = request.getParameter("token");
		String userdb = request.getParameter("userdb");
		Connectiontoken connec =  new Connectiontoken();
		connec.setDb(db);
		connec.setHost(host);
		connec.setPass(pass);
		connec.setPort(port);
		connec.setState(state);
		connec.setToken(token);
		connec.setUserdb(userdb);
		connecDAO.update(connec);
		request.getRequestDispatcher("token.jsp").forward(request, response);
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String db = request.getParameter("db");
		String host = request.getParameter("host");
		String pass = request.getParameter("pass");
		short port = Short.parseShort(request.getParameter("port"));
		short state = Short.parseShort(request.getParameter("state"));
		String token = request.getParameter("token");
		String userdb = request.getParameter("userdb");
		Connectiontoken connec =  new Connectiontoken();
		connec.setDb(db);
		connec.setHost(host);
		connec.setPass(pass);
		connec.setPort(port);
		connec.setState(state);
		connec.setToken(token);
		connec.setUserdb(userdb);
		connecDAO.insert(connec);
		request.getRequestDispatcher("tokenRegistro.jsp").forward(request, response);

	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		Connectiontoken connec =  new Connectiontoken();
	}

	private void showForm(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		Connectiontoken connec =  new Connectiontoken();
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		Connectiontoken connec =  new Connectiontoken();
		Connectiontoken connecaux =  new Connectiontoken();
	}

}
