
const display_add_or_random = () => {

const card_to_display = document.querySelector('#card_to_display')
const card_to_hide = document.querySelector('#card_to_hide')
const card_update_launch = document.querySelector('#card-img-icon-add')
const back_to_card_through_search = document.querySelector('#card-img-icon-search')
const back_to_card_through_random = document.querySelector('#card-img-icon-random')
const card_img_icon_random_valid = document.querySelector('#card-img-icon-random-valid')
const card_img_icon_random_again = document.querySelector('#card-img-icon-random-again')
const card_random_to_hide_starter = document.querySelectorAll('.card_random_to_hide-0')
const card_random_to_hide_main = document.querySelectorAll('.card_random_to_hide-1')
const card_random_to_hide_dessert = document.querySelectorAll('.card_random_to_hide-2')

// console.log(card_random_to_hide_starter[Math.floor(Math.random() * card_random_to_hide_starter.length)]);


const remove_d_none_for_random_card = (array) => {
  const card = array[Math.floor(Math.random() * array.length)]
  card.classList.remove("d-none")
  card.classList.add("active_random")
  card.querySelector(".card-img-icon-random-again").addEventListener('click', (event) => {
    // window.location.reload();
    console.log('click')
    put_d_none_for_active_card(card_random_to_hide_starter);
    remove_d_none_for_random_card(card_random_to_hide_starter);
    // location.reload();
   })
  }


const put_d_none_for_active_card = (array) => {
  array.forEach(element => {
    if (element.classList.contains("active_random")) {
      element.classList.remove(".active_random")
      element.classList.add("d-none")
    }
  })  // classList.add("d-none")
}



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
    remove_d_none_for_random_card(card_random_to_hide_starter);

  });

  //  card_img_icon_random_again.addEventListener('click', (event) => {
  //   put_d_none_for_active_card(card_random_to_hide_starter);
  //   remove_d_none_for_random_card(card_random_to_hide_starter);
  //  })
  }
}



export { display_add_or_random }
