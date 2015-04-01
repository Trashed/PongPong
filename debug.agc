/*
 * debug.agc
 * 
 * Contains a method for printing debugging info to the screen
 * 
 * Copyright (c) 2015 by Codetrasher
*/




// ==========================================
// Print debug information on the screen
// ==========================================
function PrintDebugInfo()


	// If 'd' key is pressed, activate/deactivate debugging
	if getRawKeyPressed( 68 ) = TRUE
		if g_isDebugging = TRUE
			g_isDebugging = FALSE
			setPhysicsDebugOff()
		else
			g_isDebugging = TRUE
			setPhysicsDebugOn()
		endif
	endif	
	
	// If debugging is activated, show debug info on the screen
	if g_isDebugging = TRUE
		//setPrintSize( 17 )
		
		
		
		print( "Last keycode: " + str( getRawLastKey() ) )
		print( "FPS = " + left( str( screenFPS() ), 6 ) )						// FPS
		print( "W = " + str( g_deviceWidth ) + ", H = " + str( g_deviceHeight ) )
		print( "Sprite count: " + str( getManagedSpriteCount() ) )
		
		if g_GameBall.id <> 0
			print( "Game ball startVelocity || x = " + str( g_GameBall.startVelocity.x ) + ", y = " + str( g_GameBall.startVelocity.y ) )
			print( "Game ball velocity || x = " + str( getSpritePhysicsVelocityX( g_GameBall.id ) ) + ", y = " + str( getSpritePhysicsVelocityY( g_GameBall.id ) ) )
		endif
	endif
endfunction
