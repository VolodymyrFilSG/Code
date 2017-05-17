#include "glassblock.h"

GlassBlock::GlassBlock(QGraphicsItem *parent) :
    Block(parent) {

    setBackgroundBrush(QBrush(QPixmap(":/images/Glass.png").
                              scaled(BLOCK_WIDTH/2, BLOCK_HEIGHT/2)));
    setType(GLASS_BLOCK);
}

void GlassBlock::playerJumpOnMe(QGraphicsObject* obj) {
    if(obj == this)
        setY(SCENE_HEIGHT + 25);
}
