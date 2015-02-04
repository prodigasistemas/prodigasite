/*  ::

    :: Theme        : Jets
    :: Theme URI    : http://labs.funcoders.com/html/Jets

    :: File         : map.js
    :: About        : Google map
    :: Version      : 1.4.4
    ::
    :: Find the Latitude and Longitude of your address:
    :: - http://universimmedia.pagesperso-orange.fr/geo/loc.htm
    :: - http://www.findlatitudeandlongitude.com/find-address-from-latitude-and-longitude/
::  */


$(function () {

    var googlemaps = $("#googlemaps");
    if (googlemaps.length) {

        var markers = [{
            html        :   '<h4>Belém:</h4>'+
                            '<address>'+
                                '<div class="row">'+
                                    '<div class="col-xs-4"><b>Endereço:</b></div>'+
                                    '<div class="col-xs-8">Rua Angelo Custodio,<br>728A, Cidade Velha,<br>66020-710, Belém-PA</div>'+
                                '</div>'+
                                '<div class="row">'+
                                    '<div class="col-xs-4"><b>Contato:</b></div>'+
                                    '<div class="col-xs-8">(91) 3038-8821 / (91) 3038-8824</div>'+
                                '</div>'+
                                '<div class="row">'+
                                    '<div class="col-xs-4"><b>Email:</b></div>'+
                                    '<div class="col-xs-8"><a href="mailto:contato@prodigasistemas.com.br">contato@prodigasistemas.com.br</a></div>'+
                                '</div>'+
                            '</address>',
            latitude: -1.4602,
            longitude: -48.4999185
        },{
            html        :   '<h4>São Paulo:</h4>'+
                            '<address>'+
                                '<div class="row">'+
                                    '<div class="col-xs-4"><b>Endereço:</b></div>'+
                                    '<div class="col-xs-8">Rua Cabo Romeu Casa Grande,<br />466, Pq. Novo Mundo,<br />02180-060, São Paulo-SP</div>'+
                                '</div>'+
                                '<div class="row">'+
                                    '<div class="col-xs-4"><b>Contato:</b></div>'+
                                    '<div class="col-xs-8">(91) 3038-8821 / (91) 3038-8824</div>'+
                                '</div>'+
                                '<div class="row">'+
                                    '<div class="col-xs-4"><b>Email:</b></div>'+
                                    '<div class="col-xs-8"><a href="mailto:contato@prodigasistemas.com.br">contato@prodigasistemas.com.br</a></div>'+
                                '</div>'+
                            '</address>',
          latitude: -23.5155903,
          longitude: -46.5657992
        }],
        latitude    = -1.4602,
        longitude   = -48.4999185
        zoom        = 16,
        img         = "/assets/img/pin.png";

        google.maps.event.addDomListener(window, 'load', function() {

            var map = new google.maps.Map(document.getElementById('googlemaps'), {
                zoom    : zoom,
                center  : new google.maps.LatLng(latitude, longitude)
            }),
            infowindow = new google.maps.InfoWindow(),
            marker, i;

            for (i = 0; i < markers.length; i++) {

                marker = new google.maps.Marker({
                    position    : new google.maps.LatLng(markers[i].latitude, markers[i].longitude),
                    map         : map,
                    icon        : img
                });

                google.maps.event.addListener(marker, 'click', (function(marker, i) {
                    return function() {
                        infowindow.setContent(markers[i].html);
                        infowindow.open(map, marker);
                    }
                })(marker, i));

            }

            google.maps.event.addDomListener(window, 'resize', function() {
                google.maps.event.trigger(map, 'resize');
                map.setCenter(new google.maps.LatLng(latitude, longitude));
            });

        });
    }

});
