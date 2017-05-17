#ifndef WIDGET_H
#define WIDGET_H

#include <QGraphicsView>
#include <QGraphicsScene>
#include <QTimer>
#include <QSettings>
#include "greenblock.h"
#include "blueblock.h"
#include "glassblock.h"
#include "player.h"


class Widget : public QGraphicsView {
    Q_OBJECT

    QGraphicsScene* gameScene;
    QGraphicsScene* startScene;
    QGraphicsScene* loseScene;

    QTimer* timer;
    Player* player;
    quint64 score;
    QSettings* settings;
    uint bestScore;


public:
    Widget(QWidget *parent = 0);
    ~Widget();

signals:
    void goFuckingDown(qreal dist);

public slots:
    void addBlock(int y); // add a random block to scene
    void advance();
};


#endif // WIDGET_H
