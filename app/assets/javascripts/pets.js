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
}
