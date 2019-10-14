import QtQuick 2.0

Item {
    id: basePanel
//    property Rectangle statusTextPlusTime: statusTextPlusTime
//    property Rectangle bottomLine: bottomLine
    property Loader nextOrCancelButton: nextOrCancelButton
    property Loader cameraButton: cameraButton
    property Loader centralPanelLoader_2: centralPanelLoader_2
    function setLocalTime(time) {
        timeText.text = time
    }

    Component.onDestruction: {
        console.log("basePanel destruction")
        centralPanelLoader_2.source=""
        nextOrCancelButton.source=""
        cameraButton.source=""
    }

    Rectangle {
        id: statusTextPlusTime
        color: "#424241"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/6
        Text {
            id: statusText
            color: "#f2f2f2"
            font.pixelSize: 30
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: timeText
            color: "#f2f2f2"
            font.pixelSize: 30
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
        }
    }
    Loader {
        id: centralPanelLoader_2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: statusTextPlusTime.bottom
        anchors.bottom: bottomLine.top
    }

    Rectangle {
        id: bottomLine
        color: "#393939"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/6
        Loader {
            id: nextOrCancelButton
            height: parent.height*2/3.5
            width: 3*height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 2.1/3*parent.width/2
        }
        Loader {
            id: cameraButton
            height: parent.height*3/4
            width: height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1/2*parent.width/2-width
        }

    }
}
