package dev.sgp.entite;
public enum Civilite {  // dans le fichier Civilite.java  
  
    mme("Madame"),mr("Monsieur"),nouv("");  
      
     private String abreviation ;  
      
     private Civilite(String abreviation) {  
         this.abreviation = abreviation ;  
    }  
      
     public String getAbreviation() {  
         return  this.abreviation ;  
    }  
}