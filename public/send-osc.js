var socket = io();
$(function() {
    $(":input").on("input", function () {
      var type = $(this).attr('class');
      var idname = $(this).attr('id');
      var val = $(this).val();
      sendosc(type, val, idname);
      console.log('Message from ' + idname, " With value: " + val); 
    });
    $(":button").on("input", function () {
      var type = $(this).attr('class');
      var idname = $(this).attr('id');
      var val = $(this).val();
      console.log("A button is pressed");
      sendosc(type, val, idname);
    });
    // var $pad = $(".pad")
    //     .xy({
    //       change : function (value) {
    //           console.log("change : ", value);
    //       }
    //     })

      // $(".pad").on("change",)
    
    // $(".pad").on("change", function() {
    //   var val = ;
    //   console.log(val);
    // });

});

// Different function for Buttons /Range and other stuff
$(function(){

});

function sendosc(type, val, idname) {
  socket.emit("change:interval", type, val, idname);
}