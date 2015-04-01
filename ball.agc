/*
 * ball.agc
 * 
 * This file has methods for creating
 * and updating the game ball.
 * 
 * Copyright (c) 2015 by Codetrasher
 */
 






function CreateBall( id as integer, x as integer, y as integer )

	ball as GameBall
	ball.id = id	
	ball.x = x
	ball.y = y
	ball.diameter = 5
	ball.offset = radius / 2
	ball.startVelocity = makeVector2( 0.0, 0.0 )
	ball.maxSpeed = 20
endfunction ball
 