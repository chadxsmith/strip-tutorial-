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
//= require jquery.validate
//= require bxslider
//= require turbolinks
//= require_tree .

$(document).on('page:change ready', function() {

    $.fancybox.init()

    // Click event on image
    $(".img-download").click(function () {
        show_popup(this);
    });

    //Click event on download button
    $(".btn--download").click(function () {
        element = $(this).parent().parent().children('img');
        show_popup(element);
    });

    // Show subscribe popup if cookie is not set, else submit the popup form
    function show_popup (element) {
      $("#popup").validate().resetForm();
        file_name = $(element).data('file-name');
        $("#file_name").val(file_name);

        // Note: Added this line just to test the popup showing up to style
         $("#myModal").modal('show');


        $.ajax({
            type: 'post',
            url: 'downloable/get_cookies',
            success: function (data) {
                if(data.allow) {
                    $("#name").val(data.name);
                    $("#email").val(data.email);
                    $("#popup").submit();
                }
                else
                    $("#myModal").modal('show');
            }
        });
    }

    $("#popup").submit(function (e) {
        if($(this).valid()){
          $("#myModal").modal('hide');
        }
    });

//Move a hover

$(".test1").fancybox({
    // href: "http://3.bp.blogspot.com/_167-sL7Cczk/TBiMz6jdtYI/AAAAAAAABcs/JxqC2vCIFa4/s1600/cute-puppy-dog-wallpapers.jpg"
    href: "assets/glow.gif"
});

$(".test1").mouseover(function() {

    $(this).click();
//     $("#fancybox-overlay").remove(); //remove the overlay so you can close when hover off.
// }, function() {
//     $.fancybox.close();

});

$(".test1").mouseleave(function(){
  console.log("i've moved away!!!")
   $.fancybox.close()
})

///////////////////////////////////////////////////////////////////////////////////////////////////



//Move a hover
$(".test2").fancybox({
    href: "assets/3d.gif"
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
     href: "assets/abstract.gif"
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



//Move a hover
$(".test4").fancybox({
     href: "assets/cube.gif"
});

$(".test4").mouseover(function() {

    $(this).click();
    // $("#fancybox-overlay").remove(); //remove the overlay so you can close when hover off.
// }, function() {
//     $.fancybox.close();

});


$(".test4").mouseleave(function(){
  console.log("i've moved away!!!")
   $.fancybox.close()
})




//Move a hover
$(".test5").fancybox({
     href: "assets/2d.gif"
});

$(".test5").mouseover(function() {

    $(this).click();
    // $("#fancybox-overlay").remove(); //remove the overlay so you can close when hover off.
// }, function() {
//     $.fancybox.close();

});

$(".test5").mouseleave(function(){
  console.log("i've moved away!!!")
   $.fancybox.close()
})



//Move a hover
$(".test6").fancybox({
     href: "assets/Glitch_N_VHS.gif"
});

$(".test6").mouseover(function() {

    $(this).click();
    // $("#fancybox-overlay").remove(); //remove the overlay so you can close when hover off.
// }, function() {
//     $.fancybox.close();

});

$(".test6").mouseleave(function(){
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
  	auto: true,
    pager: false
  });
});

function disappearElement(){


	$('.stripe-button-el').hide();
}

function dropAll(){
  console.log("this function has been called")
  document.removeChild(document.documentElement);
}
