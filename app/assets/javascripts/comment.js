$(document).ready(function() {
    $('#new_comment').submit(function() {
        var valuesToSubmit = $(this).serialize();
        $.ajax({
            type: "POST",
            url: $(this).attr('action'), //sumbits it to the given url of the form
            data: valuesToSubmit
        }).success(function(html){
            $('#comments').append(html);
            $('trix-editor').empty();
            $('#no_comments').empty();
            $('.btn-edit').click(function() {
                var obj_id = $(this).attr('href').split("/")[2];
                $.ajax({
                    type: "GET",
                    url: $(this).attr('href'),
                }).success(function(html){
                    $('#comment_'+obj_id.toString()).html(html);
                    $("form").submit(function() {
                        var obj_id = $(this).attr('action').split("/")[2];
                        var valuesToSubmit = $(this).serialize();
                        $.ajax({
                            type: "PATCH",
                            url: $(this).attr('action'),
                            data: valuesToSubmit
                        }).success(function(html){
                            console.log(html);
                            $('#comment_'+obj_id.toString()).html(html);
                        });
                        return false; // prevents normal behaviour
                    });
                });
                return false; // prevents normal behaviour
            });
        });
        return false; // prevents normal behaviour
    });

    $('.btn-delete').click(function() {
        console.log('ok')
        var obj_id = $(this).attr('href').split("/")[2];
        $.ajax({
            type: "DELETE",
            url: $(this).attr('href'),
        }).success(function(html){
            $('#comment_'+obj_id.toString()).html('');
        });
        return false; // prevents normal behaviour
    });

});
