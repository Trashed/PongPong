/*
 * Project: Pong Pong (with a twist)
 * 
 * Author: Codetrasher
 * Copyright (c) 2015 by Codetrasher
 */

 // ***********************************
 // INCLUDES
 // ***********************************
 #include "constants.agc"
 #include "vector.agc"
 #include "paddle.agc"
 #include "game.agc"
 
 
 
 // ***********************************
 // GLOBALS
 // ***********************************
 g_DeviceName as string : g_DeviceName = getDeviceName()
 g_DeviceWidth = getDeviceWidth() : g_DeviceHeight = getDeviceHeight()
 
 
 
 
 // ***********************************
 // INITIAL SETUP FOR THE GAME,
 // SUCH AS FPS, DISPLAY SETTINGS...
 // ***********************************
 
 // Game uses percentage system in coordinates
 setDisplayAspect(g_DeviceWidth / g_DeviceHeight)
 setSyncRate(0, 1)
 
 
 
 
 // ***********************************
 // APPLICATION MAIN LOOP
 // ***********************************
do

	GameLoop()

    sync()
loop
