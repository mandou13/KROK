const addFiltersToSearch = () => {
  const SelectedInputs = document.querySelectorAll('.filtering-tags-selected')

  if (SelectedInputs) {
    SelectedInputs.forEach(element => {
      console.log(element.innerText);
    });
  };
};

export { addFiltersToSearch };
