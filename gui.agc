/*
 * gui.agc
 * 
 * This file has the methods for creating
 * and updating game GUIs.
 * 
 * Copyright (c) 2015 by Codetrasher
 */
 
 /* type Button
	id as integer
	hoverId as integer
	x as integer
	y as integer
	offsetX as integer
	offsetY as integer
 endtype*/
 
 
 function MainMenu()
	
	startGame = FALSE
	
	startGameBtnImg = loadImage( "btn_start_game.png" )
	startGameBtn = createSprite( startGameBtnImg )
	startGameBtnHoverImg = loadImage( "btn_start_game_hover.png" )
	setSpriteOffset( startGameBtn, getSpriteWidth( startGameBtn ) / 2, getSpriteHeight( startGameBtn ) / 2 )
	setSpritePositionByOffset( startGameBtn, 50, 40 )
	setSpriteScaleByOffset( startGameBtn, 0.05, 0.05 )
	
	while startGame = FALSE
		x = getPointerX() : y = getPointerY()
		
		if getSpriteHit( x, y ) = startGameBtn
			setSpriteImage( startGameBtn, startGameBtnHoverImg )
		else
			setSpriteImage( startGameBtn, startGameBtnImg )
		endif
	
		sync()
	endwhile
 endfunction
 