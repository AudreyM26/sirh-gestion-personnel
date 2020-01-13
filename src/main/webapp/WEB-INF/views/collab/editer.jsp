<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" import="dev.sgp.entite.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="<c:url value='/bootstrap-4.4.1-dist/css/bootstrap.css'/>">
<title>SGP - Nouveau collaborateur</title>
</head>
<body>
	<%@include file="nav.jsp" %>
	
	<c:set var ="collaborateurInfos" scope ="session" value ="${param.collaborateurInfos}"/>
	<c:set var ="listeDepartements" scope ="session" value ="${param.listeDepartements}"/>
	
	<main>
	<div class="justify-content-center align-items-center container mt-3">
		<div class="media">
			<img class="align-self-md-center mr-3" src="<c:url value='${collaborateurInfos.getPhoto()}' />"
				alt="image" width="20%" />
			<div class="media-body">
				<form id="collaborateur" action="editer" method="post">
					<div class="form-row">
						<div class="col-md-8 text-left">
							<h3 class="mt-0"><c:out value='${collaborateurInfos.getNom().toUpperCase()}'/> <c:out value='${collaborateurInfos.getPrenom()}'/> - <c:out value='${collaborateurInfos.getMatricule()}'/></h3>
							<input type="hidden" id="matricule" name="matricule" value="<c:out value='${collaborateurInfos.getMatricule()}'/>">
						</div>
						<div class="col-md-4 align-bottom pl-5">
							<input type="checkbox" class="form-check-input" id="actif" name="actif" value="false" <c:if test="${collaborateurInfos.isActif() == false}">checked="checked"</c:if> />
							<label class="form-check-label" for="desactiver">Désactiver</label>
						</div>
					</div>
					<div class="accordion" id="accordionIdentite">
						<div class="card">
							<div class="card-header bg-info" id="headingIdentite">
								<h5 class="mb-0 ">
									<button
										class="btn collapsed btn-lg btn-block text-left text-white"
										type="button" data-toggle="collapse"
										data-target="#collapseIdentite" aria-expanded="true"
										aria-controls="collapseIdentite">Identité</button>
								</h5>
							</div>
							<div id="collapseIdentite" class="collapse show"
								aria-labelledby="headingIdentite"
								data-parent="#accordionIdentite">
								<div class="card-body text-md-right">
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="civilite" class="col-form-label">Civilité</label>
										</div>
										<div class="col-md-8">
											<select name="civilite" id="civilite" class="form-control" >
												<option value="">-</option>
												<option value="mme" <c:if test="${collaborateurInfos.getCivilite()!= null && collaborateurInfos.getCivilite().getAbreviation() == 'Madame'}"><c:out value='selected="selected"' /></c:if>>Madame</option>
												<option value="mr" <c:if test="${collaborateurInfos.getCivilite()!= null && collaborateurInfos.getCivilite().getAbreviation() == 'Monsieur'}"><c:out value='selected="selected"' /></c:if>>Monsieur</option>
											</select>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="nom" class="col-form-label">Nom</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="nom" id="nom" value="<c:out value='${collaborateurInfos.getNom()}'/>" disabled="disabled"/>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="prenom" class="col-form-label">Prénom</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="prenom" id="prenom" value="<c:out value='${collaborateurInfos.getPrenom()}'/>" disabled="disabled"/>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="date" class="col-form-label">Date de naissance</label>
										</div>
										<div class="col-md-8">
											<input type="date" class="form-control" id="date" id="date" value="<c:out value='${collaborateurInfos.getDateDeNaissance()}'/>" disabled="disabled"/>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="adresse" class="col-form-label">Adresse</label>
										</div>
										<div class="col-md-8">
											<textarea class="form-control" id="adresse" name="adresse" rows="3" ><c:out value='${collaborateurInfos.getAdresse()}'/></textarea>
											
											<c:if test="${not empty requestScope.erreurAdresse }">
												<p class="text-danger">L' adresse est obligatoire</p>
											</c:if>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="numerosecu" class="col-form-label">Numéro de sécurité sociale</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="numerosecu" name="numerosecu" value="<c:out value='${collaborateurInfos.getNumeroSecuriteSociale()}'/>" disabled="disabled"/>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="tel" class="col-form-label">Téléphone</label>
										</div>
										<div class="col-md-8">
											<input type="tel" class="form-control" id="tel" name="tel" value="<c:out value='${collaborateurInfos.getTelephone()}'/>" />
											
											<c:if test="${not empty requestScope.erreurTelephone }">
												<p class="text-danger">Le numéro de téléphone doit contenir 10 chiffres</p>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header bg-info" id="headingPoste">
								<h5 class="mb-0">
									<button
										class="btn collapsed btn-lg btn-block text-left text-white"
										type="button" data-toggle="collapse"
										data-target="#collapsePoste" aria-expanded="false"
										aria-controls="collapsePoste">Poste</button>
								</h5>
							</div>
							<div id="collapsePoste" class="collapse"
								aria-labelledby="headingPoste" data-parent="#accordionIdentite">
								<div class="card-body text-md-right">
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="dept" class="col-form-label">Département</label>
										</div>
										<div class="col-md-8">
											<c:set var= "deptCollab" scope="session" value=""/>
											
											<select name="dept" id="dept" class="form-control">
						                        <option value="">Tous</option>
						                        <c:forEach items="${listeDepartements}" var="dept">
						                        	<c:set var= "valueDept" scope="session" value="${dept.getId()},${dept.getNom()}"/>
						                        	
						                        	<c:if test="${collaborateurInfos.getDepartement() != null}">
                                                		<c:set var="deptCollab" scope="session" value="${collaborateurInfos.getDepartement().getId()},${collaborateurInfos.getDepartement().getNom()}" />
                                               		</c:if>
                                                
						                       		<option value="<c:out value='${valueDept}'/>" <c:if test="${deptCollab == valueDept}"><c:out value='selected="selected"' /></c:if> ><c:out value='${dept.getNom()}'/></option>
						                       	</c:forEach>
						                    </select>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="poste" class="col-form-label">Nom</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="poste" name="poste" value="<c:out value='${collaborateurInfos.getIntitulePoste()}'/>" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header bg-info" id="headingBanque">
								<h5 class="mb-0">
									<button
										class="btn collapsed btn-lg btn-block text-left text-white"
										type="button" data-toggle="collapse"
										data-target="#collapseBanque" aria-expanded="false"
										aria-controls="collapseBanque">Coordonnées bancaires
									</button>
								</h5>
							</div>
							<div id="collapseBanque" class="collapse"
								aria-labelledby="headingBanque" data-parent="#accordionIdentite">
								<div class="card-body text-md-right">
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="iban" class="col-form-label">IBAN</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="iban" name="iban" value="<c:out value='${collaborateurInfos.getIban()}'/>" />
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="bic" class="col-form-label">BIC</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="bic" name="bic" value="<c:out value='${collaborateurInfos.getBic()}'/>" />
											Banque : <c:out value='${collaborateurInfos.getBanque()}'/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-row pt-2">
						<div class="col-1 offset-8 offset-sm-9 offset-sm-10">
							<button type="submit" class="btn btn-success" id="modify">Sauvegarder</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>

</body>
</html>