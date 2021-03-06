package dev.sgp.util;

import dev.sgp.service.*;

public class Constantes {

	// constante pour instancier CollaborateurService et acceder aux methodes
	public static CollaborateurService COLLAB_SERVICE = new CollaborateurService();
	
	// constante pour instancier DepartementService et acceder aux methodes
	public static DepartementService DEPT_SERVICE = new DepartementService();
	
	public static VisiteWebService VISITE_SERVICE = new VisiteWebService();
	
	public static ActiviteService ACTIVITES_SERVICE = new ActiviteService();
}
