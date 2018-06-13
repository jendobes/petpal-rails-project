
$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
  $("#showPets").on('click', function(e) {
    $.get(this.href, function(data) {
      data.data.forEach(pet => {
        newPet = new Pet(pet)
        allPets.push(parseInt(pet.id))
        populateIndex(newPet)

      })
    })
    $("#showPets").hide()
    e.preventDefault()
  })
}

let allPets = []

function Pet(pet) {
  this.name = pet.attributes.name
  this.id = pet.id
  this.gender = pet.attributes.gender
  this.breed = pet.attributes.breed
  this.age = pet.attributes.age
  this.bio = pet.attributes.bio
  this.avatar = pet.attributes.avatar
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

      pet = new Pet(data.data)
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
  $("#nextPet").on('click', function(e) {
    let petId = getIndex()
    $.get(`/pets/${petId}` + '.json', function(data) {
      pet = new Pet(data.data)
      // loadPet(pet)
      pet.loadPet()
    })
  })
}

//get petId for the 'next' button
function getIndex() {
  let petId = document.getElementById('content').dataset.petId
  let index = allPets.indexOf(parseInt(petId))
  if(index+1 === allPets.length){
    return allPets[0]
  }else{
    return allPets[index+1]
  }
}
