import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Particles 2.0
import QtQuick 2.1
import QtQuick.Layouts 1.0
import DataVisualization.Backend 1.0
import QtDataVisualization 1.0

Window {
    id: window
    width: 840
    height: 520
    color: "#232121"
    visible: true
    title: qsTr("Styles Example")

    property double ratio: 1.2
    property int sliderMin: 0
    property int bias: 8
    property int sliderMax: height / ratio
    property real sliderVal

    property int x_position: slider2.value/2 + slider3.value/10
    property int y_position: slider1.value/2 + slider4.value/10

    Backend {
        id:backend
    }


    Label {
        id: targetPoint

        x:x_position
        y:y_position

        text: "O"
    }


    Image {
        id:dataVisualization
        width: 670
        height: 433
        anchors.leftMargin: 31
        anchors.topMargin: 25
        fillMode: Image.PreserveAspectCrop
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        //anchors.fill: parent
        source: "resources/testdata-diagram_02.PNG"
    }

    Text {
        anchors.bottom: dataVisualization.bottom
        x: 319
        y: 464
        width: 142
        height: 27
        wrapMode: Text.WordWrap
        color: "white"
        text: "Beam radius(μm)"
        anchors.bottomMargin: -33
        font.pointSize: 15
    }
    Text {
        x : -65
        y : 220
        width: 160
        wrapMode: Text.WordWrap
        color: "white"
        text: "Drilling velocity(m/s)"
        font.pointSize: 15
        rotation: 270
    }

    Canvas {
            id: canvas
            anchors {
                left: sliderLayout.left
                right: sliderLayout.right
                top: sliderLayout.top
                bottom: sliderLayout.bottom
                margins: 8
            }
            property real lastX
            property real lastY
            property color color: colorTools.paintColor

            onPaint: {
                var ctx = getContext('2d')
                ctx.lineWidth = 1.5
                ctx.strokeStyle = "lightblue"
                ctx.beginPath()
                ctx.moveTo(2,sliderLayout.height-slider1.value - bias)
                ctx.lineTo(26,sliderLayout.height-slider2.value - bias)
                ctx.lineTo(48,sliderLayout.height-slider3.value - bias)
                ctx.lineTo(76,sliderLayout.height-slider4.value - bias)
                ctx.lineTo(100,sliderLayout.height-slider5.value - bias)
                ctx.stroke()
            }
            MouseArea {
                id: area
                anchors.fill: parent
            }
            function clear_canvas() {
                        var ctx = getContext("2d");
                        ctx.reset();
            //            can be used
            //            ctx.clearRect(0,0,300,200);
                        canvas.requestPaint();
                    }
        }

    Canvas {
        id:moving_circle
        width: 760
        height: 523
        anchors.bottomMargin: 62
        anchors.rightMargin: 0
        anchors.fill: parent
        onPaint: {
             var ctx = getContext("2d");
             ctx.fillStyle = "lightslategray"
             ctx.beginPath();
             ctx.ellipse(x_position, y_position, 30, 30);
             ctx.fill();
                  }
         function clear_canvas() {
             var ctx = getContext("2d");
             ctx.reset();
             moving_circle.requestPaint();
         }


        }

    RowLayout {
        id: sliderLayout
        x: 710
        y: 30
        width: 115
        height: 440
        anchors.topMargin: 21
        spacing: 10
        anchors.right: right
        anchors.top: parent.top
        anchors.margins: 30

        Slider {
            id: slider1
            height: 440
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: window.height -80
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
                            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider1.value)
                styleColor: "#372828"
                font.pointSize: 9
            }
        }

        Slider {
            id: slider2
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: window.height -80
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
                            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider2.value)
                styleColor: "#282020"
                font.pointSize: 9
            }
        }
        Slider {
            id: slider3
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: window.height -80
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
                            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider3.value)
                styleColor: "#2c2626"
                font.pointSize: 9
            }
        }
        Slider {
            id: slider4
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: window.height -80
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
                            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider4.value)
                styleColor: "#2c2525"
                font.pointSize: 9
            }
        }
        Slider {
            id: slider5
            orientation: Qt.Vertical
            value: 50
            maximumValue: sliderMax
            minimumValue: sliderMin
            implicitHeight: window.height -80
            style: sliderStyle
            onValueChanged: function(){
                canvas.clear_canvas()
                canvas.requestPaint()
                moving_circle.x = x_position
                moving_circle.y = y_position
                moving_circle.clear_canvas()
                            }
            Text{
                y: 445
                color: "white"
                text: Math.floor(slider5.value)
                styleColor: "#443c3c"
                font.pointSize: 9
            }
        }


    }

    // Style delegates:

    Component {
        id: buttonStyle
        ButtonStyle {

            background: Rectangle {
                implicitHeight: 22
                implicitWidth: window.width / columnFactor
                color: control.pressed ? "darkGray" : control.activeFocus ? "#cdd" : "#ccc"
                antialiasing: true
                border.color: "gray"
                radius: height/2
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 1
                    color: "transparent"
                    antialiasing: true
                    visible: !control.pressed
                    border.color: "#aaffffff"
                    radius: height/2
                }
            }
        }
    }

    Component {
        id: sliderStyle
        SliderStyle {
            handle: Rectangle {
                width: 15
                height: 15
                color: control.pressed ? "darkGray" : "lightGray"
                border.color: "darkgray"
                antialiasing: true
                radius: height/2
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 1
                    color: "transparent"
                    antialiasing: true
                    border.color: "#eee"
                    radius: height/2
                }
            }

            groove: Rectangle {
                height: 8
                implicitWidth: window.width / columnFactor
                implicitHeight: 22

                antialiasing: true
                color: "#ccc"
                border.color: "#777"
                radius: height/2
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 1
                    color: "transparent"
                    antialiasing: true
                    border.color: "#66ffffff"
                    radius: height/2
                }
            }
        }
    }

    ColumnLayout {
        id: buttonLayout
        x: 0
        y: 485
        width: 840
        height: 35

        Button {
            id: button1
            x: 5
            y: 12
            width: 250
            height: 25
            text: qsTr("Button")

            onClicked: {
                backend.startPictureGenerated()
            }
        }
    }
}
