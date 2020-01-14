package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;

import dev.sgp.entite.*;

/***
 * methode pour lister, filtrer et sauvegarder les collaborateurs
 * @author audrey
 *
 */
public class CollaborateurService {

	List<Collaborateur> listeCollaborateurs = new ArrayList<>();
	
	public List<Collaborateur> listerCollaborateurs() {
		return listeCollaborateurs;
	}

	public Collaborateur infosCollaborateur(String matricule) {

		Collaborateur collabInfos = null;

		for (Collaborateur collab : listeCollaborateurs) {

			if (collab.getMatricule().equals(matricule)) {
				collabInfos = collab;
			}
		}

		return collabInfos;
	}

	public void sauvegarderCollaborateur(Collaborateur collab) {
		listeCollaborateurs.add(collab);
	}

	public List<Collaborateur> filtreNoActif() {
		return listeCollaborateurs.stream().filter(c -> c.isActif() == false).collect(Collectors.toList());
	}

	public List<Collaborateur> filtreDept(String dept) {
		return listeCollaborateurs.stream()
				.filter(c -> (c.getDepartement() != null
						&& c.getDepartement().getId() == Integer.parseInt(dept)))
				.collect(Collectors.toList());
	}

	public List<Collaborateur> filtreMot(String mot) {
		String motBegin = StringUtils.stripAccents(mot).toLowerCase();
		return listeCollaborateurs.stream()
				.filter(c -> (StringUtils.stripAccents(c.getNom()).toLowerCase().startsWith(motBegin)
						|| StringUtils.stripAccents(c.getPrenom()).toLowerCase().startsWith(motBegin)))
				.collect(Collectors.toList());
	}
	
}
