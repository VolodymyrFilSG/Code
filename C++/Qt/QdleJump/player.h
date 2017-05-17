#ifndef PLAYER_H
#define PLAYER_H

#include "baseplayer.h"
#include <QKeyEvent>
#include <QList>



typedef QList<QGraphicsItem*> GraphicsItemsList;

class Player : public BasePlayer {
    Q_OBJECT

    qreal yOffset;
    qreal xOffset;
    int stepsCount;
    bool goUp;

public:
    explicit Player(QGraphicsItem *parent = 0);
    void advance(int phase);
    bool isGoUp() const { return goUp; }
    void keyPressEvent(QKeyEvent* e);

signals:
    void jumpOnYou(QGraphicsObject*);

};

#endif // PLAYER_H
