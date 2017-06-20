$(document).ready(function() {
  $('table.data-table').DataTable({
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

  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    // save the latest tab; use cookies if you like 'em better:
    localStorage.setItem('lastTab', $(this).attr('href'));
    // window.location.hash = $(e.target).attr("href").substr(1);
  });

  // go to the latest tab, if it exists:
  var lastTab = localStorage.getItem('lastTab');
  if (lastTab) {
      $('[href="' + lastTab + '"]').tab('show');
  }

});
