$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
  $("#petIndex").on('click', function(e) {
    alert("holy shit this works ")
    console.log("i was loaded")
    e.preventDefault()
  })
}
