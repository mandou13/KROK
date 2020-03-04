import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');
const buildMap = (longitude, latitude) => {

  mapboxgl.accessToken = 'pk.eyJ1IjoibG91aXNnYXQiLCJhIjoiY2s3ZGdwZjhmMDljNTNpbndmMzF1aDU5YiJ9.kQg6aiNLAWiWfu4mYa7M9w';
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    zoom: 13,
    center: [longitude, latitude]
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      const map = buildMap(data.coords.longitude, data.coords.latitude);
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
  });

  }
};

export { initMapbox };
