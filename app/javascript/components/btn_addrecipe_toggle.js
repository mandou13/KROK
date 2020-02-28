const btnAddRecipeToggle = () => {
  const btnAddRecipe = document.getElementById('recipe-show-btn-add');
  const circileAddRecipe = document.querySelector('.circle-add-recipe')

  if (btnAddRecipe) {
    btnAddRecipe.addEventListener('click', (event) => {
      if (btnAddRecipe.classList.contains('btn-add-recipe-cliked')) {
        circileAddRecipe.classList.remove('circle-add-recipe-cliked');
        btnAddRecipe.classList.remove('btn-add-recipe-cliked');
      } else {
        circileAddRecipe.classList.add('circle-add-recipe-cliked');
        btnAddRecipe.classList.add('btn-add-recipe-cliked');
      }

    })
  }
}

export { btnAddRecipeToggle };
