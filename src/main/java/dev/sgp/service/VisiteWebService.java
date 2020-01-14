package dev.sgp.service;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import dev.sgp.entite.VisiteWeb;

/***
 * methodes pour lister et sauvegarder les statistiques (liste remplie dans filtre frequentationFilter)
 * methode pour afficher les infos sur la page statistiques
 * @author audrey
 *
 */

public class VisiteWebService {

	List<VisiteWeb> listerVisiteWebTotal = new ArrayList<>();
	
	
	public List<VisiteWeb> listerVisiteWeb() {
		return listerVisiteWebTotal;
	}
	
	public void sauvegarderVisiteWeb(VisiteWeb visite) {
		listerVisiteWebTotal.add(visite);
	}
	
	public List<String>  listerStats() {
		
		Map<String,List<VisiteWeb>> cheminStats = listerVisiteWebTotal.stream().collect(Collectors.groupingBy(VisiteWeb::getChemin));
		
		List<String> listStats = new ArrayList<>();
		Set<String> keySet = cheminStats.keySet();
		
		for(String key : keySet){
		
			Integer count = listerVisiteWebTotal.stream().filter(v->v.getChemin().equals(key)).collect(Collectors.counting()).intValue();
			VisiteWeb tempsMin = listerVisiteWebTotal.stream().filter(v->v.getChemin().equals(key)).collect(Collectors.minBy(Comparator.comparingLong(VisiteWeb::getTempsExecution))).get();
			VisiteWeb tempsMax = listerVisiteWebTotal.stream().filter(v->v.getChemin().equals(key)).collect(Collectors.maxBy(Comparator.comparingLong(VisiteWeb::getTempsExecution))).get();
			
			NumberFormat format=NumberFormat.getInstance();
			format.setMinimumFractionDigits(2); //nb de chiffres apres la virgule
		
			double moyTemps = listerVisiteWebTotal.stream().filter(v->v.getChemin().equals(key)).collect(Collectors.averagingLong(t->t.getTempsExecution()));
			String moyTempsArrondi = format.format(moyTemps);
			moyTempsArrondi = moyTempsArrondi.replace(",",".");
			String texteStat = key+","+count+","+tempsMin.getTempsExecution()+","+tempsMax.getTempsExecution()+","+moyTempsArrondi;
			listStats.add(texteStat);
		}
		
		return listStats;
	}
	
}
