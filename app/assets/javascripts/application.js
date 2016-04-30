// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require ckeditor/init
//= require turbolinks
//= require moment
//= require fullcalendar
//= require chosen-jquery
//= require_tree .

$(document).ajaxError(function(event,xhr,options,exc) {

    var errors = JSON.parse(xhr.responseText);
    var er ="<ul>";
    for(var i = 0; i < errors.length; i++){
        var list = errors[i];
        er += "<li>"+list+"</li>"
    }
    er+="</ul>"
    $("#error_explanation").html(er);

});

$('#menu-toggle').on('click', function(){
    if($('#wrapper').attr('class') == 'active') {
        $('#wrapper').removeClass('active');
        $('#main').removeClass('active');

    } else {
        $('#wrapper').addClass('active');
        $('#main').addClass('active');
    }
    localStorage.setItem('active', $('#wrapper').attr('class'));
});

//Sets sidebar in or out on load
$(function() {
    $('#wrapper').addClass(localStorage.getItem('active'));
    if($('#wrapper').attr('class') == 'active') {
        $('#main').removeClass('active');

    } else {
        $('#main').addClass('active');
    }
});

$('.accordian1').click(function(){
    $(this).find('span').toggleClass('glyphicon-menu-right').toggleClass('glyphicon-menu-down');
});
