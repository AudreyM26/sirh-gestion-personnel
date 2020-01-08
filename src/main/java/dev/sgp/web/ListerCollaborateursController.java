package dev.sgp.web;

import java.io.IOException;

import javax.servlet.http.*;
import javax.servlet.ServletException;



public class ListerCollaborateursController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//resp.getWriter().write("Hello ListerCollaborateursController à vous de jouer");
		// recupere la valeur d'un parametre dont le nom est avecPhoto
		String avecPhotoParam = req.getParameter("avecPhoto");
		// recupere la valeur d'un parametre dont le nom est departement
		String departementParam = req.getParameter("departement");
		resp.setContentType("text/html");
		// code HTML ecrit dans le corps de la reponse
		resp.getWriter().write("<h1>Liste des collaborateurs</h1>"
		+ "<ul>"
		+ "<li>avecPhoto="+ avecPhotoParam + "</li>"
		+ "<li>departement="+ departementParam + "</li>"
		+ "</ul>");
	}
}
