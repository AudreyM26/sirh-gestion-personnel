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
		
		/*code test
		List<Collaborateur> collaborateurstest = collabService.listerCollaborateurs();
		String matricule = "M"+(collaborateurstest.size()+1);
		Collaborateur nouveauCollab = new Collaborateur(matricule,"test","toto",LocalDate.now(),"25 rue des loups 34500 beziers","123456789123654","test.toto@societe.com","/images/portraitf.jpg",ZonedDateTime.now(),true);
		collabService.sauvegarderCollaborateur(nouveauCollab);*/
		
		// utilisation du service
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		List<Departement> departements = deptService.listerDepartements();
		
		//req.setAttribute("listeNoms", Arrays.asList("Robert", "Jean", "Hugues"));
		req.setAttribute("listeCollaborateurs", collaborateurs);
		req.setAttribute("listeDepartements", departements);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
	}
}
