const handleClickOnTab = () => {
  console.log('handleClickOnTab')
  const main = document.getElementById('main');
  const starter = document.getElementById('starter');
  const dessert = document.getElementById('dessert');

  if (main) {
    if (main.dataset.any === "false" && starter.dataset.any === "false" && dessert.dataset.any === "false") return;
    if (main.dataset.any === "false" && starter.dataset.any === "false") {
      document.getElementById('btn-dessert').click();
      return;
    }
    if(main.dataset.any === "false") document.getElementById('btn-starter').click();
  }
}

export { handleClickOnTab };
