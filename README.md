# Flying simulator: Quadcopter, wii balance board + Oculus Rift = awesome!

## Science Hack Day 

This is a project created at Chicago Science Hack Day 2014 to simulate flying. It consists of an AR-Drone quadcopter, flown by leaning back, forward, left and right on a wii balance board, with its video relayed to an Oculus Rift display. 

The result is an immersive experience which is like flying (without the G forces)

## Sciency justification/excuses for making something bad ass 

This project explores ways in which immersive control mechanisms and visualization can place a human operator in a remote location that might be dangerous or inaccessible locations. Like Mars or Glasgow.

## How to get running. 

The project requires OSCulator(http://www.osculator.net/) to capture data from the WII balance board. Load in the wiiboard.oscd file to configure it. 

Sync with your WII Balance board by pressing start pairing in OSCulator and pressing the red button in the balance board battery compartment. 


Clone this repo and then run npm install. Connect to your ardrone's wifi and start the server by running 

```
coffee server.coffee
```

This will create a server on http://localhost:4455 which if you point a browser to should show two videos of the feed from the quadcopter. Make this browser window full screen and plug in your Oculus... your now ready to fly!

## Flying 

Flying is intuitive, so any crashes are entirely the fault of the pilot and not the hastily cobbled together code.

* Taking Off        - Simply step on to the balance board 
* Landing           - Simply step off to the balance board 
* Forward           - Lean forward 
* Backward          - Lean Backward
* Clockwise         - Lean Right
* Counter Clockwise - Lean Left

## Team 

* Stuart Lynn      - Idiot who came up with this idea in the first place 
* Andrew Wittrock  - Aspiring Dev/Idiot
* Alex Codreanu    - Romanian Dev/Idiot
