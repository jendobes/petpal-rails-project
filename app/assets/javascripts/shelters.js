
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

  $("#petIndex").on('click', function(e) {
    console.log("hijacked!")
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
  petLink = this.name.link(`/pets/${this.id}`)
  $("#petIndex").append(petLink).append('<br>')
}

function loadPet(pet) {
  console.log('loadPet')
  // let template = Handlebars.compile(document.getElementById("pet-template").innerHTML);
  let template = HandlebarsTemplates['pet_profile'](pet)

  document.getElementsByTagName("main")[0].innerHTML += template;
}

// function populateIndex(pet) {
//   petLink = pet.name.link(`/pets/${pet.id}`)
//   $("#petIndex").append(petLink).append('<br>')
// }
