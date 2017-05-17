QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QdleJump
TEMPLATE = app


SOURCES += main.cpp\
        widget.cpp \
    baseplayer.cpp \
    player.cpp \
    block.cpp \
    greenblock.cpp \
    blueblock.cpp \
    glassblock.cpp

HEADERS  += widget.h \
    baseplayer.h \
    player.h \
    block.h \
    greenblock.h \
    blueblock.h \
    defines.h \
    glassblock.h

RESOURCES += \
    QdleJump.qrc
