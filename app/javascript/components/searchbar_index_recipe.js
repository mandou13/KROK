const display_searchbar = () => {

const SearchBarIndex = document.getElementById('searchbox-recipe-index-before');
const DisplayFilters = document.getElementById('display-filters-title');

SearchBarIndex.addEventListener("click", (event) => {
  document.getElementById('recipes').classList.toggle("d-none");
  document.getElementById('searchbox-recipe-index-after').classList.toggle("d-none");
  // document.body.classList.toggle("bg-search");
  // console.log(event.currentTarget);
  // event.currentTarget.classList.toggle("bg-white");
});

DisplayFilters.addEventListener("click", (event) => {
  document.getElementById('display-filters-title').classList.toggle("d-none");
  document.getElementById('searchbox-recipe-index-before').classList.toggle("d-none");
  document.getElementById('display-filters').classList.toggle("d-none");
});


}

export { display_searchbar }
