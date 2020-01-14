<%@ page language="java" pageEncoding="UTF-8" import="dev.sgp.entite.*,java.util.List,java.util.stream.Collectors,org.apache.commons.lang3.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet" href="<c:url value='/bootstrap-4.4.1-dist/css/bootstrap.css'/>">
<title>SGP - Statistiques</title>
</head>
<body>
	<%@include file="nav.jsp" %>

	<c:set var ="listeVisite" scope ="session" value =""/>

	<c:if test="${not empty requestScope.listeVisite}">
		<c:set var ="listeVisite" scope ="session" value ="${param.listeVisite}"/>
	</c:if>
	<main>
        <div class="container mt-3">
            <div class="row mb-2">
                <div class="col-md-4 ml-md-5">
                    <h2>Statistiques</h2>
                </div>
                <div class="col-md-2 offset-md-3 offset-xl-5">
                    <input type="button" class="btn btn-outline-secondary" onclick="window.location.href='creer'"
                        value="Ajouter un nouveau collaborateur">
                </div>
            </div>
        </div>
        <div class="container mt-3 border border-secondary rounded">
            <div class="row bg-secondary text-white">
                <div class="col-5 col-sm-4">Chemin</div>
                <div class="col-2 col-sm-2">Nombre de visites</div>
                <div class="col-1 col-sm-2">Min (ms)</div>
                <div class="col-1 col-sm-2">Max (ms)</div>
                <div class="col-1 col-sm-2">Moyenne (ms)</div>
            </div>
            <c:set var="cpte" value="0" />
            <c:forEach items="${listeVisite}" var="visit">
            	<c:set var="infos" value="${fn:split(visit, ',')}" />
            	<c:set var="color" value="" />
            	
            	<c:if test="${cpte%2 == 0 }">
            		<c:set var="color" value="bg-light" />
            	</c:if>
	            <div class="row <c:out value='${color}'/>">
	                <div class="col-5 col-sm-4"><c:out value='${infos[0]}'/></div>
	                <div class="col-2 col-sm-2"><c:out value='${infos[1]}'/></div>
	                <div class="col-1 col-sm-2"><c:out value='${infos[2]}'/></div>
	                <div class="col-1 col-sm-2"><c:out value='${infos[3]}'/></div>
	                <div class="col-1 col-sm-2"><c:out value='${infos[4]}'/></div>
	            </div>
	            <c:set var="cpte" value="${cpte+1}" />
            </c:forEach>
        </div>
    </main>
	
</body>
</html>