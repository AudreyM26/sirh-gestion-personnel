<!-- TODO -->
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/bootstrap-4.4.1-dist/js/bootstrap.js"></script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="#"><img src="/sgp/images/logo.png"
		alt="Logo" /></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		<div class="navbar-nav">
			<a class="nav-item nav-link text-white  btn-outline-info" href="lister">Collaborateurs</a> 
			<a class="nav-item nav-link text-white  btn-outline-info" href="stats">Statistiques</a>
			<a class="nav-item nav-link text-white  btn-outline-info" href="activites">Activités</a>
			<!--<a class="nav-item nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Activités</a>-->
		</div>
	</div>
</nav>