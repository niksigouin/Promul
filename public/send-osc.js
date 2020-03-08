var socket = io();

$(function() {
    $(":input").on("input", function () {
      var type = $(this).attr('class');
      var idname = $(this).attr('id');
      var val = $(this).val();
      sendosc(type, val, idname);
      console.log('Message from ' + idname, "With value: " + val); 
    });

    $(":button").click(function(){
          var type = $(this).attr('class');
          var idname = $(this).attr('id');
          var val = $(this).val();
          // console.log("A button is pressed");
          sendosc(type, val, idname);
          console.log('Message from ' + idname, "With value: " + val); 
    });
});

function sendosc(type, val, idname) {
  socket.emit("change:interval", type, val, idname);
}