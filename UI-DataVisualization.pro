###################
TEMPLATE = app
TARGET = UI-DataVisualization
QT  += qml quick

SOURCES += \
    backend.cpp \
    main.cpp
RESOURCES += \
    ui-datavisualization.qrc
OTHER_FILES += \
    main.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols/controls/styles
INSTALLS += target

###################

DISTFILES += \
    dataVisualization.py \
    images/bubble.png \
    images/button-pressed.png \
    images/button.png \
    images/progress-background.png \
    images/progress-fill.png \
    images/slider-handle.png \
    images/tab.png \
    images/tab_selected.png \
    images/textfield.png \
    resources/testdata-diagram_01.png \
    resources/testdata-pict.png

HEADERS += \ \
    backend.h
