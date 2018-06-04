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
}

Pet.prototype.renderLink = function(){
  console.log('prototype call')
  petLink = this.name.link(`/pets/${this.id}`)
  $("#petIndex").append(petLink).append('<br>')
}

// function populateIndex(pet) {
//   petLink = pet.name.link(`/pets/${pet.id}`)
//   $("#petIndex").append(petLink).append('<br>')
// }
