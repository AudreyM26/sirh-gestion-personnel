package dev.sgp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class EditerCollaborateurController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// resp.getWriter().write("Hello ListerCollaborateursController à vous
		// de jouer");
		// recupere la valeur d'un parametre dont le nom est matricule
		/*String matricule = req.getParameter("matricule");

		// code HTML ecrit dans le corps de la reponse

		if (matricule == null) {
			resp.sendError(400, "Un matricule est attendu");
		}

		if (resp.getStatus() == 200) {
			resp.setContentType("text/html");
			// code HTML ecrit dans le corps de la reponse
			resp.getWriter().write("<h1>Edition de collaborateur</h1>" + "Matricule : " + matricule);
		}*/
		
		req.getRequestDispatcher("/WEB-INF/views/collab/editer.jsp")
		.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		String titre = req.getParameter("titre");
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");

		if (matricule == null || titre == null || nom == null || prenom == null) {
			resp.setStatus(400);
			resp.setCharacterEncoding("UTF-8");
			String champsManquants = "Les paramètres suivants sont incorrects :\n";

			if (matricule == null) {
				champsManquants = champsManquants + "- matricule\n";
			}
			if (titre == null) {
				champsManquants = champsManquants + "- titre\n";
			}
			if (nom == null) {
				champsManquants = champsManquants + "- nom\n";
			}
			if (prenom == null) {
				champsManquants = champsManquants + "- prenom\n";
			}
			resp.getWriter().write(champsManquants);

			// resp.sendError(400,champsManquants);
		} else {
			resp.setStatus(201);
			resp.getWriter().write("Creation d'un collaborateur avec les informations suivantes :\n" + "matricule = "
					+ matricule + "\ntitre = " + titre + "\nnom = " + nom + "\nprenom = " + prenom);
		}

	}
}
