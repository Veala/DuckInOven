import QtQuick 2.0

Item {
    id: tempSelector
    property var text: tempText.text

    function correcting() {
        text = "!!!!"
    }

    Component.onCompleted: {
        text = "!!!!"
    }

    Rectangle {
        id: backgroundImage
        color: "red"
        anchors.top: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: 0.8*parent.height/2
        width: 0.8*parent.width
    }

    Item {
        id: slider
        anchors.top: parent.top
        height: 1.1*parent.height/2
        width: height

        Text {
            id: tempText
            text: tempSelector.text
            font.pixelSize: 36
            anchors.top: slider.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 3/4*parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Canvas {
            id: canvas
            anchors.top: tempText.bottom
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: height+10

            onPaint:{
                var context = getContext("2d");

                // the triangle
                context.beginPath();
                context.moveTo(-2, 0);
                context.lineTo(canvas.width/2, canvas.height);
                context.lineTo(canvas.width+2, 0);
                context.closePath();

                // the fill color
                context.fillStyle = "#f6771e";
                context.fill();
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            property int temp
            property string message: qsTr("<font color=\"#71e51a\">%1</font><font color=\"#e51a1a\">°F</font>")
            onMouseXChanged: {
                slider.x += mouseX-slider.width/2
                if (slider.x < 0)
                    slider.x = 0;
                if (slider.x+slider.width > tempSelector.width)
                    slider.x = tempSelector.width - slider.width
                temp = (slider.x+slider.width/2) * 500/backgroundImage.width
                tempText.text = message.arg(temp)
            }
        }
    }

}
