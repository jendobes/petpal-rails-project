
$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
  $("#showPets").on('click', function(e) {
    $.get(this.href, function(data) {

      data.data.sort(function(a,b){
        var nameA = a.attributes.name
        var nameB = b.attributes.name
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        return 0;
      }).forEach(pet => {
        let newPet = new Pet(pet)
        populateIndex(newPet)
      })
    })
    $("#showPets").hide()
    e.preventDefault()
  })
}


function sortByName(data) {

}

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
  let template = HandlebarsTemplates['pet_link'](pet)
  document.getElementById("petIndex").innerHTML += template
  attachLinkListener()
}

//hijacking pet links
function attachLinkListener(){
  $(".petLinks").on('click', function(e) {
    $.get(this.href + '.json', function(data) {
      let pet = new Pet(data.data)
      pet.loadPet()
    })
    e.preventDefault()
  })
}

//create next button clickability
function attachButtonListener() {
  $("#nextPet").on('click', function(e) {
    let petId = getIndex()
    $.get(`/pets/${petId}` + '.json', function(data) {
      let pet = new Pet(data.data)
      // loadPet(pet)
      pet.loadPet()
    })
  })
}

//get petId for the 'next' button
function getIndex() {
  let allPets = []
  Array.from(document.querySelectorAll(".petLinks")).forEach(link => {
      allPets.push(parseInt(link.dataset.id))
    }
  )

  let petId = document.getElementById('content').dataset.petId
  let index = allPets.indexOf(parseInt(petId))
  if(index+1 === allPets.length){
    return allPets[0]
  }else{
    return allPets[index+1]
  }
}
