package dev.sgp.entite;


/***
 * classe Departement avec constructeur
 * @author audrey
 *
 */
public class Departement {

	Integer Id;
	String nom;
	
	public Departement(Integer id, String nom) {
		super();
		Id = id;
		this.nom = nom;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return Id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		Id = id;
	}

	/**
	 * @return the nom
	 */
	public String getNom() {
		return nom;
	}

	/**
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	
}
