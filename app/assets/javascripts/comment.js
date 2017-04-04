$(document).ready(function() {

    checkPresenceOfText('create');
    create();

    function checkPresenceOfText(selector){
      $('trix-editor.comment-' + selector).on('trix-change', function(event) {
        if (strip($(this).val()).length == 0) {
          $('.' + selector + '-comment').attr('disabled','disabled');
        } else {
          $('.' + selector + '-comment').removeAttr('disabled');
        }
      });
    };

    // This function will sanitize text in editor to find at least one letter
    function strip(html){
      var tmp = document.createElement("DIV");
      tmp.innerHTML = html.replace(/&nbsp;/g,"").replace(/ /g,"");
      return tmp.textContent || tmp.innerText;
    };

    function create(){
      $('.create-comment').click(function() {
        $.ajax({
          type: "POST",
          url: $(this).data('url'),
          data: $('form').serializeArray()
        }).success(function(comment){
          $(comment).hide().prependTo($('#comments')).animate({
            easing: "easeInQuad",
            height: "toggle"
          }, 500);
          $('trix-editor').empty();
          $('#no-comments').remove();
        });
      });
    };

    function update(element, id){
      $('.update-comment').click(function() {
        $.ajax({
          type: "PATCH",
          url: $(this).data('url'),
          data: $('form').serializeArray()
        }).success(function(comment){
          element.fadeOut(300, function(){
            var div = $(comment).hide();
            element.replaceWith(div);
            $('#' + id).fadeIn(300, function(){
            });
          });
        });
      });
    };

    function cancel(element, html) {
      $('.cancel-update').click(function(){
        element.fadeOut(300, function(){
          element.html(html);
          element.fadeIn(300, function(){
          });
        });
      });
    };

    function checkLastComment(){
      if (!$('#comments').html().includes('div')) {
        $('#comments').html('<span id="no-comments">No comments yet</span>')
      }
    }

    // These functions are global

    // Edit button loads form partial instead comment
    $(document).on('click', '.edit-comment', function() {
        $('.cancel-update').click();
        var id = $(this).data('id'),
        element = $('#' + id),
        html = element.html();

        $.ajax({
          url: $(this).data('url'),
        }).success(function(form){
          element.fadeOut(300, function(){
            element.html(form);
            element.fadeIn(300, function(){
              update(element, id);
              cancel(element, html);
              checkPresenceOfText('update');
            });
          });
        });
      });

    // Delete button removes comment
    $(document).on('click', '.btn-delete', function(event) {
      event.preventDefault();
      var element = $('#' + $(this).data('id'));
      $.ajax({
          type: "DELETE",
          url: $(this).attr('href'),
      }).success(function(html){
        element.animate({
          easing: "easeOutQuad",
          height: "toggle"
        }, 300, function() {
          element.remove();
        });
        // If this commet was the last, instead of him there will be message 'No comments yet'
        checkLastComment();
      });
    });
});

