<!DOCTYPE html>
<html>
<head>
<!-- blablabla -->
	<meta charset="UTF-8">
	<title>HelPark</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
    <script type="text/javascript">
// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.

function initialize() {

  var markers = [];
  var map = new google.maps.Map(document.getElementById('main'), {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(46.246586,6.0459022),
      new google.maps.LatLng(46.103786,6.1331022));
  map.fitBounds(defaultBounds);
  
  
  var georssLayer = new google.maps.KmlLayer({
    url: 'http://helpark.alwaysdata.net/PlacesHandicapeesGeneve.kmz'
  });
  georssLayer.setMap(map);

  // Create the search box and link it to the UI element.
  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));

  // [START region_getplaces]
  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    // For each place, get the icon, place name, and location.
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

      // Create a marker for each place.
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location,
		zoom: 10
      });

      markers.push(marker);

      bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });
  // [END region_getplaces]

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
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
				<h1 id="logo"> <a href="index.html">HelPark</a> </h1>
				<div id="navigation">
					<ul>
						<li class="selected">
							<a href="index.html">Home</a>
						</li>
					<!--	<li>
							<a href="about.html">About</a>
						</li>
						<li>
							<a href="contact.html">Contact</a>
						</li>-->
					</ul>
				</div>
			</div>
		</div>
		<div id="contents">
			<div id="adbox">
				<div>
					<img src="images/helpark_index.png" alt="Img" height="390" width="632">
					<h1>HelPark</h1>
					<h4>Bla bla </h4>
					<p>
						Bla bla bla
					</p>
				</div>
			</div>
			<input id="pac-input" class="controls" type="text" placeholder="Search Box">
			<div id="main">
			
			<!--<iframe src="https://www.google.com/maps/d/edit?mid=zZCd5759T4us.k86dyeTJXBDY" width="100%" height="480" frameborder="0" style="border:0"></iframe>-->
			<!--AIzaSyDAfbS9UTtZBRUY9tW_EvhZD4VD6AvOB0A-->
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