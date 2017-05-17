#include "blueblock.h"

BlueBlock::BlueBlock(QGraphicsItem* parent)
            : Block(parent) {

    setBackgroundBrush(QBrush(QPixmap(":/images/Blue.png").
                              scaled(BLOCK_WIDTH/2, BLOCK_HEIGHT/2)));
    off = -3;
    setType(BLUE_BLOCK);
}

void BlueBlock::advance(int phase) {
    if(phase == 0) {
        setX(x() + off);
        if( x() - BLOCK_WIDTH/2 <= 0 || x() >= scene()->width() )
            off = -off;
    }

}
