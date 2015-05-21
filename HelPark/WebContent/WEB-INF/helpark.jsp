<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="ch.unige.idsi2015.afficherHelpark" %> 
<%@page import="ch.unige.idsi2015.afficherAbout" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>HelPark</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
    <script type="text/javascript">

function initialize() {
	
//On crée une nouvelle carte google dans la variable map qu'on affichera dans la div main
  var markers = [];
  var map = new google.maps.Map(document.getElementById('main'), {mapTypeId: google.maps.MapTypeId.ROADMAP});
  
//On configure l'emplacement où notre map pointera au chargement de la page
  var defaultBounds = new google.maps.LatLngBounds(new google.maps.LatLng(46.246586,6.0459022),new google.maps.LatLng(46.103786,6.1331022));
  map.fitBounds(defaultBounds);
  
  //On crée une nouvelle couche kml qu'on remplit en uploadant un fichier kmz hosté sur un serveur externe et on l'affiche
  var placeHandicape = new google.maps.KmlLayer({ url: 'http://helpark.alwaysdata.net/PlacesHandicapeesGeneve.kmz'});
  placeHandicape.setMap(map);

  //On crée notre barre de recherche et on l'affiche sur la map en hautà gauche.
  var input = (document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox((input));

  //Lorsqu'un utilisateur fait une recherche, une liste déroulante des recherches les plus pertinentes appraraît
  //Si l'utilisateur sélectionne un item de cette liste, retrouve les infos de cette dernière et l'affiche
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // Pour chaque place, on charge le marqueur, le nom de l'emplacement et la localisation.
    markers = [];
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      //Crée un marqueur sur l'emplacement de notre recherche
      var marker = new google.maps.Marker({map: map, icon: image, title: place.name, position: place.geometry.location,zoom: 10});
      markers.push(marker);
      bounds.extend(place.geometry.location);
    }
	map.fitBounds(bounds);
  });
  
  
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</head>
<body>
	<div id="page">
		<div id="header" style="background-color:blue;">
			<div class="background">
				<h1 id="logo"> <a href="helpark.jsp">HelPark</a> </h1>
				<div id="navigation">
					<ul>
						<li class="selected">
							<a href="http://localhost:8080/HelPark/helpark">Home</a>
						</li>
						<li>
							<a href="http://localhost:8080/HelPark/afficherAbout">Get our app</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="contents">
			<div id="adbox">
				<div>
					<img src="images/marker_web.png" alt="Img">
					<h1>HelPark</h1>
					<h4>Recherchez une place handicapée dans Genève </h4>
					<p>
						HelPark est un service affichant toutes les places handicapées à travers Genève ainsi qu'un bref descriptif. 
						<br>
						<br>
						Vous désirez vous rendre à un endroit et vous souhaitez savoir au préalable s'il y a une place handicapée à proximité de votre destination ? HelPark est fait pour vous !
					</p>
				</div>
			</div>
			<input id="pac-input" class="controls" type="text" placeholder="Entrez votre destination ici">
			<div id="main">
			</div>
		</div>
		<div id="footer" style="background-color:blue;">
			<div class="background">
				<div class="body">
					<p id="footnote">
						© 2015. Tous droits reservés.
					</p>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>