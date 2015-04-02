/*
 * init.agc
 * 
 * Initialize UDTs and globals here
 * 
 * Copyright (c) 2015 by Codetrasher
*/



// ***********************************
// USER-DEFINED TYPES
// ***********************************

type Vector2D
	x as float
	y as float
endtype


type GamePaddle
	id	as integer
	x as integer
	y as integer
	width as float
	height as float
	offsetX as float
	offsetY as float
	velocity as Vector2D
	maxSpeed as integer
	speed as integer
endtype
 
 
 
type GameBall
	id as integer
	x as integer
	y as integer
	diameter as float
	offset as float
	velocity as Vector2D
	maxSpeed as integer
	//speed as integer
endtype





function InitApplication( )

	
	
	// ***********************************
	// GLOBALS
	// ***********************************
	global g_isDebugging = FALSE
	
	global g_DeviceName as string : g_DeviceName = getDeviceName()
	global g_DeviceWidth as float : g_DeviceWidth = getDeviceWidth()
	global g_DeviceHeight as float : g_DeviceHeight = getDeviceHeight()

	global g_gameState = STATE_MAIN_MENU
	
	global g_lastFrameTime as float
	
	global g_roundStarted = FALSE

	// Game objects (which needs to be controlled some how)
	global g_PlayerPaddle as GamePaddle
	global g_AIPaddle as GamePaddle
	global g_GameBall as GameBall

	// Images for sprites
	// Simple image for general sprites
	global g_dummyImg as integer : g_dummyImg = loadImage( "sprite.png" )
	global g_gameBallImg as integer : g_gameBallImg = loadImage( "game_ball_rusty.png" )



	// ***********************************
	// INITIAL SETUP FOR THE GAME,
	// SUCH AS FPS, DISPLAY SETTINGS...
	// ***********************************

	// Game uses percentage system in coordinates
	aspect as float : aspect = g_DeviceWidth / g_DeviceHeight
	setDisplayAspect( aspect )
	setSyncRate(0, 1)
endfunction
