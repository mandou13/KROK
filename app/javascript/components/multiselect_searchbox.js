const addFiltersToSearch = () => {
  // const SelectedInputs = document.querySelectorAll('.filtering-tags-selected')
  const SelectedInputsDishType = document.querySelectorAll('.filtering-tags-selected.input-dish-type')
  const SelectedInputsPrepTime = document.querySelectorAll('.filtering-tags-selected.input-prep-time')
  const SelectedInputsDishOrigin = document.querySelectorAll('.filtering-tags-selected.input-dish-origin')
  const SelectedInputsDifficulty = document.querySelectorAll('.filtering-tags-selected.input-difficulty')

  const inputSearchDishType = document.querySelector(".specific-input-search-dish-type");
  const inputSearchPrepTime = document.querySelector(".specific-input-search-prep-time");
  const inputSearchDishOrigin = document.querySelector(".specific-input-search-dish-origin");
  const inputSearchDifficulty = document.querySelector(".specific-input-search-difficulty");

  if (
    inputSearchDishType &&
    inputSearchPrepTime &&
    inputSearchDishOrigin &&
    inputSearchDifficulty &&
    SelectedInputsDishType &&
    SelectedInputsPrepTime &&
    SelectedInputsDishOrigin &&
    SelectedInputsDifficulty
    ) {
      inputSearchDishType.value = "";
      inputSearchPrepTime.value = "";
      inputSearchDishOrigin.value = "";
      inputSearchDifficulty.value = "";

      SelectedInputsDishType.forEach(element => {
      inputSearchDishType.value += element.innerText + "%";
      });

      SelectedInputsPrepTime.forEach(element => {
      inputSearchPrepTime.value += element.innerText + "%";
      });

      SelectedInputsDishOrigin.forEach(element => {
      inputSearchDishOrigin.value += element.innerText + "%";
      });

      SelectedInputsDifficulty.forEach(element => {
      inputSearchDifficulty.value += element.innerText + "%";
      });
  };
};

const changeClassWhenSelect = () => {

  const AllFilters = document.querySelectorAll(".filtering-tags")

  if (AllFilters) {
    AllFilters.forEach(element => {
      element.addEventListener('click', (ev) => {
        element.classList.toggle("filtering-tags-selected");
        element.classList.toggle("filtering-tags-unselected");
        addFiltersToSearch();
      });
    });
  };
}


export { changeClassWhenSelect };
