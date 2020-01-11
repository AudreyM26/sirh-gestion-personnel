<%@ page language="java" pageEncoding="UTF-8" import="dev.sgp.entite.*,java.util.List,java.util.stream.Collectors,org.apache.commons.lang3.StringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap-4.4.1-dist/css/bootstrap.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/js/fonction.js"></script>

<title>SGP - App</title>
</head>
<body>
	<%@include file="nav.jsp" %>
	<%
		List<Collaborateur> listeCollaborateurs = (List<Collaborateur>) request.getAttribute("listeCollaborateurs");
		List<Departement> listeDepartements = (List<Departement>) request.getAttribute("listeDepartements");
		
		if(request.getAttribute("actif") != null){
			listeCollaborateurs = listeCollaborateurs.stream().filter(c-> c.isActif() ==false).collect(Collectors.toList());
		}
		
		if(request.getAttribute("mot") != null){
			String motBegin = StringUtils.stripAccents(request.getAttribute("mot").toString()).toLowerCase();
			listeCollaborateurs = listeCollaborateurs.stream().filter(c-> (StringUtils.stripAccents(c.getNom()).toLowerCase().startsWith(motBegin)|| StringUtils.stripAccents(c.getPrenom()).toLowerCase().startsWith(motBegin))).collect(Collectors.toList());
		}
		
		if(request.getAttribute("dept") != null){
			listeCollaborateurs = listeCollaborateurs.stream().filter(c -> (c.getDepartement()!=null && c.getDepartement().getId() == Integer.parseInt(request.getAttribute("dept").toString()))).collect(Collectors.toList());
		}
	%>

	<main>
        <div class="container-fluid mt-3">
            <div class="row mb-2">
                <div class="col-md-4 ml-md-5">
                    <h2>Les Collaborateurs</h2>
                </div>
                <div class="col-md-2 offset-md-3 offset-xl-5">
                    <input type="button" class="btn btn-outline-secondary" onclick="window.location.href='creer'"
                        value="Ajouter un nouveau collaborateur">
                </div>
            </div>
            <form id="rechercherCollaborateurs" method="post" action="lister">
            <div class="row mb-2">
                <div class="col-md-4 text-md-right">
                    <labefor="mot">Rechercher un nom ou un prénom qui commence par :</label>
                </div>
                <%
                	String motSearch ="";
                	if(request.getAttribute("mot") != null){
                		motSearch = request.getAttribute("mot").toString();
                	}
                %>
                <div class="col-md-3"><input type="text" id="mot" name="mot" class="form-control" value="<%=motSearch%>"></div>
                <div class="col-md-2 pt-1 pt-sm-0"><input type="button" class="form-control btn-outline-secondary" value="Rechercher" onclick="Rechercher()"></div>
                <div class="col-md-3 pl-5 pl-md-4"><input type="checkbox" id="checkcollab" name="checkcollab"
                        class="form-check-input" onchange="Rechercher()" <% if(request.getAttribute("actif")!=null ){ %>checked="checked" <%} %>> <label for="checkcollab">Voir les collaborateurs désactivés</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 text-md-right"><label for="dept">Filtrer par département :</label></div>
                <div class="col-md-3">
                    <select name="dept" id="dept" class="form-control" onchange="Rechercher()">
                        <option value="">Tous</option>
                        <% for (Departement dept : listeDepartements) { %>
                        <option value="<%= dept.getId()%>"  <% if(request.getAttribute("dept")!=null && Integer.parseInt(request.getAttribute("dept").toString()) == dept.getId()) { %> selected="selected" <% } %>><%= dept.getNom()%></option>
                        <% } %>
                    </select>
                </div>
            </div></form>
        </div>
        
        <div class="container-fluid mt-3">
            <div class="row  mt-3 mb-5">
            	<% for (Collaborateur collab : listeCollaborateurs) { %>
            	<div class="col-md-4 col-sm-12 pt-3">
                    <div class="card">
                        <div class="card-header bg-info text-white">
                            <h5><%= collab.getNom() %> <%= collab.getPrenom() %></h5>
                        </div>
                        <div class="card-body p-0">
                            <p class="card-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12 col-xl-3 p-0"><img src="<%= request.getContextPath()+collab.getPhoto() %>" alt="Logo" />
                                        </div>
                                        <div class="col-12 col-xl-9 ">
                                            <div class="row">
                                                <div class="col-5">Fonction</div>
                                                <% 
                                                	String intitule ="";
                                                	if(collab.getIntitulePoste() != null){
                                                		intitule = collab.getIntitulePoste();
                                                	}
                                                %>
                                               
                                                <div class="col-7"><%= intitule %></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-5">Département</div>
                                                <% 
                                                	String dept ="";
                                              
                                                	if(collab.getDepartement() != null){
                                                		dept = collab.getDepartement().getNom();
                                                		
                                                	}
                                                %>
                                                <div class="col-7"><%= dept %></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-5">Email</div>
                                                <div class="col-7"><%= collab.getEmailPro() %></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-5">Téléphone</div>
                                                <div class="col-7"><%= collab.getTelephone()%></div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="text-right pr-2"><a href="editer?matricule=<%= collab.getMatricule() %>" class="btn btn-info">Editer</a></div>
                            </p>

                        </div>
                    </div>
                </div>
            
            	<%} %>
            </div>
			
		</div>
	</main>
</body>
</html>