package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.Departement;

/***
 * departement avec id et nom
 * methode pou recuperer la liste de departements
 * @author audrey
 *
 */

public class DepartementService {

	List<Departement> listeDepartements = new ArrayList<>();
			

	public List<Departement> listerDepartements() {
		return listeDepartements;
	}
}
