
const revert_check_button = () => {
console.log('ok')
  const checked_button = document.querySelector('#revert_cook_status')
  checked_button.addEventListener('toggle', (event) => {
    console.log('test')
  })
}

export { revert_check_button }
