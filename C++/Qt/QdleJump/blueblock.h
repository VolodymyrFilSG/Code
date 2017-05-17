#ifndef BLUEBLOCK_H
#define BLUEBLOCK_H

#include "block.h"

class BlueBlock : public Block {
    Q_OBJECT

    int off;
public:
    BlueBlock(QGraphicsItem* parent = 0);
    void advance(int phase);
};

#endif // BLUEBLOCK_H
