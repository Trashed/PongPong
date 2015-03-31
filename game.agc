/*
 * game.agc
 * 
 * This file has the methods for updating game logic and
 * drawing objects to the screen.
 * 
 * Copyright (c) 2015 by Codetrasher
 */
 
 
 
 function CreateGame()
	
	// First, set the physics gravity to zero. We don't want objects to fall towards lower frame of the view.
	setPhysicsGravity( 0.0, 0.0 )
		
	// Create and initialize Paddles and the Ball
	//global g_PlayerPaddle as GamePaddle
	//g_PlayerPaddle = CreatePaddle( 50, 50 )
	g_PlayerPaddle.id = PADDLE_PLAYER
	g_PlayerPaddle.x = 85
	g_PlayerPaddle.y = 50
	g_PlayerPaddle.width = 5
	g_PlayerPaddle.height = 15
	g_PlayerPaddle.offsetX = g_PlayerPaddle.width / 2
	g_PlayerPaddle.offsetY = g_PlayerPaddle.height / 2
	g_PlayerPaddle.velocity = makeVector2( 0.0, 0.0 )
	g_PlayerPaddle.speed = 10
	
	
	//global g_AIPaddle as GamePaddle
	//g_AIPaddle = CreatePaddle( 50, 50 )
	g_AIPaddle.id = PADDLE_AI
	g_AIPaddle.x = 15
	g_AIPaddle.y = 50
	g_AIPaddle.width = 5
	g_AIPaddle.height = 15
	g_AIPaddle.offsetX = g_AIPaddle.width / 2
	g_AIPaddle.offsetY = g_AIPaddle.height / 2
	g_AIPaddle.velocity = makeVector2( 0.0, 0.0 )
	g_AIPaddle.speed = 10
	
	//global g_GameBall as GameBall
	g_GameBall = CreateBall( GAME_BALL, 50, 50 )
	
	paddleImg = loadImage( "sprite.png" )
	
	// Create sprites for Game objects
	createSprite( g_PlayerPaddle.id, 0 )
	setSpriteColor( g_PlayerPaddle.id, 0, 0, 255, 255 )	
	setSpritePhysicsOn( g_PlayerPaddle.id, 2 )
	setSpriteSize( g_PlayerPaddle.id, g_PlayerPaddle.width, g_PlayerPaddle.height )
	setSpriteOffset( g_PlayerPaddle.id, g_PlayerPaddle.offsetX, g_PlayerPaddle.offsetY )
	setSpritePositionByOffset( g_PlayerPaddle.id, g_PlayerPaddle.x, g_PlayerPaddle.y )
	
	createSprite( g_AIPaddle.id, 0 )
	setSpriteColor( g_AIPaddle.id, 255, 0, 0, 255 )
	setSpritePhysicsOn( g_AIPaddle.id, 2 )
	setSpriteSize( g_AIPaddle.id, g_AIPaddle.width, g_AIPaddle.height )
	setSpriteOffset( g_AIPaddle.id, g_AIPaddle.offsetX, g_AIPaddle.offsetY )
	setSpritePositionByOffset( g_AIPaddle.id, g_AIPaddle.x, g_AIPaddle.y )
	
	
	
	// When done, continue to actual game play
	SetGameState( STATE_GAME_PLAYING )
 endfunction
 
 
 
 
 function GameLoop()
	
	UpdateLogic()
	DrawObjects()
 endfunction
 
 
 
 
 
 function UpdateLogic()
 
 endfunction
 
 
 
 
 
 
 function DrawObjects()
 
	/* print( "Player id: " + str( g_PlayerPaddle.id ) )
	print( "AI id: " + str( g_AIPaddle.id ) )
	print( "Ball id: " + str( g_GameBall.id ) ) */
 endfunction
 