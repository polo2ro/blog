---
title: Dash button for mopidy
author: Paul
lang: en
---

Following the arrival of the Amazon dash button, the developers begin to get interested to it because it is an affordable connected button. Unfortunately Amazon has not designed it to be customizable. According to the advertisement, it can be refunded from the first use, I have not tested this because I do not want to activate the one click payment on my Amazon account.

The first project seen is developed in python:

[How I Hacked Amazon's $ 5 WiFi Button to Baby Data Track](https://medium.com/@edwardbenson/how-i-hacked-amazon-s-5-wifi-button-to-track-baby-data-794214b0bdd8)


Then this module nodejs was developed by Alex Hortin on github:

[github: hortinstein/node-dash-button](https://github.com/hortinstein/node-dash-button)

_node-dash-button - A small module to emit events when an Amazon Dash Button is pressed_

The two projets are built on the same idea: detect the ARP or UDP queries made by the dash button on the local network.

## Integration with Mopidy

![The dash button](/images/node-dash-button.png)

Mopidy is a music player that works in client/server, it is very inspired by MPD, one of the first software of this type, the principle is that the GUI (the client) that allows to drive the player is not necessarily on the same computer as the audio output (the server). Mopidy adds a websocket interface to this.

Using the javascript API for mopidy, I developed a script that behaves as a client for mopidy and can be operated by the dash button.

[Github repository: Use mopidy from your dash button](https://github.com/polo2ro/dash)


Since I have only one button and I could not decide between a "play/pause" and "next track", the program performs the following actions:

* If it is in playback, it pause
* If it is paused, it goes to the next song and play

To make it work as a service, I use a systemd file that is provided in the git repository.
