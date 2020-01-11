package dev.sgp.web;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import dev.sgp.entite.Civilite;
import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;
import dev.sgp.service.BanqueService;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;

/***
 * servlet pour acceder a la page editer (get)
 * servlet pour soumettre formulaire de la page editer (post)
 * nouveaux elements :
 * civilite
 * telephone
 * poste
 * departement
 * banque
 * iban
 * bic
 * @author audrey
 *
 */

public class EditerCollaborateurController extends HttpServlet {

	// recuperation du service
	public CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	public DepartementService deptService = Constantes.DEPT_SERVICE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// resp.getWriter().write("Hello ListerCollaborateursController à vous de jouer");
		// recupere la valeur d'un parametre dont le nom est matricule
		String matricule = req.getParameter("matricule");

		// utilisation du service
		Collaborateur collaborateur = collabService.infosCollaborateur(matricule);
		List<Departement> departements = deptService.listerDepartements();

		if (matricule == null || collaborateur == null) {
			//resp.sendError(400, "Un matricule est attendu");
			resp.sendRedirect(req.getContextPath()+"/collaborateurs/lister");
		}else{
			
			req.setAttribute("collaborateurInfos", collaborateur);
			req.setAttribute("listeDepartements", departements);
			
			if(req.getParameter("erreur") != null){
				String[] tabErreur = req.getParameter("erreur").split(",");
				
				for (int i=0; i< tabErreur.length;i++ ){
					req.setAttribute(tabErreur[i],"");
				}
				
			}
			
			req.getRequestDispatcher("/WEB-INF/views/collab/editer.jsp")
			.forward(req, resp);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule").trim();
		String civilite = req.getParameter("civilite").trim();
		String adresse = req.getParameter("adresse").trim();
		String telephone = req.getParameter("tel").trim();
		String dept = req.getParameter("dept").trim();
		String poste = req.getParameter("poste").trim();
		String iban = req.getParameter("iban").trim();
		String bic = req.getParameter("bic").trim();
		
		String actif = req.getParameter("actif");
	
		//req.setCharacterEncoding("UTF-8");
		
		if(matricule == ""){
			resp.setStatus(400);
			resp.sendRedirect(req.getContextPath()+"/collaborateurs/lister");
		}else{
			
			resp.setContentType("text/html");
			
			Collaborateur collaborateur = collabService.infosCollaborateur(matricule);
			if(!dept.equals("")){
				String[] tabChampsDept = dept.split(",");
				String champsDeptEncode = new String(tabChampsDept[1].toString().getBytes("iso-8859-1"), "utf-8");

				//resp.getWriter().write("Hello ListerCollaborateursController à vous de jouer"+tabChampsDept[1]+" "+champsDeptEncode);
				collaborateur.setDepartement(new Departement(Integer.parseInt(tabChampsDept[0]),champsDeptEncode));
			}
			
			if(!poste.equals("")){
				String posteEncode = new String(poste.toString().getBytes("iso-8859-1"), "utf-8");
				collaborateur.setIntitulePoste(posteEncode);
				//resp.getWriter().write("poste : "+poste+" "+posteEncode);
			}
			
			if(!iban.equals("")){
				collaborateur.setIban(iban);
			}
			
			if(!bic.equals("")){
				collaborateur.setBic(bic);
				
				BanqueService banqueService = new BanqueService();
				collaborateur.setBanque(BanqueService.banqueNom(bic));
			}
			
			if(!civilite.equals("")){				
				collaborateur.setCivilite(Civilite.valueOf(civilite));
				
				ResourceBundle monFichierConf = ResourceBundle.getBundle("application");
				String photo = monFichierConf.getString("application.photoh");
				
				if(civilite.equals("mme")){
					photo = monFichierConf.getString("application.photof");
				}
				
				collaborateur.setPhoto(photo);
				
			}
			
			collaborateur.setActif(true);
			if( actif != null){
				collaborateur.setActif(Boolean.valueOf(actif).booleanValue());
			}
			
			String errorTel = "";
			String errorAdresse = "";
			String listErreur = "";
			
			if( telephone !="" && Pattern.matches("([0-9]{2}){4}[0-9]{2}",telephone) == false){
				resp.setStatus(400);
	
				errorTel = "erreurTelephone";
				
			}else{
				collaborateur.setTelephone(telephone);
			}
			
			if(adresse.equals("")){
				resp.setStatus(400);
			
				errorAdresse = "erreurAdresse";
	
			}else{
				collaborateur.setAdresse(new String(adresse.toString().getBytes("iso-8859-1"), "utf-8"));
			}
			
			String erreur = "";
			
			if(!errorTel.equals("") || !errorAdresse.equals("")){
				listErreur = errorTel+","+errorAdresse;
				
			}
			
			if(!listErreur.equals("")){
				erreur = "&erreur="+listErreur;
			}
			
			resp.sendRedirect(req.getContextPath()+"/collaborateurs/editer?matricule="+matricule+erreur);
		}

	}
}
