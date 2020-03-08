// var app = require('express')();
var express = require('express')
var app = express()
var http = require('http').createServer(app);
var io = require('socket.io')(http);
const { Client, Message } = require('node-osc');

var clientIp;
//Creates empty list of connected users
userList = [];

app.use(express.static(__dirname + '/public'));

io.on('connection', function (socket) {
    // starts new OSC client on local computer
    clientIp = "127.0.0.1";
    const client = new Client(clientIp, 3334);

    // Gets IP for connected user
    // Removes the ::ffff: if on IPv6
    var user = (socket.handshake.address).replace("::ffff:","");;

    //Adds user IP to list and prints it
    userList.push(user);
    console.log(user + " connected");
    console.log("IPs: ", userList)

    //Send the list of connected IPS to the OSC
    client.send('/client', userList);
    client.send('/clientJoin', user)

    // Gets the input from the webpage and sends it through OSC
    socket.on('change:interval',function (type, val) {
        // Converts the input into an int
        // var value = Number(val);

        // Prepares the Message to ship to OSC
        // var msg = new Message('/' + user + '/' + type + '/' + name, value);
        var msg = new Message('/' + type, user, val);
        client.send(msg);
        // console.log(msg);
    });

    // Gets every connected client ID and send a list
    socket.on("disconnect", function () {
        //Removes disconnected users
        var index = userList.indexOf(user);
        if (index > -1) {
            userList.splice(index, 1);
        }

        console.log(user + ' disconnected');

        //Send the list of connected IPS to the OSC
        client.send('/client', userList);
        client.send('/clientLeft', user)
        console.log("IPs: ", userList);
    });
});
var httpport = 8080;
http.listen(httpport, function () {
    console.log('Listening on: ', "", ":", httpport);

});


// CHECK EXPRESS IP