package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TypedbDAO;
import model.Typedb;

/**
 * Servlet implementation class TipobdServlet
 */
@WebServlet("/tipo/*")
public class TipobdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private TypedbDAO tyDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipobdServlet() {
        super();
        tyDAO = new TypedbDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String action = request.getParameter("action");
		String partes[]=request.getRequestURI().split("/");
		String action=partes[3];
		System.out.println(action);
		switch (action) {
		case "registrar":
			this.registrar(request, response);
			break;
		default:
			break;
		}
	}

	private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String aditional = request.getParameter("aditional");
		String description = request.getParameter("description");
		String driver = request.getParameter("driver");
		Typedb t = new Typedb();
		t.setId(id);
		t.setAditional(aditional);
		t.setDescription(description);
		t.setDriver(driver);
		tyDAO.insert(t);
		response.sendRedirect("../dashboard/tipoRegistro.jsp");
	}

}
