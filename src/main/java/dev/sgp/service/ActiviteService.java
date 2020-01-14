package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

/***
 * methode pour lister et sauvegarder les activites (creation et edition collaborateur)
 * liste remplie dans filtre ActivtitesFilter
 * @author audrey
 *
 */
public class ActiviteService {

	List<String> listeActivites = new ArrayList<>();
	
	public List<String> listerActivite(){
		return listeActivites;
	}
 
	public void sauvegarderActivite(String infos){
		listeActivites.add(infos);
	}
}
