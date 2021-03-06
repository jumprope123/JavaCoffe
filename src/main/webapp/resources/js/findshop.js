function initAutocomplete(listener) {
    const map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 37.55902624, lng: 126.9749014 },
        zoom: 13,
        mapTypeId: "roadmap",
        zoomControl: false,
        mapTypeControl: false,
        fullscreenControl: false
    });

    var locations = [
        ['서울역', 37.5546788, 126.9706069],
        ['서울특별시청', 37.5668260, 126.9786567],
        ['을지로입구역', 37.5660373, 126.9821930],
        ['덕수궁', 37.5655638, 126.974894],
    ];
    var temp = new Array(19);
    for (let i = 1; i <= 19; i++ ){
        temp[i-1] = new Array(
            document.getElementById('lsname' + i).innerText,
            parseFloat(document.getElementById('llat' + i).innerText),
            parseFloat(document.getElementById('llng' + i).innerText)
        );
    };
    locations = locations.concat(temp);

    let infoWindow;
    var infowindow = new google.maps.InfoWindow();
    const locationButton = document.createElement("button");
    locationButton.textContent = "내 위치";
    locationButton.classList.add("custom-map-control-button");

    map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
    locationButton.addEventListener("click", () => {
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    const pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude,
                    };
                    infowindow.setPosition(pos);
                    infowindow.setContent("현재 내 위치");
                    infowindow.open(map);
                    map.setCenter(pos);
                },
                () => {
                    handleLocationError(true, infoWindow, map.getCenter());
                }
            );
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }
    });

    var marker, i;

    for (i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            icon: '../img/find/jmarker.png',
            map: map
        });
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            icon: '../img/find/jmarker.png',
            map: map
        });

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                map.setCenter(marker.getPosition())
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
                marker.setIcon('../img/find/jmarker1.png');
                smoothZoom(map, 15, map.getZoom())
                let a = 19;
                for (let k=1; k <= 19; k++) {
                    let street = 0;
                    street = getDistanceFromLatLonInKm(locations[i][1],locations[i][2],locations[k][1],locations[k][2]);
                    let x = document.getElementById("c_m_street"+k);
                    x.innerText= parseInt(street)+"Km";
                    // 20km 이상되는거 안보여주기
                    if (street > 20){
                        a--;
                        document.getElementById("f_info_list"+k).style.display = 'none';
                        document.getElementById("results_number").innerText = a;
                    } else {
                        document.getElementById("f_info_list"+k).style.display = 'block';
                    }
                }
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
        Searchclick();
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

    $( '#btnSearch' ).click( function Searchclick() {
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
        if(confirm("검색 문구를 지우겠습니까?")){
            /*Clear all input type="text" box*/
            $('#locationForm input[type="text"]').val('');
            /*Clear textarea using id */
            $('#pac-input').val('');
        }
    });
});


for (let s = 1 ; s <= 19; s++) {
    let src = "";
    $("#shop-item"+s).click(function () {
        src = document.getElementById('llat' + s).innerText;
        src += "," + document.getElementById('llng' + s).innerText;
        console.log(src);
        if (confirm("구글 경로 찾기로 이동하시겠습니까?")) {
            location.href = "https://www.google.co.kr/maps/dir//" + src;
        }
    });
}

// 내 위치 에러
function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(
        browserHasGeolocation
            ? "에러: 지오로케이션 서비스 실패"
            : "에러: 브라우저에서 이 기능을 지원하지 않습니다."
    );
    infoWindow.open(map);
}


function smoothZoom (map, max, cnt) {
    if (cnt >= max) {
        return;
    }
    else {
        z = google.maps.event.addListener(map, 'zoom_changed', function(event){
            google.maps.event.removeListener(z);
            smoothZoom(map, max, cnt + 1);
        });
        setTimeout(function(){map.setZoom(cnt)}, 80); // 80ms is what I found to work well on my system -- it might not work well on all systems
    }
}

function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
    function deg2rad(deg) {
        return deg * (Math.PI / 180) // 평면 거리 뽑기
    }
        var R = 6371; // 지구의 둘레 km
        var dLat = deg2rad(lat2-lat1); // 두 위도 차이
        var dLon = deg2rad(lng2-lng1); // 두 경도 차이
        var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        var d = R * c;
        return d;

    }
