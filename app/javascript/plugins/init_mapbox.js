import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2 });
};




const initMapbox = () => {
  if (mapElement) {
    console.log(mapElement);
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    console.log(mapboxgl.accessToken);
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
      });
    const markers = JSON.parse(mapElement.dataset.markers);
  console.log(markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
    });
    fitMapToMarkers(map, markers);

  }

};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};




export { initMapbox };
