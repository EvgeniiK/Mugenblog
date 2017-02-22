// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  $(".hint-modal").click(function (data){
    $.ajax({
      url: $(this).data('link'),
      method: 'GET',
      success: function (data) {
        $('.modal-dialog').html(data).ready(function (){
            $( "#hint_tag_ids" ).select2({
              theme: "bootstrap",
              minimumResultsForSearch: 1
            });
          });
        $('#modal-form').modal();
      }
    });
  });
});
