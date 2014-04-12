osc = require 'osc-min'
udp = require "dgram"

ardrone = require("ar-drone")
@copter  = ardrone.createClient()

express = require("express")
app    = express()

http = require('http')
server = http.createServer(app)


console.log @copter
sockets = []

stuFactor = 214.1/0.97

pound_to_kg = 0.4536

app.use(express.static('public'));

io = require('socket.io').listen(server);
# @copter.takeoff()


io.sockets.on 'connection'  , (socket)=>
    sockets.push socket 

@copter_flying = false 
@sum = 0 
@x   = 0 
@y   = 0

@copter.disableEmergency()

sock = udp.createSocket "udp4", (msg, rinfo)=>

  try 
    data = osc.fromBuffer(msg)
    

    if data.address == "/wii/1/balance/4"
      @sum = data.args[0].value      
    else if data.address == "/wii/1/balance/5"
      @x = data.args[0].value - 0.5
    else if data.address == "/wii/1/balance/6"
      @y = data.args[0].value - 0.5
      


    if @copter_flying != true and @sum > 0.1

      @copter.takeoff => 
        @copter.up(0.8)
        setTimeout =>
          @copter.stop()
          @copter_flying = true
        ,400
      # console.log "flying"

    else if @copter_flying and @sum < 0.1
      @copter.land()
      @copter_flying = false
      # console.log "landing"

    else if @copter_flying
      if @y > 0
        @copter.back(0.0)
        @copter.front(@y)
      else 
        @copter.front(0.0)
        @copter.back(-1.0*@y)
      if @x > 0 
        @copter.counterClockwise(0.0)
        @copter.clockwise(@x*2)
      else 
        @copter.clockwise(0.0)
        @copter.counterClockwise(-2*@x)


    console.log "x : #{@x} and y: #{@y} sum : #{@sum}"

  catch _error
    error = _error
    # console.log("invalid OSC packet")

sock.bind(8005)

server.listen(4455)