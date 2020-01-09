package dev.sgp.web;

import java.util.List;
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;


public class ListerCollaborateursController extends HttpServlet {

	// recuperation du service
	public CollaborateurService collabService = Constantes.COLLAB_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		// utilisation du service
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		
		//req.setAttribute("listeNoms", Arrays.asList("Robert", "Jean", "Hugues"));
		req.setAttribute("listeCollaborateurs", collaborateurs);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
	}
}
