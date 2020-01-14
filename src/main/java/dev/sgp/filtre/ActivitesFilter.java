package dev.sgp.filtre;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import dev.sgp.service.ActiviteService;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;


/***
 * filtrer pour remplir liste activites (creer et editer)
 * @author audrey
 *
 */

@WebFilter({"/collaborateurs/creer", "/collaborateurs/editer"})
public class ActivitesFilter implements Filter{

	public ActiviteService activiteService = Constantes.ACTIVITES_SERVICE;
	public CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpServletRequest httpRequest = (HttpServletRequest) req;  
		if(httpRequest.getMethod().equalsIgnoreCase("POST")){
			String matricule= "";
			if(httpRequest.getParameter("matricule") != null){
				matricule=httpRequest.getParameter("matricule").toString();
			}else{
				matricule = "M"+(collabService.listerCollaborateurs().size()+1);
			}
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			String dateHeure =LocalDateTime.now().format(formatter);
			
			String path = ((HttpServletRequest) req ).getRequestURI();
			String message ="";
			//String matricule=httpRequest.getParameter("matricule").toString();
			if(path.substring(path.lastIndexOf("/")+1).equals("creer")){
				message = "Création d'un nouveau collaborateur";
			}else{
				message = "Modification d'un collaborateur";
			}
			
			activiteService.sauvegarderActivite(dateHeure+","+message+","+matricule);
	    }
		
		
		
		
		chain.doFilter(req, resp);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
