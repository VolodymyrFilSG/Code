#include "player.h"

Player::Player(QGraphicsItem *parent) :
    BasePlayer(parent) {

    yOffset = PLAYER_Y_OFFSET;
    xOffset = 0;
    stepsCount = MAX_STEPS;
    goUp = true;

    setZValue(10);
    setType(USER_PLAYER);
}

void Player::advance(int phase) {
    if(phase == 1) {
        if(x() + xOffset > scene()->sceneRect().width() - 5)
            setPos(0, y());
        if(x() + PLAYER_WIDTH - 5 < 0)
            setPos(scene()->sceneRect().width() - PLAYER_WIDTH, y());

        setPos(x() + xOffset, y() + yOffset);

        xOffset = 0.0;
        stepsCount--;

        if(!goUp) {
            GraphicsItemsList list = collidingItems(Qt::IntersectsItemBoundingRect);
            for(int i = 0; i < list.size(); ++i) {
                // item is under player
                if(list.at(i)->y() > this->y() ) {
                    // if it is wooden block
                    yOffset = PLAYER_Y_OFFSET;
                    goUp = true;
                    stepsCount = MAX_STEPS;

                    if(list.at(i)->type() == GLASS_BLOCK)
                        emit jumpOnYou((QGraphicsObject*)list.at(i));

                    break;
                }
            }
        }
        if(stepsCount < 0 && goUp) {
            yOffset = -yOffset;
            goUp = false;
        }
    }
}

void Player::keyPressEvent(QKeyEvent* e) {
    qreal tempOffset;

    switch (e->key()) {
    case Qt::Key_Left:
        tempOffset = -5;
        break;

    case Qt::Key_Right:
        tempOffset = 5;
        break;

    default:
        e->ignore();
       return;
    }
    if(!xOffset)
        xOffset = tempOffset;
    else
        xOffset *= 1.3;
    e->accept();
}

