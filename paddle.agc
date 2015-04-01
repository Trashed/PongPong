/*
 * paddle.agc
 * 
 * This file has the methods for creating
 * and updating game paddles.
 * 
 * Copyright (c) 2015 by Codetrasher
 */







function CreatePaddle( objID as integer, x as integer, y as integer )

	paddle as GamePaddle
	paddle.id = objID
	paddle.x = x
	paddle.y = y
	paddle.width = 5
	paddle.height = 15
	paddle.offsetX = paddle.width / 2
	paddle.offsetY = paddle.height / 2
	paddle.velocity = makeVector2( 0.0, 0.0 )
	paddle.speed = 10
endfunction paddle
 