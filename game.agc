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
	
	// TODO: Set physics walls off on the right and left side
		
	// Create and initialize Paddles and the Ball
	//g_PlayerPaddle = CreatePaddle( PADDLE_PLAYER, 85, 50 )
	g_PlayerPaddle.id = PADDLE_PLAYER
	g_PlayerPaddle.x = 90
	g_PlayerPaddle.y = 50
	g_PlayerPaddle.width = 3
	g_PlayerPaddle.height = 17
	g_PlayerPaddle.offsetX = g_PlayerPaddle.width / 2
	g_PlayerPaddle.offsetY = g_PlayerPaddle.height / 2
	g_PlayerPaddle.velocity = makeVector2( 0.0, 0.0 )
	g_PlayerPaddle.maxSpeed = 20
	g_PlayerPaddle.speed = 0


	//global g_AIPaddle as GamePaddle
	//g_AIPaddle = CreatePaddle( 50, 50 )
	g_AIPaddle.id = PADDLE_AI
	g_AIPaddle.x = 10
	g_AIPaddle.y = 50
	g_AIPaddle.width = 3
	g_AIPaddle.height = 17
	g_AIPaddle.offsetX = g_AIPaddle.width / 2
	g_AIPaddle.offsetY = g_AIPaddle.height / 2
	g_AIPaddle.velocity = makeVector2( 0.0, 0.0 )
	g_AIPaddle.maxSpeed = 20
	g_AIPaddle.speed = 0

	//global g_GameBall as GameBall
	//g_GameBall = CreateBall( GAME_BALL, 50, 50 )
	// Randomize ball angle and velocity <-> direction
	//setRandomSeed( timer() )
	angle = 45 * randomSign( 1 )
	dirVect as Vector2D : dirVect = getVectorFromAngle( angle )
	g_GameBall.id = GAME_BALL
	g_GameBall.x = 50
	g_GameBall.y = 50
	g_GameBall.diameter = 30		// This is in pixels!!
	g_GameBall.maxSpeed = 6
	//g_GameBall.offset = g_GameBall.radius / 2
	g_GameBall.velocity = makeVector2( dirVect.x * g_GameBall.maxSpeed, dirVect.y * g_GameBall.maxSpeed )
	//g_GameBall.speed = 0

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

	// Set up ball sprite
	createSprite( g_GameBall.id, g_gameBallImg )
	setSpriteSize( g_GameBall.id, ( g_GameBall.diameter / g_DeviceWidth * 100 ), ( g_GameBall.diameter / g_DeviceHeight * 100 ) ) 
	setSpriteOffset( g_GameBall.id, getSpriteWidth( g_GameBall.id ) / 2, getSpriteHeight( g_GameBall.id ) / 2 )
	setSpritePositionByOffset( g_GameBall.id, g_GameBall.x, g_GameBall.y )
	setSpritePhysicsOn( g_GameBall.id, 2 )
	setSpritePhysicsRestitution( g_GameBall.id, 0.99 )
	setSpriteShapeCircle( g_GameBall.id, 0, 0, ( (g_GameBall.diameter / 2) / g_DeviceWidth * 100 ) )

	// Set up game boundaries
	createSprite( BOUNDARY_TOP, g_dummyImg )
	setSpriteSize( BOUNDARY_TOP, 100, 5 )
	setSpritePosition( BOUNDARY_TOP, 0, 0 )
	setSpritePhysicsOn( BOUNDARY_TOP, 1 )
	
	createSprite( BOUNDARY_BOTTOM, g_dummyImg )
	setSpriteSize( BOUNDARY_BOTTOM, 100, 5 )
	setSpritePosition( BOUNDARY_BOTTOM, 0, 100 - getSpriteHeight( BOUNDARY_BOTTOM ) )
	setSpritePhysicsOn( BOUNDARY_BOTTOM, 1 )

	// When done, continue to actual game play
	SetGameState( STATE_GAME_PLAYING )
endfunction




function GameLoop( deltaTime as float )

	UpdateLogic( deltaTime )
	DrawObjects()
endfunction





function UpdateLogic( dt as float )
	// Get user input for Paddle handling
	UpdateUserInput()
	
	// TODO: If possible, try to increase and decrease velocity smoothly, e.g. make the sprite accelerate and brake like a vehicle
	
	// Update Ball movement (use physics!)
	UpdateBallBehavior( dt )
	
	// TODO: Update AI Paddle movement
endfunction




function DrawObjects()

	// Move Player Paddle
	setSpritePhysicsVelocity( g_PlayerPaddle.id, g_PlayerPaddle.velocity.x, g_PlayerPaddle.velocity.y )
	setSpriteAngle( g_PlayerPaddle.id, 0 )
	
	// Move AI Paddle
	setSpriteAngle( g_AIPaddle.id, 0 )
	
endfunction




function UpdateUserInput()
	
	if getRawKeyState( KEYCODE_UP ) = TRUE
		g_PlayerPaddle.velocity.y = -35.0
	elseif getRawKeyState( KEYCODE_DOWN ) = TRUE
		g_PlayerPaddle.velocity.y = 35.0
	else
		g_PlayerPaddle.velocity.y = 0.0
	endif
endfunction



function UpdateBallBehavior( dt as float )

	//vect as Vector2D
	
	if g_roundStarted = FALSE
		SetGameBallStartVelocity()		
		g_roundStarted = TRUE
	endif
	
	// Update ball behavior when collision with other physics object occurs
	CheckBallCollision()
	
	
	setSpritePhysicsAngularVelocity( g_GameBall.id, 0 )
	
endfunction



function CheckBallCollision()
	
	
endfunction




function SetGameBallStartVelocity()
	
	setSpritePhysicsVelocity( g_GameBall.id, g_GameBall.velocity.x * g_GameBall.maxSpeed, g_GameBall.velocity.y * g_GameBall.maxSpeed )
endfunction
