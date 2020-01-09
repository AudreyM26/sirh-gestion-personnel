package dev.sgp.service;

import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.*;

public class CollaborateurService {

	List<Collaborateur> listeCollaborateurs = new ArrayList<>();
	 
	public List<Collaborateur> listerCollaborateurs() {
		return listeCollaborateurs;
	}

	public Collaborateur infosCollaborateur(String matricule) {
		
		Collaborateur collabInfos = null;
		
		for(Collaborateur collab : listeCollaborateurs){
			
			if(collab.getMatricule().equals(matricule)){
				collabInfos = collab;
			}
		}
		
		return collabInfos;
	}
	
	public void sauvegarderCollaborateur(Collaborateur collab) {
		listeCollaborateurs.add(collab);
	}
}
