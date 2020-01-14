package dev.sgp.ecouteur;

import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;


@WebListener
public class MyContainerListener implements ServletContextListener {

	public CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
		// initialiser des collaborateurs
		List<Collaborateur> collaborateurstest = collabService.listerCollaborateurs();
		String matricule = "M"+(collaborateurstest.size()+1);
		Collaborateur nouveauCollab = new Collaborateur(matricule,"Toutter","Amélie",LocalDate.now(),"20 rue des étoiles 34000 montpellier","123456789123654","toutter.amelie@societe.com","/images/portraitf.jpg",ZonedDateTime.now(),true);
		collabService.sauvegarderCollaborateur(nouveauCollab);
		collaborateurstest = collabService.listerCollaborateurs();
		String matricule2 = "M"+(collaborateurstest.size()+1);
		Collaborateur nouveauCollab2 = new Collaborateur(matricule2,"Roland","Rémi",LocalDate.now(),"25 rue des loups 34500 béziers","123456789123654","roland.remi@societe.com","/images/portraith.png",ZonedDateTime.now(),false);
		collabService.sauvegarderCollaborateur(nouveauCollab2);
		
		
		
		System.out.println("demarrage");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("Au revoir");
	}

}
