package dev.sgp.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.service.ActiviteService;
import dev.sgp.util.Constantes;

public class ActivitesController extends HttpServlet{
	
	public ActiviteService activiteService = Constantes.ACTIVITES_SERVICE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		List<String> activites = activiteService.listerActivite();
		
		req.setAttribute("listeActivites", activites);
		
		req.getRequestDispatcher("/WEB-INF/views/collab/activites.jsp")
		.forward(req, resp);
	}
		
}
