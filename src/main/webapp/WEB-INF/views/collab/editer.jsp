<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap-4.4.1-dist/css/bootstrap.css">


<title>SGP - Nouveau collaborateur</title>
</head>
<body>
	<%@include file="nav.jsp" %>
	<main>
	<div class="justify-content-center align-items-center container mt-3">
		<div class="media">
			<img class="align-self-md-center mr-3" src="/sgp/images/portrait.png"
				alt="image" width="20%" />
			<div class="media-body">
				<form id="collaborateur">
					<div class="form-row">
						<div class="col-md-8 text-left">
							<h3 class="mt-0">NOM Prénom - Matricule</h3>
						</div>
						<div class="col-md-4 align-bottom pl-5">
							<input type="checkbox" class="form-check-input" id="desactiver"
								value="Désactiver"><label class="form-check-label"
								for="desactiver">Désactiver</label>
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
											<select name="civilite" id="civilite" class="form-control" required>
												<option value="">-</option>
												<option value="mme" <% if (collab.getCivilite().getAbreviation().equals("Madame")) { %> selected="selected" <% } %>>Madame</option>
												<option value="mr" <% if (collab.getCivilite().getAbreviation().equals("Monsieur")) { %> selected="selected" <% } %>>Monsieur</option>
											</select>
											<%
												if(request.getAttribute("erreurCivilite") != null){
											%>
												<p class="text-danger">La civilité est obligatoire</p>
											<% 
												}
											%>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="nom" class="col-form-label">Nom</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="nom" value=""
												required>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="prenom" class="col-form-label">Prénom</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="prenom" value=""
												required>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="date" class="col-form-label">Date de naissance</label>
										</div>
										<div class="col-md-8">
											<input type="date" class="form-control" id="date" value=""
												required>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="adresse" class="col-form-label">Adresse</label>
										</div>
										<div class="col-md-8">
											<textarea class="form-control" id="adresse" rows="3" required></textarea>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="numerosecu" class="col-form-label">Numéro de sécurité sociale</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="numerosecu" value="" required>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="tel" class="col-form-label">Téléphone</label>
										</div>
										<div class="col-md-8">
											<input type="tel" class="form-control" id="tel" name="tel" value="<%= collab.getTelephone() %>" >
											<%
												if(request.getAttribute("erreurTelephone") != null){
											%>
												<p class="text-danger">Le numéro de téléphone doit contenir 10 chiffres</p>
											<% 
												}
											%>
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
											<select name="dept" id="dept" class="form-control">
												<option value="tous">Tous</option>
												<option value="compta">Comptabilité</option>
												<option value="rh">Ressources humaines</option>
												<option value="it">Informatique</option>
											</select>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="dept_nom" class="col-form-label">Nom</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="dept_nom"
												value="" required>
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
											<input type="text" class="form-control" id="iban" value=""
												required>
										</div>
									</div>
									<div class="row pt-2">
										<div class="col-md-4">
											<label for="bic" class="col-form-label">BIC</label>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control" id="bic" value=""
												required>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-row pt-2">
						<div class="col-1 offset-8 offset-sm-9 offset-sm-10">
							<button type="button" class="btn btn-success" id="modify">Sauvegarder</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>

</body>
</html>