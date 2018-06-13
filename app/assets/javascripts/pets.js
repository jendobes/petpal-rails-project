$(document).ready(function() {
  attachListeners();
  getRescues();
});

attachListeners = () => {
  $("#rescueForm").hide()
  $("#petRescue").on('click', function(e) {
    e.preventDefault()
    $(this).hide()
    let element = $("#rescueForm")
      element.show()
      element.scrollIntoView();
  })
  attachSubmitListener()
}

attachSubmitListener = () => {
  $("#new_rescue").on('submit', function(e) {

    e.preventDefault()

    let data = $(this).serialize()
    let posting = $.post(this.action, data)
    posting.done(function(data) {
      let petRescue = data.data.attributes
      let story = new PetRescue(petRescue)
      populateStory(story)
    })
  })
}

function PetRescue(data) {
  this.story = data.story
}

function populateStory(story) {
  let template = HandlebarsTemplates['rescue_story'](story)
  $("#rescueStory").append(template);
  $("#rescueForm").empty()
}

function getRescues() {
  let petId = parseInt($("#petId").text())
  let url = `/pets/${petId}`
  $.get(url + '.json', function(data) {
      console.log(data)
  })
}
//hijack submit event of form
//take the form data and send it as an ajax post request. url of post request?
//create rescue from that post request
//send back json of the rescue that was added and inject it in the DOM
