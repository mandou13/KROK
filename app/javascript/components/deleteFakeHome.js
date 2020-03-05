const deleteFakeHome = () => {
  const home = document.querySelector('.home');

  if (home) {
    home.remove();
  }
}

export { deleteFakeHome }
