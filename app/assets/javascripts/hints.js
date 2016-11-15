// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  $(".hint-modal").click(function (data){
    $.get($(this).data('link'), function(data) {
          $('#modal').html(data.hint)
          $('#modal-form').modal();
    })
  })
})
