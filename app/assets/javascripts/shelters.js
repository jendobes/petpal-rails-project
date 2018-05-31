$(document).ready(function() {
  attachListeners();
});

// function attachListeners() {
//   $("#showPets").on('click', function(e) {
//     $.get(this.href, function(data) {
//       data.forEach(console.log(pet))
//     }
//     e.preventDefault()
//   })
// }

function attachListeners() {
  $("#showPets").on('click', function(e) {
    $.get(this.href, function(data) {
      data.forEach(pet => {populateIndex(pet)})
    })
    $("#showPets").hide()
    e.preventDefault()
  })
}


function populatetIndex(pet) {
  petLink = pet.name.link(`/pets/${pet.id}`)
  $("#petIndex").append(petLink).append("<br>")
}
