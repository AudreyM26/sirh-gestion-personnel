package dev.sgp.web;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.*;
import javax.servlet.ServletException;



public class ListerCollaborateursController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//envoyer information servlet vers JSP
		req.setAttribute("listeNoms", Arrays.asList("Robert", "Jean", "Hugues"));
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
	}
}
