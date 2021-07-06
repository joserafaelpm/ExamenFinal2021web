package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConnectiontokenDAO;
import dao.TypedbDAO;
import dao.UsuarioDAO;
import model.Connectiontoken;
import model.Typedb;
import model.Usuario;

/**
 * Servlet implementation class ConnectiontokenServlet
 */
@WebServlet("/token/*")
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
		//String action = request.getParameter("action");
		String partes[]=request.getRequestURI().split("/");
		String action=partes[3];
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
		//String action = request.getParameter("action");
		String partes[]=request.getRequestURI().split("/");
		String action=partes[3];
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
		String host=request.getParameter("host");
		String userdb=request.getParameter("userdb");
		int port=Integer.parseInt(request.getParameter("port"));
		Typedb tipo=new Typedb();
		tipo.setId(request.getParameter("typedb"));
		String pass=request.getParameter("pass");
		Connectiontoken ct=new Connectiontoken();
		ct.setHost(host);
		ct.setUserdb(userdb);
		ct.setPort(new Short(port+""));
		ct.setTypedb(tipo);
		ct.setPass(pass);
		ct.setToken("KsyHDycnKso");
		HttpSession misession= request.getSession(true);
		Usuario user=(Usuario)misession.getAttribute("usuario");
		ct.setUsuario(user);
		connecDAO.insert(ct);
		response.sendRedirect("../dashboard/tokens.jsp");

	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id"));
		String host=request.getParameter("host");
		String userdb=request.getParameter("userdb");
		int port=Integer.parseInt(request.getParameter("port"));
		Typedb tipo=new Typedb();
		tipo.setId(request.getParameter("typedb"));
		String pass=request.getParameter("pass");	
		Connectiontoken ct=new Connectiontoken();
		ct.setHost(host);
		ct.setUserdb(userdb);
		ct.setPort(new Short(port+""));
		ct.setTypedb(tipo);
		ct.setPass(pass);
		ct.setToken("KsyHDycnKso");
		HttpSession misession= request.getSession(true);
		Usuario user=(Usuario)misession.getAttribute("usuario");
		ct.setUsuario(user);
		connecDAO.update(ct);
		response.sendRedirect("../dashboard/tokens.jsp");
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
