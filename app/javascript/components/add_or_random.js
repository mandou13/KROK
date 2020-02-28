
const display_add_or_random = () => {

const card_to_display = document.querySelector('#card_to_display')
const card_to_hide = document.querySelector('#card_to_hide')
const card_update_launch = document.querySelector('#card-img-icon-add')
const back_to_card_through_search = document.querySelector('#card-img-icon-search')
const back_to_card_through_random = document.querySelector('#card-img-icon-random')
const card_img_icon_random_valid = document.querySelector('#card-img-icon-random-valid')
const card_img_icon_random_again = document.querySelector('#card-img-icon-random-again')
const card_random_to_hide = document.querySelector('#card_random_to_hide')

if (
  card_to_display &&
  card_to_hide &&
  card_update_launch &&
  back_to_card_through_search &&
  back_to_card_through_random &&
  card_img_icon_random_valid &&
  card_img_icon_random_again &&
  card_random_to_hide
  ) {
  card_update_launch.addEventListener('click', (event) => {
    card_to_display.classList.remove("d-none");
    card_to_hide.classList.add("d-none");
  })

  back_to_card_through_search.addEventListener('click', (event) => {
    card_to_display.classList.add("d-none");
    card_to_hide.classList.remove("d-none");
  })

  back_to_card_through_random.addEventListener('click', (event) => {
    card_to_display.classList.add("d-none");
    card_to_hide.classList.remove("d-none");
    card_random_to_hide.classList.remove("d-none");
  });

   card_img_icon_random_again.addEventListener('click', (event) => {
    window.location.reload();
    card_random_to_hide.classList.remove("d-none");
    // location.reload();
   })

  card_img_icon_random_valid.addEventListener('click', (event) => {
    // card_random_to_hide.classList.add("d-none");
    // window.location.reload();
  })
  }

}


export { display_add_or_random }
