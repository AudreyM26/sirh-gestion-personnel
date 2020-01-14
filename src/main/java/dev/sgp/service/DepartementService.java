package dev.sgp.service;

import java.util.Arrays;
import java.util.List;

import dev.sgp.entite.Departement;

/***
 * departement avec id et nom
 * methode pou recuperer la liste de departements
 * @author audrey
 *
 */

public class DepartementService {

	List<Departement> listeDepartements = Arrays.asList(new Departement(1,"Comptabilité"),new Departement(2,"Ressources humaines"), new Departement(3,"Informatique"),new Departement(4,"Administratif"));
	
	
	public List<Departement> listerDepartements() {
		return listeDepartements;
	}
}
