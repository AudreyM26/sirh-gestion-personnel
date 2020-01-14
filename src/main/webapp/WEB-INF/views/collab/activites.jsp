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
	
	<c:set var ="listeVisite" scope ="session" value ="${param.listeVisite}"/>
	<c:forEach items="${listeVisite}" var="visit">
    	<c:out value='${visit.getId()}'/><c:out value='${visit.getChemin()}'/><c:out value='${visit.getTempsExecution()}'/><br/>
   	</c:forEach>
	<main>
        <div class="container mt-3">
            <div class="row mb-2">
                <div class="col-md-8 mt-sm-4 pl-md-0">
                    <h2>Activités depuis le démarrage de l'application</h2>
                </div>
            </div>
        </div>
        <div class="container mt-3 border border-secondary rounded">
            <div class="row bg-secondary text-white">
                <div class="col-5 col-sm-4">Date / Heure</div>
                <div class="col-7 col-sm-8">Libellé</div>
            </div>
            <div class="row bg-light">
                <div class="col-5 col-sm-4">10/10/2017 10:50:52</div>
                <div class="col-7 col-sm-8">Création d'un nouveau collaborateur - matricule : XXXXXX (lien)</div>
            </div>
            <div class="row">
                <div class="col-5 col-sm-4">10/10/2017 10:52:52</div>
                <div class="col-7 col-sm-8">Modification d'un collaborateur - matricule : XXXXXX (lien)</div>
            </div>
        </div>
    </main>
	
</body>
</html>