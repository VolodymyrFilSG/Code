#include "widget.h"
#include <QMessageBox>
#include <time.h>

uint updateCount = 0;

Widget::Widget(QWidget *parent)
    : QGraphicsView(parent) {

    gameScene = new QGraphicsScene;
    timer = new QTimer;
    connect(timer, SIGNAL(timeout()), this, SLOT(advance()));

    setScene(gameScene);
    gameScene->setSceneRect(0, 0, SCENE_WIDTH, SCENE_HEIGHT);
    qsrand(time(NULL));

    settings = new QSettings("jump.ini", QSettings::IniFormat);
    bestScore = settings->value("BestScore", 0).toUInt();

    QPixmap map(":/images/player.png");
    player = new Player;
    player->setPos(gameScene->width() - 50, SCENE_WIDTH);
    player->setBrush(map);
    gameScene->addItem(player);
    player->grabKeyboard();
    connect(this, SIGNAL(goFuckingDown(qreal)), player, SLOT(goDown(qreal)));

    for(int i = 0; i < SCENE_HEIGHT/35; ++i) {
        addBlock(i*35);
    }

    timer->setInterval(INTERVAL);
    timer->start();

    setWindowFlags(Qt::Window
                   | Qt::MSWindowsFixedSizeDialogHint
                   | Qt::WindowSystemMenuHint
                   | Qt::WindowCloseButtonHint);

    score = 0;
}

void Widget::advance() {
    gameScene->advance();

    if(player->isGoUp()) {
        setWindowTitle("score:  " + QString::number(score) + "   ||   Best :" + QString::number(bestScore));

        if(player->y() < SCENE_HEIGHT / 4  ) {
            addBlock(-25);
            score += 10;
            updateCount++;
            emit goFuckingDown(5);
        }

    } else {
        if(player->y() > gameScene->height() + 15) {
          QMessageBox::about(0, "Error", "You Lose!!!");
          settings->setValue("BestScore", (score > bestScore)?score:bestScore);
          close();
        }
    }

    QList <QGraphicsItem*> items = gameScene->items(QRectF(0, SCENE_HEIGHT + 25, SCENE_WIDTH, SCENE_HEIGHT));

    for(int i = 0; i < items.size(); ++i) {
        gameScene->removeItem(items[i]);
        delete items[i];
    }
}

void Widget::addBlock(int y) {
    Block* block = 0;
    static Block* prevBlock = 0;
    if(updateCount % 10 != 0)
        return;

    int x = qrand() % SCENE_WIDTH;
    x = qBound(BLOCK_WIDTH/2 + 1,
               x,
               SCENE_WIDTH - BLOCK_WIDTH/2);
    if(prevBlock) {
        if(   (y <= (prevBlock->y() + BLOCK_HEIGHT/2) + 6) &&
              (y >= (prevBlock->y() - BLOCK_HEIGHT/2) - 6) ) {
            return;
        }
    }

    switch (qrand()%3) {
    case 0:
        block = new GreenBlock;
        break;

    case 1:
        block = new BlueBlock;
        break;

    case 2:
        block = new GlassBlock;
        connect(player, SIGNAL(jumpOnYou(QGraphicsObject*)),
                block, SLOT(playerJumpOnMe(QGraphicsObject*)));
    break;
    default:
        break;
    }

    prevBlock = block;
    block->setPos(x, y);
    gameScene->addItem(block);
    connect(this, SIGNAL(goFuckingDown(qreal)), block, SLOT(goDown(qreal)));
}

Widget::~Widget() {
    gameScene->clear();
    delete gameScene;
    delete player;
    delete gameScene;
}
