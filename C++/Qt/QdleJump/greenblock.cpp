#include "greenblock.h"

GreenBlock::GreenBlock(QGraphicsItem *parent)
    : Block(parent) {

    setBackgroundBrush(QBrush(QPixmap(":/images/Green.png").
                              scaled(BLOCK_WIDTH/2, BLOCK_HEIGHT/2)));
    setType(GREEN_BLOCK);
}

void GreenBlock::advance(int phase) {

}
