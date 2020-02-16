<%@ page language="java" pageEncoding="UTF-8" import="dev.sgp.entite.*,java.util.List,java.util.stream.Collectors,org.apache.commons.lang3.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	<c:set var ="listeActivites" scope ="session" value =""/>

	<c:if test="${not empty requestScope.listeActivites}">
		<c:set var ="listeActivites" scope ="session" value ="${param.listeActivites}"/>
	</c:if>
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
            <c:forEach items="${listeActivites}" var="act">
            	<c:set var="infos" value="${fn:split(act, ',')}" />
            	<c:set var="color" value="" />
            	
            	<c:if test="${cpte%2 == 0 }">
            		<c:set var="color" value="bg-light" />
            	</c:if>
	            <div class="row <c:out value='${color}'/>">
	                <div class="col-5 col-sm-4"><c:out value='${infos[0]}'/></div>
	                <div class="col-7 col-sm-8"><c:out value='${infos[1]}'/> - matricule <a href="editer?matricule=<c:out value='${infos[2]}'/>" ><c:out value='${infos[2]}'/></a></div>
	            </div>
	            <c:set var="cpte" value="${cpte+1}" />
            </c:forEach>
        </div>
    </main>
	
</body>
</html>