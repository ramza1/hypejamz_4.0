// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require jquery.pjax
//= require best_in_place
//= require twitter/bootstrap/rails/confirm
//= require speakker-big
//= require raphael
//= require morris
//= require jquery-star-rating
//= require chosen-jquery




$(function(){
    $('.song-link, .pjax-link').pjax('[data-pjax-container]').live('click', function(){
        $(this).prepend("<div class='loader-box'>loading....</div>")
    })
});


$(document).on('pjax:end', function(){
    $('a.pop').popover();
});


$(document).ready(function(){
    $('.ajaxful-rating a').bind('click',function(event){
        event.preventDefault();
        $.ajax({
            type: $(this).attr('data-method'),
            url: $(this).attr('href'),
            data: {
                stars: $(this).attr('data-stars'),
                dimension: $(this).attr('data-dimension'),
                size: $(this).attr('data-size'),
                show_user_rating: $(this).attr('data-show_user_rating')
            },
success: function(response){
    $('#' + response.id + ' .show-value').css('width', response.width + '%');
    }
});
});
    $('.ajaxful-rating a, .albumcontainer').tooltip()
});









