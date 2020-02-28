// var acc = document.getElementsByClassName("accordion-profile");
const foodPreference = document.getElementById("food-preference")
const previousLists = document.getElementById("previous-lists")
const editProfile = document.getElementById("edit-profile")

$("#food-preference").click(function(){
  $("#panel-food-preference").slideDown();
});

$("#previous-list").click(function(){
  $("#panel-previous-list").slideDown();
});

$("#edit-profile").click(function(){
  $("#panel-edit-profile").slideDown();
});

var i;

// for (i = 0; i < acc.length; i++) {
//   acc[i].addEventListener("click", function() {

//     this.classList.toggle("active-profile");
//     var panel = this.nextElementSibling;
//     panel.classList.toggle("d-none")
//   });
// }

  if (foodPreference){
    foodPreference.addEventListener("click", function() {
      if(previousLists.classList.contains("active-profile")){
        previousLists.classList.remove("active-profile")
        previousLists.nextElementSibling.classList.add("d-none")
      }
      if(editProfile.classList.contains("active-profile")){
        editProfile.classList.remove("active-profile")
        editProfile.nextElementSibling.classList.add("d-none")
      }

      this.classList.toggle("active-profile");

      var panel = this.nextElementSibling;
      panel.classList.toggle("d-none")
    });
  }
  if(previousLists){
    previousLists.addEventListener("click", function() {
      if(foodPreference.classList.contains("active-profile")){
        foodPreference.classList.remove("active-profile")
        foodPreference.nextElementSibling.classList.add("d-none")
      }
      if(editProfile.classList.contains("active-profile")){
        editProfile.classList.remove("active-profile")
        editProfile.nextElementSibling.classList.add("d-none")
      }

      foodPreference.classList.remove("active-profile")
      editProfile.classList.remove("active-profile")
      this.classList.toggle("active-profile");

      var panel = this.nextElementSibling;
      panel.classList.toggle("d-none")
    });
  }
  if(editProfile){
    editProfile.addEventListener("click", function() {
      if(previousLists.classList.contains("active-profile")){
        previousLists.classList.remove("active-profile")
        previousLists.nextElementSibling.classList.add("d-none")
      }
      if(foodPreference.classList.contains("active-profile")){
        foodPreference.classList.remove("active-profile")
        foodPreference.nextElementSibling.classList.add("d-none")
      }

      foodPreference.classList.remove("active-profile")
      previousLists.classList.remove("active-profile")
      this.classList.toggle("active-profile");

      var panel = this.nextElementSibling;
      panel.classList.toggle("d-none")
    });
  }


