#ifndef GLASSBLOCK_H
#define GLASSBLOCK_H

#include "block.h"

class GlassBlock : public Block {
    Q_OBJECT
public:
    explicit GlassBlock(QGraphicsItem *parent = 0);
signals:

public slots:
    void playerJumpOnMe(QGraphicsObject* obj);
};

#endif // GLASSBLOCK_H
