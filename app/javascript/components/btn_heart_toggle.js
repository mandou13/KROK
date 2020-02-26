const btnHeartToggle = () => {
  const btnHeart = document.querySelector('.btn-heart');

  if (btnHeart) {
    btnHeart.addEventListener('click', (event) => {
      if (btnHeart.classList.contains('far')) {
        btnHeart.classList.remove('far');
        btnHeart.classList.add('fas');
      } else {
        btnHeart.classList.remove('fas');
        btnHeart.classList.add('far');
      }

    })
  }
}

export { btnHeartToggle };
