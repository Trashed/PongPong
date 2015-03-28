/*
 * paddle.agc
 * 
 * This file has the methods for creating
 * and updating game paddles.
 * 
 * Copyright (c) 2015 by Codetrasher
 */
 
 
 type Paddle
	id as integer			// For sprite ID
	x as integer
	y as integer
	velocity as Vector2D
	speed as integer
 endtype