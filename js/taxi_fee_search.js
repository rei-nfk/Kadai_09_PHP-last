var pref; //出発地点の県名
var distance; //走行距離
var geocoder;
//初期画面の設定（＋ボタンクリック時のイベント着火も含む）
function initMap() {
    //ルート探索の準備
    //①ルート探索のためのDirectionsServiceオブジェクトを作る
    //②ルート表示のためのDirectionsRendererオブジェクトを作る
    //③出発地点を入れるためのオブジェクト（あまり分かってない）
    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
//            var geocoder = new google.maps.Geocoder();
    geocoder = new google.maps.Geocoder();
    //地図を描画する。ベージを読み込んだ時に発火するイベント。初期値。
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 14,
        center: {
            lat: 35.685175,
            lng: 139.7528
        }
    });
    directionsDisplay.setMap(map);
    //イベント着火の準備
    //後で定義した「calculateAndDisplayRoute」に、上で定義したオプジェクト（ルート用、描画用）を渡す
    var onChangeHandler = function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay);
//                geocodeAddress(geocoder);
    };
    //ここで、ボタンが押されたらイベントに着火
    document.getElementById('button').addEventListener('click', onChangeHandler);
}
//地図に、ルートを描画
function calculateAndDisplayRoute(directionsService, directionsDisplay) {
    directionsService.route({
        origin: document.getElementById('start').value,
        destination: document.getElementById('end').value,
        travelMode: 'DRIVING'
    }, function(response, status) {
        if (status === 'OK') {
            //地図を描画
            directionsDisplay.setDirections(response);
            //移動距離を取得
            distance = response.routes[0].legs[0].distance.value / 1000;
            var distance_show = String(distance).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' );
            $("#distanceText").text("走行距離は" + distance_show + "kmです");
            geocodeAddress(geocoder);
        } else {
            window.alert('Directions request failed due to ' + status);
        }
    });
}
//出発地点の都道府県名の取得（タクシー料金は都道府県別に違う・・・何てこった）
function geocodeAddress(geocoder) {
    var address = document.getElementById('start').value;
    geocoder.geocode({
        'address': address
    }, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
            var geoCnt = results[0].address_components.length;
            for(var i = 0; i < geoCnt; i++){
                if(results[0].address_components[i].types[0] === "administrative_area_level_1"){
                    pref = results[0].address_components[i].long_name;
                }
            }
//phpに連携
    $.ajax({
        type: 'POST',
        url: 'taxi_fee_search.php',
        cache: false,
        datatype: "json",
        data: {
            pref: pref,
            distance: distance
        },
        async: false,
        success: function(data) {
            var parseAr = JSON.parse(data);
            total_fee = Number(parseAr[0]["total_fee"]);
            var total_fee_show = String(total_fee).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' );
            $("#feeText").text("料金は" + total_fee_show + "円です");
        },
        complete: function() {
        }
    });
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}

