#ifndef BASEPLAYER_H
#define BASEPLAYER_H

#include <QGraphicsObject>
#include <QPainter>
#include <QPainterPath>
#include "defines.h"


class BasePlayer : public QGraphicsObject {
    Q_OBJECT

    int _t;
    QPixmap pixmap;
public:
    explicit BasePlayer(QGraphicsItem *parent = 0);
    QRectF boundingRect() const;
    void setBrush(QPixmap other) { pixmap = other; }
    QPixmap getBrush() const { return pixmap; }
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    virtual ~BasePlayer();
    void setType(int _nt) { _t =_nt; }
    int type() const { return _t; }
public slots:
    void goDown(qreal dist) { setY(y() + dist); }

};

#endif // BASEPLAYER_H
