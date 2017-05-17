#include "block.h"

Block::Block(QGraphicsItem *parent) :
    QGraphicsObject(parent) {


    setZValue(0);
    setType(NULL_BLOCK);
}

QRectF Block::boundingRect() const {
    qreal penWidth = 1;

    return QRectF(-BLOCK_WIDTH/2 - penWidth / 2,
                  -BLOCK_HEIGHT/2 - penWidth / 2,
                  BLOCK_WIDTH/2 + penWidth,
                  BLOCK_HEIGHT/2 + penWidth);


}

void Block::paint(QPainter *painter,
           const QStyleOptionGraphicsItem *option,
           QWidget *widget) {

    Q_UNUSED(option)
    Q_UNUSED(widget)

    painter->setPen(QPen(QBrush(), 0));
    painter->setRenderHint(QPainter::Antialiasing);
    painter->setBrush(backgroundBrush);
    painter->drawRoundedRect(boundingRect(), 5, 5);
}

void Block::goDown(qreal dist) {
    setY(y() + dist);
}

Block::~Block() {

}
