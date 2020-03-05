import { deleteFakeHome } from './deleteFakeHome'

const scrollToNavbarTop = () => {

  const downArrow = document.querySelector('.downArrow');
  let fakeHome = document.querySelector('.home');

  if (downArrow && fakeHome) {
    downArrow.addEventListener('click', () => {

      window.scroll({
        top: window.innerHeight,
        left: 100,
        behavior: 'smooth'
      });
    });

    document.addEventListener('scroll', (event) => {
      fakeHome = document.querySelector('.home');
      if (window.pageYOffset >= window.innerHeight && fakeHome) {
        deleteFakeHome();
        window.scroll(0,0);
      }
    });

  }
}

export { scrollToNavbarTop }

