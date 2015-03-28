/*
 * paddle.agc
 * 
 * This file has the methods for creating
 * and updating game paddles.
 * 
 * Copyright (c) 2015 by Codetrasher
 */
 
 
 type GamePaddle
	id as integer			// For sprite ID
	x as integer
	y as integer
	width as integer
	height as integer
	offsetX as integer
	offsetY as integer
	velocity as Vector2D
	speed as integer
 endtype
 
 
 
 
 function CreatePaddle( _id, _x, _y )
	
	paddle as GamePaddle
	paddle.id = _id
	paddle.x = _x
	paddle.y = _y
	paddle.width = 5
	paddle.height = 15
	paddle.offsetX = paddle.width / 2
	paddle.offsetY = paddle.height / 2
	paddle.velocity = makeVector2( 0.0, 0.0 )
	paddle.speed = 10
 endfunction paddle
 