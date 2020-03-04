const plannerSearchClick = () => {
  const searchBox = document.getElementById('searchbox-recipe-index-before');
  if (searchBox) {
    if (searchBox.dataset.click) {
      searchBox.click();
      searchBox.focus();
    }
  }
}

export { plannerSearchClick };
