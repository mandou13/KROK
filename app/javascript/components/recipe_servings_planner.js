const update_servings_planner = () => {
const pluses = document.querySelectorAll('#btn-plus-recipe-planner');
  if (pluses) {
    const minuses = document.querySelectorAll('#btn-minus-recipe-planner');
    let servings = document.querySelectorAll('#recipe-servings-planner');

   minuses.forEach((minus, index) => {
    minus.addEventListener('click', (ev) => {
      ev.preventDefault()
      let servings_to_update = parseInt(servings[index].innerHTML, 10)
      servings[index].innerText = servings_to_update - 1;
    });
   });

    pluses.forEach((plus,index) => {
      plus.addEventListener('click', (ev) => {
        ev.preventDefault()
        let servings_to_update = parseInt(servings[index].innerHTML, 10)
        servings[index].innerText = servings_to_update + 1;
      });
    });
  }
}

export { update_servings_planner }
