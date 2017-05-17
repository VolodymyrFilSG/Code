#ifndef DEFINES_H
#define DEFINES_H

#include <QGraphicsItem>
#include <QPainter>
#include <QDebug>
#include <QGraphicsScene>


// block defines
#define BLOCK_WIDTH    57
#define BLOCK_HEIGHT   15


// player defines
#define PLAYER_WIDTH   30
#define PLAYER_HEIGHT  50

#define PLAYER_Y_OFFSET -4.5
#define MAX_FRAME       30
#define MAX_STEPS       30

#define FPS           50
#define INTERVAL      1000/FPS
#define SCENE_WIDTH   300
#define SCENE_HEIGHT  500

// item types
enum ItemTypes {
    USER_PLAYER = QGraphicsItem::UserType + 1,

    NULL_BLOCK,
    GREEN_BLOCK,
    BLUE_BLOCK,
    GLASS_BLOCK,
};
//typedef QList<Block*> BlockList;

#endif // DEFINES_H
