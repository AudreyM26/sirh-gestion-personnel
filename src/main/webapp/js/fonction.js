/**
 * Fonction rechercher sur page lister
 */

function Rechercher() {

	document.getElementById("rechercherCollaborateurs").submit();
	
	
}

/**
 * Fonction afficher modal sur page creer
 */


function ConfirmForm() {
	var oObjet = document.getElementById("confirmModal");

	oObjet.querySelector(".nameValue").innerHTML = $("#nom").val();
	oObjet.querySelector(".firstnameValue").innerHTML = $("#prenom").val();
	oObjet.querySelector(".dateValue").innerHTML = $("#datenaissance").val();
	oObjet.querySelector(".adresseValue").innerHTML = $("#adresse").val();
	oObjet.querySelector(".numerosecuValue").innerHTML = $("#numerosecu").val();

}

/**
 * Fonction valider formulaire via la modal sur page creer
 */

function validForm(){
	var form = window.parent.document.getElementById("newCollaborateur");
	form.submit();
};


