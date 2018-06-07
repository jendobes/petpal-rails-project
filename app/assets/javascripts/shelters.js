
$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
  $("#showPets").on('click', function(e) {
    $.get(this.href, function(data) {
      data.forEach(pet => {new Pet(pet)})
    })
    $("#showPets").hide()
    e.preventDefault()
  })
}


function Pet(pet) {
  this.name = pet.name
  this.id = pet.id
  this.gender = pet.gender
  this.breed = pet.breed
  this.age = pet.age
  this.bio = pet.bio
  this.renderLink()
  loadPet(this)
}

Pet.prototype.renderLink = function(){
  let template = HandlebarsTemplates['pet_link'](this)
  document.getElementById("petIndex").innerHTML += template
  attachLinkListener()
}

function attachLinkListener(){
  $(".petLinks").on('click', function(e) {
    $.get(this.href, function(data) {
      console.log(data)
    })
    e.preventDefault()
  })
}

function loadPet(pet) {
  let template = HandlebarsTemplates['pet_profile'](pet)
  document.getElementsByTagName("main")[0].innerHTML += template;
}

// function populateIndex(pet) {
//   petLink = pet.name.link(`/pets/${pet.id}`)
//   $("#petIndex").append(petLink).append('<br>')
// }
