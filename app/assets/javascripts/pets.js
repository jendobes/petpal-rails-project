$(document).ready(function() {
  attachListeners();
});

attachListeners = () => {
  $("#rescueForm").hide()
  $("#petRescue").on('click', function(e) {
    e.preventDefault()
    let element = $("#rescueForm")
      element.show()
      element.scrollIntoView();
  })
  attachSubmitListener()
}

attachSubmitListener = () => {
  $("#new_rescue").on('submit', function(e) {
    alert('this is working')
    // $.ajax({
    //   type: "POST",
    //   url: this.action,
    //   data: $(this).serialize(),
    //   success: function(response){
    //     debugger
    //   }
    // })
    e.preventDefault()
  })
}
//hijack submit event of form
//take the form data and send it as an ajax post request. url of post request?
//create rescue from that post request
//send back json of the rescue that was added and inject it in the DOM
