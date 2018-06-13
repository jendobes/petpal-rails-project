$(document).ready(function() {
  attachListeners();
  getRescues();
});

//show new rescue form
attachListeners = () => {
  $("#rescueForm").hide()
  $("#petRescue").on('click', function(e) {
    e.preventDefault()
    $(this).hide()
    let element = $("#rescueForm")
      element.show()
  })
  attachSubmitListener()
}

//prevent submit action, ajax post request
attachSubmitListener = () => {
  $("#new_rescue").on('submit', function(e) {

    e.preventDefault()

    let data = $(this).serialize()
    let posting = $.post(this.action, data)
    posting.done(function(data) {
      let petRescue = data.data.attributes
      let story = new PetRescue(petRescue)
      populateStory(story)
      $("#rescueForm").hide()
    })
  })
}

//rescue object model
function PetRescue(data) {
  this.story = data.story
}

//ajax get request for pet rescues
function getRescues() {
  let petId = parseInt($("#petId").text())
  let url = `/pets/${petId}`
  $.get(url + '.json', function(data) {
    data.data.attributes.rescues.forEach(rescue => {
      story = new PetRescue(rescue)
      populateStory(story)

    })
  })
}

//add rescue story to page
function populateStory(story) {
  let template = HandlebarsTemplates['rescue_story'](story)
  $("#rescueStory").append(template);

}
