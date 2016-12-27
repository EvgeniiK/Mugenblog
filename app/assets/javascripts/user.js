// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  $(".switch-sign-up-in").click(function (data){
      if ($( "#sign-up-form" ).hasClass( "hidden" )) {
        $( "#sign-in-form" ).addClass( "hidden" )
        $( "#sign-up-form" ).removeClass( "hidden" )
      } else {
        $( "#sign-up-form" ).addClass( "hidden" )
        $( "#sign-in-form" ).removeClass( "hidden" )
      }

  })

})


