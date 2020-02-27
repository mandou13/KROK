const display_title = () => {

  const title_to_update = document.querySelector('#title_to_update');
  const title_updated = document.querySelector('#title_updated');
  const title_update_launch = document.querySelector('#title_update_launch');
  const title_update_validation = document.querySelector('#title_update_validation');

  if (title_update_launch) {
    title_update_launch.addEventListener('click', (event) => {
      title_to_update.classList.add("d-none")
      title_updated.classList.remove("d-none")
    })
  }
  if (title_update_launch) {
    title_update_launch.addEventListener('click', (event) => {
      title_to_update.classList.add("d-none")
      title_updated.classList.remove("d-none")
    })
  }
  if (title_update_validation) {
  title_update_validation.addEventListener('click', (event) => {
      title_to_update.classList.remove("d-none")
      title_updated.classList.add("d-none")
    })
  }
}

export { display_title };
