
$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
  $("#showPets").on('click', function(e) {
    $.get(this.href, function(data) {
      data.forEach(pet => {
        allPets.push(pet.id)
        populateIndex(pet)})
    })
    $("#showPets").hide()
    e.preventDefault()
  })
}

let allPets = []

function Pet(pet) {
  this.name = pet.name
  this.id = pet.id
  this.gender = pet.gender
  this.breed = pet.breed
  this.age = pet.age
  this.bio = pet.bio
}

Pet.prototype.loadPet = function(){
  $("#main").empty()
  let template = HandlebarsTemplates['pet_profile'](this)
  document.getElementsByTagName("main")[0].innerHTML += template;
  attachButtonListener()
}

//creating pet links
function populateIndex(pet) {
  // petLink = pet.name.link(`/pets/${pet.id}`)
  // $("#petIndex").append(petLink).append('<br>')
  let template = HandlebarsTemplates['pet_link'](pet)
  document.getElementById("petIndex").innerHTML += template
  attachLinkListener()
}

//hijacking pet links
function attachLinkListener(){
  $(".petLinks").on('click', function(e) {
    $.get(this.href + '.json', function(data) {
      pet = new Pet(data)
      // loadPet(pet)
      pet.loadPet()
    })
    e.preventDefault()
  })
}

//loading pet info to page
// function loadPet(pet) {
//   $("#main").empty()
//   let template = HandlebarsTemplates['pet_profile'](pet)
//   document.getElementsByTagName("main")[0].innerHTML += template;
//   attachButtonListener()
// }

//create next button clickability
function attachButtonListener() {
  let petId = getIndex()
  $("#nextPet").on('click', function(e) {
    $.get(`/pets/${petId}` + '.json', function(data) {
      pet = new Pet(data)
      // loadPet(pet)
      pet.loadPet()
    })
  })
}

function getIndex() {
  let petId = document.getElementById('content').dataset.petId
  let index = allPets.indexOf(parseInt(petId))
  if(index+1 === allPets.length){
    return allPets[0]
  }else{
    return allPets[index+1]
  }
}
