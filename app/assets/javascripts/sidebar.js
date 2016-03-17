
$('.toggle').click(function(){
    if($(".side-menu-container").css("top") == "-160px") {
        $(".side-menu-container").animate({top: "0px"}, 1000);
    } else {
        $(".side-menu-container").animate({top: "-160px"}, 1000);
    }
    return false;
});