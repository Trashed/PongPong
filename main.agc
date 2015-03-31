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
 #include "game.agc"
 #include "vector.agc"
 #include "paddle.agc"
 #include "ball.agc"
 
 
 // ***********************************
 // USER-DEFINED TYPES
 // ***********************************
 
 // Vector
Type Vector2D
	x as float
	y as float
Endtype
 
 
 type GamePaddle
	id	as integer
	x as integer
	y as integer
	width as integer
	height as integer
	offsetX as integer
	offsetY as integer
	velocity as Vector2D
	speed as integer
 endtype
 
 
 
 type GameBall
	id as integer		// For sprite ID
	x as integer
	y as integer
	radius as integer
	offset as integer
	velocity as Vector2D
	speed as integer
 endtype
 
 
 
 
 
 
 // ***********************************
 // GLOBALS
 // ***********************************
 global g_DeviceName as string : g_DeviceName = getDeviceName()
 global g_DeviceWidth as float : g_DeviceWidth = getDeviceWidth()
 global g_DeviceHeight as float : g_DeviceHeight = getDeviceHeight()
 
 global g_gameState = STATE_MAIN_MENU
 
 // Game objects (which needs to be controlled some how)
 global g_PlayerPaddle as GamePaddle
 global g_AIPaddle as GamePaddle
 global g_GameBall as GameBall
 
 
 
 // ***********************************
 // INITIAL SETUP FOR THE GAME,
 // SUCH AS FPS, DISPLAY SETTINGS...
 // ***********************************
 
 // Game uses percentage system in coordinates
 aspect as float : aspect = g_DeviceWidth / g_DeviceHeight
 setDisplayAspect( aspect )
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
			// Set values to Game objects
			CreateGame()
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
