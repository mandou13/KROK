const handleClickOnTab = () => {
  const main = document.getElementById('main');
  const starter = document.getElementById('starter');
  const dessert = document.getElementById('dessert');
  const btnMain = document.getElementById('btn-main');
  const btnStarter = document.getElementById('btn-starter');
  const btnDessert = document.getElementById('btn-dessert');



  if (main) {
    if (main.dataset.any === "false" && starter.dataset.any === "false" && dessert.dataset.any === "false") {
      // btnMain.classList.add('.btn-no-search-result');
      // btnStarter.classList.add('.btn-no-search-result');
      // btnDessert.classList.add('.btn-no-search-result');
      return;
    }
    if (main.dataset.any === "false" && starter.dataset.any === "false") {
      // btnMain.classList.add('.btn-no-search-result');
      // btnStarter.classList.add('.btn-no-search-result');
      document.getElementById('btn-dessert').click();
      return;
    }
    if(main.dataset.any === "false") {
      // btnMain.classList.add('.btn-no-search-result');
      document.getElementById('btn-starter').click();
    }
  }
}

export { handleClickOnTab };
