$(document).ready(function() {

    checkPresenceOf('create');
    create();
    destroy();
    edit();


    function create(){
      $('.create-comment').click(function() {
        $.ajax({
          type: "POST",
          url: $(this).data('url'),
          data: $('form').serializeArray()
        }).success(function(comment){
          $('#comments').prepend(comment);
          $('trix-editor').empty();
          edit();
          destroy();
        });
      });
    };

    function checkPresenceOf(action){
      $('trix-editor.comment-' + action).on('trix-change', function(event) {
        if (strip($(this).val()).length == 0) {
          $('.' + action + '-comment').attr('disabled','disabled');
        } else {
          $('.' + action + '-comment').removeAttr('disabled');
        }
      });
    };

    function strip(html){
      var tmp = document.createElement("DIV");
      tmp.innerHTML = html.replace(/&nbsp;/g,"").replace(/ /g,"");
      return tmp.textContent || tmp.innerText;
    }


    function update(id){
      $('.update-comment').click(function() {
        $.ajax({
          type: "PATCH",
          url: $(this).data('url'),
          data: $('form').serializeArray()
        }).success(function(comment){
          $('#' + id).replaceWith(comment);
          edit();
        });
      });
    };

    function edit(){
      $('.edit-comment').click(function() {
        var id = $(this).data('id');
        $.ajax({
          url: $(this).data('url'),
        }).success(function(form){
          $('#' + id).html(form);
          update(id);
          checkPresenceOf('update');
        });
      });
    };

    function destroy(){
      $('.btn-delete').click(function(event) {
          event.preventDefault();
          var id = $(this).data('id');
          $.ajax({
              type: "DELETE",
              url: $(this).attr('href'),
          }).success(function(html){
              $('#' + id).fadeOut('slow');
          });
      });
    };
});
