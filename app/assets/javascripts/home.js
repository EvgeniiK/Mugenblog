$(document).ready(function() {
  $('table').DataTable({
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
  }).column('0:visible').order( 'desc' ).draw();
});
