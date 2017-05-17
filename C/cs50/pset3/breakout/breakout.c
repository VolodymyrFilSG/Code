//
// breakout.c
//
// Computer Science 50
// Problem Set 3
//

// standard libraries
#define _XOPEN_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Stanford Portable Library
#include <spl/gevents.h>
#include <spl/gobjects.h>
#include <spl/gwindow.h>

// height and width of game's window in pixels
#define HEIGHT 600
#define WIDTH 400

// number of rows of bricks
#define ROWS 5

// number of columns of bricks
#define COLS 10

// radius of ball in pixels
#define RADIUS 10

// lives
#define LIVES 3

// prototypes
void initBricks(GWindow window);
GOval initBall(GWindow window);
GRect initPaddle(GWindow window);
GLabel initScoreboard(GWindow window);
void updateScoreboard(GWindow window, GLabel label, int points);
GObject detectCollision(GWindow window, GOval ball);
double velocityx = 1.0;
double velocityy = 1.0;
int main(void)
{
    // seed pseudorandom number generator
    srand48(time(NULL));

    // instantiate window
    GWindow window = newGWindow(WIDTH, HEIGHT);

    // instantiate bricks
    initBricks(window);

    // instantiate ball, centered in middle of window
    GOval ball = initBall(window);

    // instantiate paddle, centered at bottom of window
    GRect paddle = initPaddle(window);

    // instantiate scoreboard, centered in middle of window, just above ball
    GLabel label = initScoreboard(window);

    // number of bricks initially
    int bricks = COLS * ROWS;

    // number of lives initially
    int lives = LIVES;

    // number of points initially
    int points = 0;

    // keep playing until game over
    while (lives > 0 && bricks > 0)
    {
    	updateScoreboard(window, label, points);
        move(ball, velocityx, velocityy);
        // bounce off right edge of window
        if (getY(ball) + getHeight(ball) >= getHeight(window))
        {
            lives--;
            setLocation(ball, getWidth(window) / 2 - 10, getHeight(window) / 2 - 10);
            waitForClick();
        }
        else if (getY(ball) <= 0){
        	velocityy = -velocityy;
        }
        if (getX(ball) + getWidth(ball) >= getWidth(window))
        {
            velocityx = -velocityx;
        }

        else if (getX(ball) <= 0)
        {
            velocityx = -velocityx;
        }
        pause(5);

        GEvent mouse = getNextEvent(MOUSE_EVENT);
        if (mouse != NULL)
        {
            // if the event was movement
            if (getEventType(mouse) == MOUSE_MOVED)
            {
                // ensure circle follows top cursor
                double x = getX(mouse) - getWidth(paddle) / 2;
                setLocation(paddle, x, getHeight(window) - 10);
            }
        }
        if (detectCollision(window, ball) != NULL){
        	GObject object = detectCollision(window, ball);
        	if (object == paddle){
        		velocityy = -velocityy;
       		}
       		else if (strcmp(getType(object), "GRect") == 0){
        		velocityy = -velocityy;
        		removeGWindow(window, object);
        		points++;
        	}
    	}
    }

    // wait for click before exiting
    waitForClick();

    // game over
    closeGWindow(window);
    return 0;
}

/**
 * Initializes window with a grid of bricks.
 */
void initBricks(GWindow window)
{
	char* colors[] = {"GREEN", "ORANGE", "YELLOW", "BLACK", "RED"};
    for (int i = 0; i <= COLS; i++){
    	for (int j = 0; j < ROWS; j++){
    		GRect target = newGRect(i * 40 + 1, j * 10 + 5, 35, 5);
    		setColor(target, colors[j]);
    		setFilled(target, true);
    		add(window, target);
    	}
    }
}

/**
 * Instantiates ball in center of window.  Returns ball.
 */
GOval initBall(GWindow window)
{
    GOval ball = newGOval(getWidth(window) / 2 - 10, getHeight(window) / 2 - 10, RADIUS, RADIUS);
    setColor(ball, "GREEN");
    setFilled(ball, true);
    add(window, ball);
    return ball;
}

/**
 * Instantiates paddle in bottom-middle of window.
 */
GRect initPaddle(GWindow window)
{
    GRect paddle = newGRect(getWidth(window) / 2 - 25, getHeight(window) - 10, 50, 5);
    setColor(paddle, "RED");
    setFilled(paddle, true);
    add(window, paddle);
    return paddle;
}

/**
 * Instantiates, configures, and returns label for scoreboard.
 */
GLabel initScoreboard(GWindow window)
{
    GLabel label = newGLabel("");
    setFont(label, "SansSerif-36");
    add(window, label);
    return label;
}

/**
 * Updates scoreboard's label, keeping it centered in window.
 */
void updateScoreboard(GWindow window, GLabel label, int points)
{
    // update label
    char s[12];
    sprintf(s, "%i", points);
    setLabel(label, s);

    // center label in window
    double x = (getWidth(window) - getWidth(label)) / 2;
    double y = (getHeight(window) - getHeight(label)) / 2;
    setLocation(label, x, y);
}

/**
 * Detects whether ball has collided with some object in window
 * by checking the four corners of its bounding box (which are
 * outside the ball's GOval, and so the ball can't collide with
 * itself).  Returns object if so, else NULL.
 */
GObject detectCollision(GWindow window, GOval ball)
{
    // ball's location
    double x = getX(ball);
    double y = getY(ball);

    // for checking for collisions
    GObject object;

    // check for collision at ball's top-left corner
    object = getGObjectAt(window, x, y);
    if (object != NULL)
    {
        return object;
    }

    // check for collision at ball's top-right corner
    object = getGObjectAt(window, x + 2 * RADIUS, y);
    if (object != NULL)
    {
        return object;
    }

    // check for collision at ball's bottom-left corner
    object = getGObjectAt(window, x, y + 2 * RADIUS);
    if (object != NULL)
    {
        return object;
    }

    // check for collision at ball's bottom-right corner
    object = getGObjectAt(window, x + 2 * RADIUS, y + 2 * RADIUS);
    if (object != NULL)
    {
        return object;
    }

    // no collision
    return NULL;
}
