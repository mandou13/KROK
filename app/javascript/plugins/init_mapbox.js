import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = (longitude, latitude) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxapikey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/louisgat/ck7erw8v006591imb3p9lp9h4',
    zoom: 15,
    center: [longitude, latitude]
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.backgroundRepeat = "repeat-x"
      element.style.width = '40px';
      element.style.height = '40px';
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 25 });
};

const initMapbox = () => {
  if (mapElement) {
    navigator.geolocation.getCurrentPosition((data) => {
      const map = buildMap(data.coords.longitude, data.coords.latitude);
      if (mapElement.dataset.markers) {
        const markers = JSON.parse(mapElement.dataset.markers);
        addMarkersToMap(map, markers);
        fitMapToMarkers(map, markers);
      }
  });

  }
};

export { initMapbox };
