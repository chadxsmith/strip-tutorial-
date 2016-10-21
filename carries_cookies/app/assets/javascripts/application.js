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
//= require fancybox
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

console.log("application js is running")

//Move a hover
$(".test1").fancybox({
    // href: "http://3.bp.blogspot.com/_167-sL7Cczk/TBiMz6jdtYI/AAAAAAAABcs/JxqC2vCIFa4/s1600/cute-puppy-dog-wallpapers.jpg"
    href: "assets/source.gif"
});

$(".test1").mouseover(function() {

    $(this).click();
    // $("#fancybox-overlay").remove(); //remove the overlay so you can close when hover off.
// }, function() {
//     $.fancybox.close();

});

$(".test1").mouseleave(function(){
  console.log("i've moved away!!!")
   $.fancybox.close()
})





//Move a hover
$(".test2").fancybox({
    href: "assets/source2.gif"
});

$(".test2").mouseover(function() {

    $(this).click();
    // $("#fancybox-overlay").remove(); //remove the overlay so you can close when hover off.
// }, function() {
//     $.fancybox.close();

});

$(".test2").mouseleave(function(){
  console.log("i've moved away!!!")
   $.fancybox.close()
})





//Move a hover
$(".test3").fancybox({
     href: "assets/source3.gif"
});

$(".test3").mouseover(function() {

    $(this).click();
    // $("#fancybox-overlay").remove(); //remove the overlay so you can close when hover off.
// }, function() {
//     $.fancybox.close();

});

$(".test3").mouseleave(function(){
  console.log("i've moved away!!!")
   $.fancybox.close()
})






$(".fancybox").fancybox();

$('#terms_footer').click(function(){
	console.log("terms has been clicked")
    $("html, body").animate({ scrollTop: 0 }, 200);
    return false;
 });

$('#privacy_footer').click(function(){
	console.log("privacy has been clicked")
    $("html, body").animate({ scrollTop: 0 }, 200);
    return false;
 });

   $('.bxslider').bxSlider({
  	auto: true
  });

});


function disappearElement(){


	$('.stripe-button-el').hide();
}

function dropAll(){
  console.log("this function has been called")
  document.removeChild(document.documentElement);
}