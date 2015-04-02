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
#include "init.agc"
#include "debug.agc"
#include "gamestate.agc"
#include "gui.agc"
#include "game.agc"
#include "vector.agc"
#include "paddle.agc"
//#include "ball.agc"






InitApplication()






// ***********************************
 // APPLICATION MAIN LOOP
 // ***********************************
do

	// Print debug info if enabled
	PrintDebugInfo()


	// Switch-case condition controls the application flow
	select GetGameState()
		case STATE_MAIN_MENU:
			MainMenu()
		endcase
		
		case STATE_CREATE_GAME:
			// Set values to Game objects
			CreateGame()
			
			g_lastFrameTime = timer()
		endcase
		
		case STATE_GAME_PLAYING:
			currentFrameTime# = timer()
			deltaTime# = currentFrameTime# - g_lastFrameTime
			g_lastFrameTime = currentFrameTime#
			
			GameLoop( deltaTime# )
		endcase
		
		case default:
			end
		endcase
	endselect

    sync()
loop
