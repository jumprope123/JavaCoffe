   function initAutocomplete(listener) {
    const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.55902624, lng: 126.9749014 },
    zoom: 13,
    mapTypeId: "roadmap",
});

    var locations = [
    ['서울역', 37.5546788, 126.9706069],
    ['서울특별시청', 37.5668260, 126.9786567],
    ['을지로입구역', 37.5660373, 126.9821930],
    ['덕수궁', 37.5655638, 126.974894],
    ];

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {
    marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        icon: '../img/find/jmarker.png',
        map: map
});

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
    infowindow.setContent(locations[i][0]);
    infowindow.open(map, marker);
    map.setCenter(marker);
    map.setZoom(15);
    marker.setIcon('../img/find/jmarker1.png');
    setTimeout(function() {
    marker.setIcon('../img/find/jmarker.png');
}, 3000);
}
})(marker, i));
}


    // Create the search box and link it to the UI element.
    const input = document.getElementById("pac-input");
    const searchBox = new google.maps.places.SearchBox(input);
    // Bias the SearchBox results towards current map's viewport.
    map.addListener("bounds_changed", () => {
    searchBox.setBounds(map.getBounds());
});
    let markers = [];
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener("places_changed", () => {
    const places = searchBox.getPlaces();

    if (places.length == 0) {
    return;
}
    // Clear out the old markers.
    markers.forEach((marker) => {
    marker.setMap(null);
});
    markers = [];
    // For each place, get the icon, name and location.
    const bounds = new google.maps.LatLngBounds();
    places.forEach((place) => {
    if (!place.geometry || !place.geometry.location) {
    console.log("Returned place contains no geometry");
    return;
}
    const icon = {
    url: place.icon,
    size: new google.maps.Size(71, 71),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(17, 34),
    scaledSize: new google.maps.Size(25, 25),
};
    // Create a marker for each place.
    markers.push(
    new google.maps.Marker({
    map,
    icon,
    title: place.name,
    position: place.geometry.location,
})
    );

    if (place.geometry.viewport) {
    // Only geocodes have viewport.
    bounds.union(place.geometry.viewport);
} else {
    bounds.extend(place.geometry.location);
}
});
    map.fitBounds(bounds);

});
}
    $(document).ready(function() {
    $("#map").hide();
    var menu_flag = true;

    $( '#btnSearch' ).click( function() {
    $('#video_area, #background_video,  .map_title').fadeOut();
    $('#map').fadeIn(2000);

    if (menu_flag) {
    $(".form_search").animate(
{width: '-=40%'}, "slow");
    $("#adress_input_box").animate(
{left: '-=400px', top: '-=250px'}, "slow");
    $("#btnSearch").hide();
    menu_flag = false;
}
    $('#results').fadeIn(2000);


} );
    $('.cancel-btn').click(function(){
    if(confirm("Want to clear?")){
    /*Clear all input type="text" box*/
    $('#locationForm input[type="text"]').val('');
    /*Clear textarea using id */
    $('#pac-input').val('');
}
});
});
