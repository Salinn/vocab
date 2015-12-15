//$(function () {
//    $('.navbar-toggle').click(function () {
//        $('.navbar-nav').toggleClass('slide-in');
//        $('.side-body').toggleClass('body-slide-in');
//
//        /// uncomment code for absolute positioning tweek see top comment in css
//        //$('.absolute-wrapper').toggleClass('slide-in');
//
//    });
//});
//
//$("#side-menu-container").toggle(
//    function () {
//        $(this).addClass("hidden");
//    },
//    function () {
//        $(this).removeClass("hidden");
//    }
//);

$('.toggle').click(function(){
    if($(".side-menu-container").css("top") == "-160px") {
        $(".side-menu-container").animate({top: "0px"}, 1000);
    } else {
        $(".side-menu-container").animate({top: "-160px"}, 1000);
    }
    return false;
});