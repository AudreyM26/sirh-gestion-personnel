<%@ page language="java" pageEncoding="UTF-8" import="dev.sgp.entite.*,java.time.LocalDate,java.time.ZonedDateTime,java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="stylesheet" href="<c:url value='/bootstrap-4.4.1-dist/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/js/fonction.js'/>" ></script>
<title>SGP - Nouveau collaborateur</title>
</head>
<body>
	<%@include file="nav.jsp" %>
	<main>
	<div class="pl-3 pl-sm-5 mt-sm-4 mb-3">
		<h2>Nouveau collaborateur</h2>
	</div>
	
	<c:set var ="collab" scope ="session" value ="${collaborateur}"/>
	
	<div class="justify-content-center align-items-center container pl-md-5">
		<form id="newCollaborateur" action="creer" method="post">
			<div class="form-row">
				<div class="col-4">
					<label for="nom" class="col-form-label">Nom</label>
				</div>
				<div class="col-8">
					<input type="text" class="form-control" id="nom" name="nom" value="<c:out value='${collab.getNom()}'/>" required  >
					<c:if test="${not empty requestScope.erreurNom}">
						<p class="text-danger">Le nom est obligatoire</p>
					</c:if>
				</div>
			</div>
			<div class="form-row pt-2">
				<div class="col-4">
					<label for="prenom" class="col-form-label">Prénom</label>
				</div>
				<div class="col-8">
					<input type="text" class="form-control" id="prenom" name="prenom" value="<c:out value='${collab.getPrenom()}'/>" required>
					<c:if test="${not empty requestScope.erreurPrenom }">
						<p class="text-danger">Le prénom est obligatoire</p>
					</c:if>
				</div>
			</div>
			<div class="form-row pt-2">
				<div class="col-4">
					<label for="date" class="col-form-label">Date de naissance</label>
				</div>
				<div class="col-8">
					<c:set var="valueDate" scope="session" value=""/>
					<c:if test="${collab.getDateDeNaissance() != LocalDate.now()}">
						<c:set var="valueDate" scope="session" value="${collab.getDateDeNaissance().format(DateTimeFormatter.ofPattern('yyyy-MM-dd'))}"/>
					</c:if>
					<input type="date" class="form-control" id="datenaissance" name="datenaissance" value="<c:out value='${valueDate}'/>"  required>
					<c:if test="${not empty requestScope.erreurDate }">
						<p class="text-danger">La date de naissance est obligatoire et vous devez avoir au moins 18 ans</p>
					</c:if>
				</div>
			</div>
			<div class="form-row pt-2">
				<div class="col-4">
					<label for="adresse" class="col-form-label">Adresse</label>
				</div>
				<div class="col-8">
					<textarea class="form-control" id="adresse" name="adresse" rows="3" required ><c:out value='${collab.getAdresse()}'/></textarea>
					<c:if test="${not empty requestScope.erreurAdresse }">
						<p class="text-danger">L' adresse est obligatoire</p>
					</c:if>
				</div>
			</div>
			<div class="form-row pt-2">
				<div class="col-4">
					<label for="numerosecu" class="col-form-label">Numéro de sécurité sociale</label>
				</div>
				<div class="col-8">
					<input type="text" class="form-control" id="numerosecu" name="numerosecu" value="<c:out value='${collab.getNumeroSecuriteSociale()}'/>" required >
					<c:if test="${not empty requestScope.erreurNumero }">
						<p class="text-danger">Le numéro de sécurité sociale est obligatoire et doit contenir 15 chiffres</p>
					</c:if>
				</div>
			</div>
			<div class="form-row pt-2">
				<div class="col-1 offset-10 offset-sm-11 text-right">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#confirmModal" onCLick="ConfirmForm()"  id="creer">Creer</button>
                	<!-- <button type="submit" class="btn btn-success"  id="creer">Creer</button> -->
                </div>
			</div>
		</form>

	</div>
	</main>
	<!-- Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
		aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Création d'un
						collaborateur</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<p>Vous êtes sur le point de créer un nouvel collaborateur</p>
						<div class="container">
							<div class="row">
								<div class="col">Nom</div>
								<div class="col">
									<p class="nameValue"></p>
								</div>
							</div>
							<div class="row">
								<div class="col">Prénom</div>
								<div class="col">
									<p class="firstnameValue"></p>
								</div>
							</div>
							<div class="row">
								<div class="col">Date de naissance</div>
								<div class="col">
									<p class="dateValue"></p>
								</div>
							</div>
							<div class="row">
								<div class="col">Adresse</div>
								<div class="col">
									<p class="adresseValue"></p>
								</div>
							</div>
							<div class="row">
								<div class="col">Numéro de sécurité sociale</div>
								<div class="col">
									<p class="numerosecuValue"></p>
								</div>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Annuler</button>
					<button type="button" id="submit" class="btn btn-primary" onclick="validForm()">Confirmer</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>