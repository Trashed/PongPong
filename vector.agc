/*
 * vector.agc
 * 
 * This file contains methods for handling 2D vectors.
 * 
 * These methods aren't created by me. The original file for 
 * 2D vector handling can be found here: http://forum.thegamecreators.com/?m=forum_view&t=192569&b=6
 */


// ==============================================================
// Returns angle between two vectors v1 and v2
// ==============================================================
function getAngleRadOfVectors2( v1 as Vector2D, v2 as Vector2D )

	dot# = dotProductVector2( v1, v2 )
	lenv1# = getVector2Length( v1 )
	lenv2# = getVector2Length( v2 )
	angle# = aCosRad( dot#/( lenv1# * lenv2# ) )
endfunction angle#


// ==============================================================
// Returns a 2D vector set with [x,y]
// ==============================================================
function makeVector2(x as float, y as float)
    v as Vector2D
    v.x = x
    v.y = y
endfunction v


// ==============================================================
// Returns a 2D vector of the sum of v1 and v2
// ==============================================================
function addVector2(v1 as Vector2D, v2 as Vector2D)
    v as Vector2D
    v.x = v1.x + v2.x
    v.y = v1.y + v2.y
endfunction v


// ==============================================================
// Returns a 2D vector of the difference of v2 from v1
// ==============================================================
function subtractVector2(v1 as Vector2D, v2 as Vector2D)
    v as Vector2D
    v.x = v1.x - v2.x
    v.y = v1.y - v2.y
endfunction v


// ==============================================================
// Returns a 2D vector of the product of v1 and v2
// ==============================================================
function multiplyVector2(v1 as Vector2D, v2 as Vector2D)
    v as Vector2D
    v.x = v1.x * v2.x
    v.y = v1.y * v2.y
endfunction v


// ==============================================================
// Returns a 2D vector of the quotient of v1 and v2
// ==============================================================
function divideVector2(v1 as Vector2D, v2 as Vector2D)
    v as Vector2D
    v.x = v1.x / v2.x
    v.y = v1.y / v2.y
endfunction v


// ==============================================================
// Returns the dot product of two vectors
// ==============================================================
function dotProductVector2(v1 as Vector2D, v2 as Vector2D)
    d# = v1.x*v2.x + v1.y*v2.y
endfunction d#


// ==============================================================
// Returns a 2D vector with an interpolate value from v1
// to v2 using the 'sValue' as step value [0.0-1.0]
// ==============================================================
function linearInterpolateVector2(v1 as Vector2D, v2 as Vector2D, sValue as float)
    v as Vector2D
    v.x = v1.x + (v2.x*v1.x)*sValue
    v.y = v1.y + (v2.y*v1.y)*sValue
endfunction v


// ==============================================================
// Returns the length (or magnitude) of a 2D vector
// ==============================================================
function getVector2Length(v1 as Vector2D)
    l# = v1.x*v1.x + v1.y*v1.y
    l# = sqrt(l#)
endfunction l#


// ==============================================================
// Returns a normalized 2D vector (or unit vector) of v1
// ==============================================================
function normalizeVector2(v1 as Vector2D)
    v as Vector2D
    d# = getVector2Length(v1)
    v.x = v1.x / d#
    v.y = v1.y / d#
endfunction v


// ==============================================================
// Returns the reflected vector of 'I' off of a surface having
// the normal 'N'
// ==============================================================
function reflectVector2(I as Vector2D, N as Vector2D)
    r as Vector2D
    d# = dotProductVector2(N, I)
    r.x = 2*N.x*d# - I.x
    r.y = 2*N.y*d# - I.y
endfunction r

// ===============================================================
// Returns a new vector calculated from an angle (radians)
// ===============================================================
function getVectorFromAngle( rads as float )
	/*
	** V.x = sin( A )
	** V.y = -cos( A )
	*/
	vect as Vector2D
	vect.x = sin( rads )
	vect.y = cos( rads) * -1
endfunction vect
