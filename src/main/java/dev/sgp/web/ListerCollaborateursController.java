package dev.sgp.web;

import java.util.List;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import dev.sgp.entite.*;
import dev.sgp.service.*;
import dev.sgp.util.Constantes;

/***
 * servlet pour acceder a la page lister (get)
 * recuperer liste departements et collaborateurs
 * @author audrey
 *
 */

public class ListerCollaborateursController extends HttpServlet {

	// recuperation du service
	public CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	public DepartementService deptService = Constantes.DEPT_SERVICE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		//parametre de reccherche
		String actif = req.getParameter("actif");
		String dept = req.getParameter("dept");
		String mot = req.getParameter("mot");
		
		// utilisation du service
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		List<Departement> departements = deptService.listerDepartements();

		if(actif != null){
			req.setAttribute("actif", actif);
			collaborateurs = collabService.filtreNoActif();
		}
		
		if(dept != null){
			req.setAttribute("dept", dept);
			collaborateurs = collabService.filtreDept(dept);
		}
		
		if(mot != null){
			req.setAttribute("mot", mot);
			collaborateurs = collabService.filtreMot(mot);
		}
		

		req.setAttribute("listeCollaborateurs", collaborateurs);
		req.setAttribute("listeDepartements", departements);
		
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//parametre de reccherche
		String actif = req.getParameter("checkcollab");
		String dept = req.getParameter("dept");
		String mot = req.getParameter("mot").trim();
		
		String params = "";
		String separateur = "";
		
		if(actif != null){
			separateur = "&";
			if (params.equals("")) {
				separateur = "?";
			}
			
			params = params+separateur+"actif=no";
		}
		
		if(!dept.equals("")){
			separateur = "&";
			if (params.equals("")) {
				separateur = "?";
			}
			
			params = params+separateur+"dept="+dept;
		}
		
		if(!mot.equals("")){
			separateur = "&";
			if (params.equals("")) {
				separateur = "?";
			}
			
			params = params+separateur+"mot="+mot;
		}
		//resp.getWriter().write("actif "+actif);
		
		resp.sendRedirect(req.getContextPath()+"/collaborateurs/lister"+params);

	}
}
