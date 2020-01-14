package dev.sgp.filtre;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;

import dev.sgp.entite.VisiteWeb;
import dev.sgp.service.*;
import dev.sgp.util.Constantes;


public class FrequentationFilter implements Filter {


	// recuperation du service
	public VisiteWebService visiteService = Constantes.VISITE_SERVICE;		
			
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		req.setCharacterEncoding("UTF-8");
		String path = ((HttpServletRequest) req ).getRequestURI();
		
		long before = System.currentTimeMillis();
		chain.doFilter(req, resp);
		long after = System.currentTimeMillis();
		int id = visiteService.listerVisiteWeb().size()+1;
		VisiteWeb visiteWeb = new VisiteWeb(new Integer(id),path,after-before);
		visiteService.sauvegarderVisiteWeb(visiteWeb);
	}

	@Override
	public void destroy() {
		
	}

	
}
