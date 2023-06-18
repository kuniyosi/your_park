function initMap(){
    let map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: <%= @park.latitude %>, lng: <%= @post.longitude %> },
    zoom: 15
    });
}