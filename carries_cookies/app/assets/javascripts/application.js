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