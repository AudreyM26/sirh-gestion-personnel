package dev.sgp.entite;


/***
 * classe VisiteWeb avec constructeur
 * @author audrey
 *
 */

public class VisiteWeb {

	Integer id;
	String chemin;
	long tempsExecution;
	
	public VisiteWeb(Integer id, String chemin, long tempsExecution) {
		super();
		this.id = id;
		this.chemin = chemin;
		this.tempsExecution = tempsExecution;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the chemin
	 */
	public String getChemin() {
		return chemin;
	}

	/**
	 * @param chemin the chemin to set
	 */
	public void setChemin(String chemin) {
		this.chemin = chemin;
	}

	/**
	 * @return the tempsExecution
	 */
	public long getTempsExecution() {
		return tempsExecution;
	}

	/**
	 * @param tempsExecution the tempsExecution to set
	 */
	public void setTempsExecution(long tempsExecution) {
		this.tempsExecution = tempsExecution;
	}
	
	
}
