<%@ page language="java" pageEncoding="UTF-8" import="dev.sgp.entite.*,java.util.List,java.util.stream.Collectors,org.apache.commons.lang3.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet" href="<c:url value='/bootstrap-4.4.1-dist/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/js/fonction.js'/>" ></script>

<title>SGP - App</title>
</head>
<body>
	<%@include file="nav.jsp" %>
	
	<c:set var ="listeCollaborateurs" scope ="session" value ="${param.listeCollaborateurs}"/>
	<c:set var ="listeDepartements" scope ="session" value ="${param.listeDepartements}"/>
	
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
                    <label for="mot">Rechercher un nom ou un prénom qui commence par :</label>
                </div>
                <c:set var ="motSearch" scope ="session" value =""/>
               	<c:if test="${not empty param.mot}">
               		<c:set var ="motSearch" scope ="session" value ="${param.mot}"/>
               	</c:if>

                <div class="col-md-3"><input type="text" id="mot" name="mot" class="form-control" value="<c:out value='${motSearch}'/>" /></div>
                <div class="col-md-2 pt-1 pt-sm-0"><input type="button" class="form-control btn-outline-secondary" value="Rechercher" onclick="Rechercher()"></div>
                <div class="col-md-3 pl-5 pl-md-4"><input type="checkbox" id="checkcollab" name="checkcollab"
                        class="form-check-input" onchange="Rechercher()" <c:if test="${not empty param.actif}">checked="checked"</c:if> ><label for="checkcollab">Voir les collaborateurs désactivés</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 text-md-right"><label for="dept">Filtrer par département :</label></div>
                <div class="col-md-3">
                    <select name="dept" id="dept" class="form-control" onchange="Rechercher()">
                        <option value="">Tous</option>             
                       	<c:forEach items="${listeDepartements}" var="dept">
                       		<option value="<c:out value='${dept.getId()}'/>" <c:if test="${not empty param.dept && param.dept == dept.getId()}"><c:out value='selected="selected"' /></c:if> ><c:out value='${dept.getNom()}'/></option>
                       	</c:forEach>
                    </select>
                </div>
            </div></form>
        </div>
        
        <div class="container-fluid mt-3">
            <div class="row  mt-3 mb-5">
            	<c:forEach items="${listeCollaborateurs}" var="collab">
            	<div class="col-md-4 col-sm-12 pt-3">
                    <div class="card">
                        <div class="card-header bg-info text-white">
                            <h5><c:out value='${collab.getNom()}'/> <c:out value='${collab.getPrenom()}'/></h5>
                        </div>
                        <div class="card-body p-0">
	                        <div class="container card-text pt-3">
	                            <div class="row"> 
	                                <div class="col-12 col-xl-3 p-0"><img src="<c:url value='${collab.getPhoto()}' />" alt="Logo" />
	                                </div>
	                                <div class="col-12 col-xl-9 ">
	                                    <div class="row">
	                                        <div class="col-5">Fonction</div>
	                                        <c:set var="intitule" scope="session" value="" />
	                                        <c:if test="${collab.getIntitulePoste() != null}">
	                                        	<c:set var="intitule" scope="session" value="${collab.getIntitulePoste()}" />
	                                        </c:if>
	                                        <div class="col-7"><c:out value='${intitule}'/></div>
	                                    </div>
	                                    <div class="row">
	                                    
	                                        <div class="col-5">Département</div>
	                                       	<c:set var="deptNom" scope="session" value="" />
	                                        <c:if test="${collab.getDepartement() != null}">
	                                        	<c:set var="deptNom" scope="session" value="${collab.getDepartement().getNom()}" />
	                                        </c:if>
	                                        <div class="col-7"><c:out value='${deptNom}'/></div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-5">Email</div>
	                                        <div class="col-7"><c:out value='${collab.getEmailPro()}'/></div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-5">Téléphone</div>
	                                        <div class="col-7"><c:out value='${collab.getTelephone()}'/></div>
	                                    </div>
	
	                                </div>
	
	                            </div>
	                        </div>
	                        <div class="text-right pr-2"><a href="editer?matricule=<c:out value='${collab.getMatricule()}'/>" class="btn btn-info">Editer</a></div>
                        </div>
                    </div>
                </div>
            
            	</c:forEach>
            </div>
			
		</div>
	</main>
	
	<!-- <a href="lister?init">init liste</a>-->
</body>
</html>