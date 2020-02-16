package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.ResourceBundle;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;

/***
 * servlet pour acceder a la page creer (get)
 * servlet pour soumettre formulaire de la page creer (post)
 * @author audrey
 *
 */
public class CreerCollaborateurController extends HttpServlet {

	// recuperation du service
	public CollaborateurService collabService = Constantes.COLLAB_SERVICE;
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Collaborateur collab = new Collaborateur("","","",LocalDate.now(),"","","","",ZonedDateTime.now(),true);
		req.setAttribute("collaborateur",collab);

		req.getRequestDispatcher("/WEB-INF/views/collab/creer.jsp")
		.forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String nom = req.getParameter("nom").trim();
		String prenom = req.getParameter("prenom").trim();
		String date = req.getParameter("datenaissance").trim();
		
		String adresse = req.getParameter("adresse").trim();
		String numerosecu = req.getParameter("numerosecu").trim();
		
		//nom = new String(nom.toString().getBytes("iso-8859-1"), "utf-8");
		//prenom = new String(prenom.toString().getBytes("iso-8859-1"), "utf-8");
		//adresse = new String(adresse.toString().getBytes("iso-8859-1"), "utf-8");

		if ( nom.equals("") || prenom.equals("") || date.equals("") || adresse.equals("") || numerosecu.equals("")) {
			resp.setStatus(400);
		
			LocalDate datenaissance = LocalDate.now();
		
			if (nom.equals("")) {
				req.setAttribute("erreurNom","nom");
			}
			if (prenom.equals("")) {
				req.setAttribute("erreurPrenom","prenom");
			}
			if ( date.equals("")) {
				req.setAttribute("erreurDate","date");
				
			}else{
				datenaissance = LocalDate.parse(date);
			}
			
			if (adresse.equals("")) {
				req.setAttribute("erreurAdresse","adresse");
			}
			if (numerosecu.equals("")) {
				req.setAttribute("erreurNumero","numero");
			}
			
			Collaborateur collab = new Collaborateur("",nom,prenom,datenaissance,adresse,numerosecu,"","",ZonedDateTime.now(),false);
			req.setAttribute("collaborateur",collab);
			
			//resp.getWriter().write("nom "+nom+" "+nom.equals(""));
			req.getRequestDispatcher("/WEB-INF/views/collab/creer.jsp")
			.forward(req, resp);

		} else {
			if(Pattern.matches("([0-9]){15}",numerosecu) == false){
				
				resp.setStatus(400);
				//resp.getWriter().write("tes "+numerosecu+" "+numerosecu.length()+"  "+Pattern.matches("([0-9]){15}",numerosecu));
				LocalDate datenaissance = LocalDate.parse(date);
				Collaborateur collab = new Collaborateur("",nom,prenom,datenaissance,adresse,numerosecu,"","",ZonedDateTime.now(),false);
				req.setAttribute("collaborateur",collab);
				req.setAttribute("erreurNumero",numerosecu);
				
				req.getRequestDispatcher("/WEB-INF/views/collab/creer.jsp")
				.forward(req, resp);
				
				
			}else{
				
				//convert String to LocalDate
				LocalDate datenaissance = LocalDate.parse(date);
				//Period period = Period.between(datenaissance, LocalDate.now());
				
				//resp.getWriter().write("Hello ListerCollaborateursController à vous de jouer"+period.getYears());
				
				if( Period.between(datenaissance, LocalDate.now()).getYears() < 18 ){
					resp.setStatus(400);
					//resp.getWriter().write("tes "+numerosecu+" "+numerosecu.length()+"  "+Pattern.matches("([0-9]){15}",numerosecu));
					datenaissance = LocalDate.parse(date);
					
					Collaborateur collab = new Collaborateur("",nom,prenom,datenaissance,adresse,numerosecu,"","",ZonedDateTime.now(),false);
					req.setAttribute("collaborateur",collab);
					req.setAttribute("erreurDate",datenaissance);
					
					req.getRequestDispatcher("/WEB-INF/views/collab/creer.jsp")
					.forward(req, resp);
				}else{
					
					resp.setStatus(201);
					ResourceBundle monFichierConf = ResourceBundle.getBundle("application");
					
					String emailPro = StringUtils.stripAccents(nom)+"."+StringUtils.stripAccents(prenom)+monFichierConf.getString("application.email");
					String photo = monFichierConf.getString("application.photoh");
					ZonedDateTime dateHeureCreation = ZonedDateTime.now();
					
					List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
					String matricule = "M"+(collaborateurs.size()+1);
					
					Collaborateur nouveauCollab = new Collaborateur(matricule,nom,prenom,datenaissance,adresse,numerosecu,emailPro,photo,dateHeureCreation,true);
					collabService.sauvegarderCollaborateur(nouveauCollab);
		
					resp.sendRedirect(req.getContextPath()+"/collaborateurs/lister");
				}
			}
		}

	}
}
