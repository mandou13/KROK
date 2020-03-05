const getGeoloc = () => {
  const SelectedInputGeoloc = document.querySelector('.specific-input-for-geoloc-type')

  if (SelectedInputGeoloc) {
    navigator.geolocation.getCurrentPosition((data) => {
      SelectedInputGeoloc.value = `${data.coords.latitude},${data.coords.longitude}`;
  });

  }
}

export { getGeoloc };
