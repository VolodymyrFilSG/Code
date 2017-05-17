#include "baseplayer.h"

BasePlayer::BasePlayer(QGraphicsItem *parent) :
    QGraphicsObject(parent) {

    /*path.moveTo(0, 0);
    path.arcTo(-10, -10, 20, 10, 0, 180); //head
    path.addRect(-10, 0, 20, 20); // body

    path.moveTo(-9, 20);
    path.lineTo(-9, 25); // leg
    path.lineTo(-6, 25); // feet

    path.moveTo(5, 20);
    path.lineTo(5, 25); // leg
    path.lineTo(9, 25); // feet*/
}

QRectF BasePlayer::boundingRect() const {
    qreal penWidth = 1;
    return QRectF(0 - penWidth / 2,
                  -PLAYER_HEIGHT - penWidth / 2,
                  PLAYER_WIDTH + penWidth,
                  PLAYER_HEIGHT + penWidth);

}

void BasePlayer::paint(QPainter *painter,
           const QStyleOptionGraphicsItem *option,
           QWidget *widget) {
    Q_UNUSED(widget)
    Q_UNUSED(option)

    painter->setRenderHint(QPainter::Antialiasing);
    painter->drawPixmap(boundingRect().toRect(),
                        pixmap);
  //  painter->setBrush(Qt::yellow);
  //  painter->setPen(Qt::black);
  //  painter->drawPath(path);


}



BasePlayer::~BasePlayer() {
}
