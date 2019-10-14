import QtQuick 2.0

Item {
    id: tempSelector
    property int temp

    function getTemp() {
        temp = backend.temp
        tempText.text = slider.message.arg(temp)
        slider.x = (temp - 350)/(150/backgroundImage.width) + backgroundImage.x - slider.width/2
    }

    Component.onCompleted: {
        tempSelector.getTemp()
        basePanel.setStatus("Status: temperature settings")
    }

    Item {
        id: backgroundImage
        anchors.top: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: 0.8*parent.height/2
        width: 0.9*parent.width
        Row {
            id: row1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 3/4*parent.height
            Rectangle { color: "#000000"; width: 2; height: parent.height; }
            Rectangle { width: parent.width/6-2; height: parent.height; color: "#424241";
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -3/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 3/2*parent.width/5}
            }
            Rectangle { color: "#000000"; width: 2; height: parent.height; }
            Rectangle { width: parent.width/6-2; height: parent.height; color: "#424241"
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -3/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 3/2*parent.width/5}
            }
            Rectangle { color: "#000000"; width: 2; height: parent.height; }
            Rectangle { width: parent.width/6-2; height: parent.height; color: "#424241"
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -3/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 3/2*parent.width/5}
            }
            Rectangle { color: "#000000"; width: 2; height: parent.height; }
            Rectangle { width: parent.width/6-2; height: parent.height; color: "#424241"
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -3/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 3/2*parent.width/5}
            }
            Rectangle { color: "#000000"; width: 2; height: parent.height; }
            Rectangle { width: parent.width/6-2; height: parent.height; color: "#424241"
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -3/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 3/2*parent.width/5}
            }
            Rectangle { color: "#000000"; width: 2; height: parent.height; }
            Rectangle { width: parent.width/6-2; height: parent.height; color: "#424241"
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -3/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 1/2*parent.width/5}
                Rectangle { color: "#6b6a6a"; width: 2; height: parent.height/2; anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: 3/2*parent.width/5}
            }
            Rectangle { color: "#000000"; width: 2; height: parent.height; }
            Item {width: parent.spacing; height: parent.spacing;}
        }
        Row {
            id: row2
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: row1.bottom
            height: 1/4*parent.height
            Item {
                height: parent.height
                width: parent.width
                Text { text: qsTr("350°F"); color: "#f2f2f2";  anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -3*parent.width/6 }
                Text { text: qsTr("375°F"); color: "#f2f2f2";  anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -2*parent.width/6 }
                Text { text: qsTr("400°F"); color: "#f2f2f2";  anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset: -1*parent.width/6 }
                Text { text: qsTr("425°F"); color: "#f2f2f2";  anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset:  0*parent.width/6 }
                Text { text: qsTr("450°F"); color: "#f2f2f2";  anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset:  1*parent.width/6 }
                Text { text: qsTr("475°F"); color: "#f2f2f2";  anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset:  2*parent.width/6 }
                Text { text: qsTr("500°F"); color: "#f2f2f2";  anchors.horizontalCenter: parent.horizontalCenter; anchors.horizontalCenterOffset:  3*parent.width/6 }
            }
        }
    }

    Item {
        id: slider
        anchors.top: parent.top
        height: 1.1*parent.height/2
        width: height
        property string message: qsTr("<font color=\"#71e51a\">%1</font><font color=\"#e51a1a\">°F</font>")

        Text {
            id: tempText
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
            onMouseXChanged: {
                slider.x += mouseX-slider.width/2
                if (slider.x + slider.width/2 < backgroundImage.x)
                    slider.x = backgroundImage.x - slider.width/2;
                if (slider.x+slider.width/2 > backgroundImage.x+backgroundImage.width)
                    slider.x = backgroundImage.x+backgroundImage.width  - slider.width/2
                temp = 350+(slider.x+slider.width/2 - backgroundImage.x) * 150/backgroundImage.width
                tempText.text = slider.message.arg(temp)
                backend.temp = temp
            }
        }
    }

}
