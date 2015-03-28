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
 #include "gamestate.agc"
 #include "gui.agc"
 #include "vector.agc"
 #include "paddle.agc"
 #include "game.agc"
 
 
 
 // ***********************************
 // GLOBALS
 // ***********************************
 global g_DeviceName as string : g_DeviceName = getDeviceName()
 global g_DeviceWidth = getDeviceWidth() : global g_DeviceHeight = getDeviceHeight()
 
 global g_gameState = STATE_MAIN_MENU
 
 global g_PlayerPaddle as GamePaddle
 global g_AIPaddle as GamePaddle
 
 
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
	// Switch-case condition controls the application flow
	select GetGameState()
		case STATE_MAIN_MENU:
			MainMenu()
		endcase
		
		case STATE_CREATE_GAME:
			// TODO: Create 'CreateGame' method
			// TODO: Create Paddle objects
			// TODO: Create a Ball
			// TODO: Create walls for game area
		endcase
		
		case STATE_GAME_PLAYING:
			GameLoop()
		endcase
		
		case default:
			end
		endcase
	endselect

    sync()
loop
