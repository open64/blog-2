;(function($){
    var comment_form = $('form');
    var comment = $('.comments');
    comment_form.submit(function(event){
    $.ajax({
        url: this.action,
        type: this.method,
        dataType: "html",
        data: $(this).serialize(),
        success: function(response){
            comment.append(response);
            comment_form.find('textarea').val('');
        },
        error: function(response) {
            console.log(response);
            console.log('error 500');
        }
        });
        return false;
    });

    comment.delegate('.comment .remove', 'click', function(event){
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