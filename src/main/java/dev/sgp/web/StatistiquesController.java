package dev.sgp.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.VisiteWeb;
import dev.sgp.service.VisiteWebService;
import dev.sgp.util.Constantes;


public class StatistiquesController extends HttpServlet{
	
	public VisiteWebService visiteService = Constantes.VISITE_SERVICE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<String> visites = visiteService.listerStats();
		req.setAttribute("listeVisite", visites);
		
		req.getRequestDispatcher("/WEB-INF/views/collab/statistiques.jsp")
		.forward(req, resp);
	}
		
}
