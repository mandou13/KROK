const navBackChangeWithScrollPos = () => {
  const navBack = document.querySelector('.navbar-back');
  let last_scroll_position = 0;
  if (navBack) {
    window.addEventListener('scroll', (event) => {
      last_scroll_position = window.scrollY;
      let bottomPos = navBack.getBoundingClientRect().top + last_scroll_position;
        if (bottomPos >= 463) {
          navBack.style.backgroundColor = "white";
        } else {
          navBack.style.backgroundColor = "transparent";
        }
    })
  }
}
export { navBackChangeWithScrollPos };
