// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ../../../vendor/assets/javascripts/js
// require_tree .

;(function($){
    var home = $('.navbar .container');

    home.on('click', function(e){
        var target = e.target;
        console.log(target.href+".json");
        $.ajax({
               url: target.href+".json",
               type: "GET",
               success: function(res) {
                   history.pushState('', 'New Page Title', '/newHREF');
                   console.log(res);
               }
            }

        );
        console.log(e.target)
    });
})(jQuery);