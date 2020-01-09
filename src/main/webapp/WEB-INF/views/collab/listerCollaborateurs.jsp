<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8" import="dev.sgp.entite.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap-4.4.1-dist/css/bootstrap.css">

<title>SGP - App</title>
</head>
<body>
	<%@include file="nav.jsp" %>
	<%
		List<Collaborateur> listeCollaborateurs = (List<Collaborateur>) request.getAttribute("listeCollaborateurs");
	%>

	<main>
        <div class="container mt-3">
            <div class="row mb-2">
                <div class="col-md-4 mt-sm-4">
                    <h2>Les Collaborateurs</h2>
                </div>
                <div class="col-md-2 offset-md-4 offset-xl-6">
                    <input type="button" class="btn btn-outline-secondary" onclick="window.location.href='creer'"
                        value="Ajouter un nouveau collaborateur">
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-md-5 text-md-right">
                    <labefor="rech">Rechercher un nom ou un prénom qui commence par :</label>
                </div>
                <div class="col-md-2"><input type="text" id="rech" name="rech" class="form-control"></div>
                <div class="col-md-2 pt-1 pt-sm-0"><input type="button" class="form-control btn-outline-secondary" value="Rechercher"></div>
                <div class="col-md-3 pl-5 pl-md-4"><input type="checkbox" id="checkcollab" name="checkcollab"
                        class="form-check-input"> <label for="checkcollab">Voir les collaborateurs désactivés</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 text-md-right"><label for="dept">Filtrer par département :</label></div>
                <div class="col-md-2">
                    <select name="dept" id="dept" class="form-control">
                        <option value="tous">Tous</option>
                        <option value="compta">Comptabilité</option>
                        <option value="rh">Ressources humaines</option>
                        <option value="it">Informatique</option>
                    </select>
                </div>
            </div>
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
                                                <div class="col-7">a aaaaa</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-5">Département</div>
                                                <div class="col-7">34</div>
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