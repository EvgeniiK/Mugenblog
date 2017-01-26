// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  $(".hint-modal").click(function (data){
    $.get($(this).data('link'), function(data) {
          $('#modal').html(data.hint)
          $('#modal-form').modal();
    })
  })

  $('#main-table').DataTable({
    columnDefs: [{
        orderable: false,
        searchable: false,
        targets: -1
    },{
        orderable: false,
        searchable: false,
        targets: -2
      },{
        orderable: false,
        searchable: false,
        targets: -3
      }],
    iDisplayLength: 50
  });

})
