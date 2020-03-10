// var app = require('express')();
var express = require('express')
var app = express()
var http = require('http').createServer(app);
var io = require('socket.io')(http);
const { Client, Message } = require('node-osc');

var httpport = 8080;

var clientIp;
//Creates empty list of connected users
userList = [];

app.use(express.static(__dirname + '/public'));

io.on('connection', function (socket) {
    // starts new OSC client on local computer
    clientIp = "127.0.0.1";
    const client = new Client(clientIp, 3334);

    // Gets random ID for connected user
    var user = Math.random().toString(36).substr(2, 9);

    //Adds user ID to list and prints it
    userList.push(user);
    console.log(user + " connected");
    console.log("Users: ", userList)

    //Send the list of connected users to the OSC
    // client.send('/client', userList);
    client.send('/clientJoin', user)

    // Gets the input from the webpage and sends it through OSC
    socket.on('change:interval',function (type, val) {
        // Prepares the Message to ship to OSC
        var msg = new Message('/' + type, user, val);
        client.send(msg);
        // console.log(msg);
    });

    // Gets every connected client and send a list
    socket.on("disconnect", function () {
        //Removes disconnected users
        var index = userList.indexOf(user);
        if (index > -1) {
            userList.splice(index, 1);
        }

        console.log(user + ' disconnected');

        //Send the list of connected IPS to the OSC
        // client.send('/client', userList);
        client.send('/clientLeft', user);
        console.log("IDs: ", userList);
    });
});

http.listen(httpport, function () {
    console.log('Listening on: ', "", ":", httpport);

});