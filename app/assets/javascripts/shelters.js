$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
  $("#showPets").on('click', function(e) {
    $.get(this.href, function(data) {
      data.forEach(pet => {populateIndex(pet)})
    })
    $("#showPets").hide()
    e.preventDefault()
  })
}

// function Pet(pet) {
//   this.name = pet.name
// }
//
// Pet
//
// Pet.prototype.renderLink() {
//   //return '<a href'
// }

function populateIndex(pet) {
  console.log("I am called")
  petLink = pet.name.link(`/pets/${pet.id}`)
  $("#petIndex").append(petLink).append('<br>')
}
