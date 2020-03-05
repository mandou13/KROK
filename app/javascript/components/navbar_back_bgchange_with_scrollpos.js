const navBackChangeWithScrollPos = () => {
  const navBack = document.querySelector('.navbar-back');
  const btnBack = document.querySelector('.btn-back');
  let last_scroll_position = 0;
  if (navBack) {
    window.addEventListener('scroll', (event) => {
      last_scroll_position = window.scrollY;
      let bottomPos = navBack.getBoundingClientRect().top + last_scroll_position;
        if (bottomPos >= 463) {
          navBack.style.backgroundColor = "white";
          btnBack.style.color = "rgb(50, 50, 50)";
        } else {
          navBack.style.backgroundColor = "transparent";
          btnBack.style.color = "white";
        }
    })
  }
}
export { navBackChangeWithScrollPos };
