#ifndef BLOCK_H
#define BLOCK_H

#include <QGraphicsObject>
#include <QBrush>
#include "defines.h"

class Block : public QGraphicsObject {
    Q_OBJECT

    int _t;
    QBrush backgroundBrush;

public:
    explicit Block(QGraphicsItem *parent = 0);
    QRectF boundingRect() const;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    void setBackgroundBrush(QBrush  newBrush) { backgroundBrush = newBrush; }
    virtual ~Block();
    int type() const { return _t; }
    void setType(int _nt) { _t =_nt; }
public slots:
    void goDown(qreal dist);
    //virtual void playerJumpOnMe() { }
};



#endif // BLOCK_H
