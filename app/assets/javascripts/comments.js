;(function($){
    var comment_form = $('.new_comment');
    var comments = $('.comments');
    comment_form.submit(function(event){
    $.ajax({
        url: this.action,
        type: this.method,
        dataType: "html",
        data: $(this).serialize(),
        success: function(response){
            comments.children('.comment_errors').remove();
            comments.append(response);
            comment_form.find('textarea').val('');
        },
        error: function(response) {
            console.log(response);
            console.log('error 500');
        }
        });
        return false;
    });

    comments.delegate('.comment .remove', 'click', function(event){
        var self_comment = this;
        $.ajax({
            url: this.href,
            type: 'delete',
            dataType: 'json',
            success: function(response){
                self_comment.parentElement.parentElement.remove();
            },
            error: function(response){
                alert('error 500');
            }
        });
        return false;
    });
})(jQuery);