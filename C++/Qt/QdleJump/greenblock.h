#ifndef GREENBLOCK_H
#define GREENBLOCK_H

#include "block.h"

class GreenBlock : public Block {
    Q_OBJECT

public:
    GreenBlock(QGraphicsItem *parent = 0);
    void advance(int phase);
};

#endif // GREENBLOCK_H
