package dev.sgp.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/***
 * initialiser une map avec nom de la banque selon le bic
 * @author audrey
 *
 */

public class BanqueService {

	public static Map<String, String> bicBanque;
	
	static {
		bicBanque = new HashMap<>();
		bicBanque.put("BIC", "BANQUE");
		bicBanque.put("AGRIFRPP", "CREDIT AGRICOLE");
		bicBanque.put("BNPAFRPP", "BNP PARIBAS");
		bicBanque.put("BOUSFRPP", "BOURSORAMA");
		bicBanque.put("PSSTFRPP", "LA BANQUE POSTALE");
		
		bicBanque.put("CCFRFRPP", "HSBC FRANCE");
		bicBanque.put("CMCIFR21", "CREDIT MUTUEL - CIC BANQUES");
		bicBanque.put("SMCTFR2A", "STE MARSEILLAISE DE CREDIT");
		bicBanque.put("SOGEFRPP", "STE GENERALE");
		

	}
	
	
	public static String banqueNom (String bic){
		
		String banque = "";
		
		Set<String> keySet = bicBanque.keySet();
		
		for(String key : keySet){
	
			if(key.equals(bic.toUpperCase()) ){
				banque = bicBanque.get(key);
			}
			
		}
		
		return banque;
	}
}
