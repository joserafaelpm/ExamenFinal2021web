package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectiontokenDAO;
import dao.ReporteDAO;
import model.Connectiontoken;
import model.Reporte;

/**
 * Servlet implementation class ReporteServlet
 */
@WebServlet("/ReporteServlet/*")
public class ReporteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private ReporteDAO reDAO;
       private ConnectiontokenDAO cDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReporteServlet() {
        super();
        reDAO = new ReporteDAO();
        cDAO = new ConnectiontokenDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch (action) {
		case "mostrar":
			this.showForm(request, response);
			break;
		default:
			break;
		}
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
		String description = request.getParameter("description");
		String file = request.getParameter("file");
		String name = request.getParameter("name");
		String state = request.getParameter("state");
		Integer tokenid = Integer.parseInt(request.getParameter("tokenid"));
		Connectiontoken con = cDAO.find(tokenid);
		Calendar c = Calendar.getInstance();
		String [] datecrateS = request.getParameter("datecreate").split("-");
		c.set(Integer.parseInt(datecrateS[0]),Integer.parseInt(datecrateS[1])-1, Integer.parseInt(datecrateS[2]));
		Timestamp datecreate = new Timestamp(c.getTimeInMillis());
		Reporte r = new Reporte();
		r.setDescription(description);
		r.setFile(file);
		r.setName(name);
		r.setState(state);
		r.setDatecreate(datecreate);
		r.setConnectiontoken(con);
		reDAO.insert(r);
		request.getRequestDispatcher("reporteRegistro.jsp").forward(request, response);;
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		String description = request.getParameter("description");
		String file = request.getParameter("file");
		String name = request.getParameter("name");
		String state = request.getParameter("state");
		Integer tokenid = Integer.parseInt(request.getParameter("tokenid"));
		Connectiontoken con = cDAO.find(tokenid);
		Calendar c = Calendar.getInstance();
		String [] datecrateS = request.getParameter("datecreate").split("-");
		c.set(Integer.parseInt(datecrateS[0]),Integer.parseInt(datecrateS[1])-1, Integer.parseInt(datecrateS[2]));
		Timestamp datecreate = new Timestamp(c.getTimeInMillis());
		Reporte r = new Reporte();
		r.setId(id);
		r.setDescription(description);
		r.setFile(file);
		r.setName(name);
		r.setState(state);
		r.setDatecreate(datecreate);
		r.setConnectiontoken(con);
		reDAO.update(r);
		request.getRequestDispatcher("reporteList.jsp").forward(request, response);;

	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Reporte r = new Reporte();
		r.setId(id);
		Reporte aux = reDAO.find(r.getId());
		request.getSession().setAttribute("reporte", aux);
		request.getRequestDispatcher("reporteRegistro.jsp").forward(request, response);
		
	}
	
	private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Reporte r = new Reporte();
		r.setId(id);
		Reporte aux = reDAO.find(r.getId());
		request.getSession().setAttribute("reporte", aux);
		request.getRequestDispatcher("reporteRegistro.jsp").forward(request, response);
		
	}

}
