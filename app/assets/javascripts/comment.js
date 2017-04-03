$(document).ready(function() {

    checkPresenceOfText('create');
    create();
    destroy();
    edit();

    function checkPresenceOfText(selector){
      $('trix-editor.comment-' + selector).on('trix-change', function(event) {
        if (strip($(this).val()).length == 0) {
          $('.' + selector + '-comment').attr('disabled','disabled');
        } else {
          $('.' + selector + '-comment').removeAttr('disabled');
        }
      });
    };

    function strip(html){
      var tmp = document.createElement("DIV");
      tmp.innerHTML = html.replace(/&nbsp;/g,"").replace(/ /g,"");
      return tmp.textContent || tmp.innerText;
    }

    function create(){
      $('.create-comment').click(function() {
        $.ajax({
          type: "POST",
          url: $(this).data('url'),
          data: $('form').serializeArray()
        }).success(function(comment){
          $('#comments').prepend(comment);
          $('trix-editor').empty();
          $('#no-comments').remove();
          edit();
          destroy();
        });
      });
    };

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
          checkPresenceOfText('update');
        });
      });
    };

    function checkLastComment(){
      if (!$('#comments').html().includes('div')) {
        $('#comments').html('<span id="no-comments">No comments yet</span>')
      }
    }

    function destroy(){
      $('.btn-delete').click(function(event) {
          event.preventDefault();
          var id = $(this).data('id');
          $.ajax({
              type: "DELETE",
              url: $(this).attr('href'),
          }).success(function(html){
              $('#' + id).remove();
              checkLastComment();
          });
      });
    };
});
