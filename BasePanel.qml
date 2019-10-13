import QtQuick 2.0

Item {
    id: basePanel
//    property Rectangle statusTextPlusTime: statusTextPlusTime
//    property Rectangle bottomLine: bottomLine
    property Loader nextOrCancelButton: nextOrCancelButton
    property Loader cameraButton: cameraButton
    property Loader centralPanelLoader_2: centralPanelLoader_2
    Rectangle {
        id: statusTextPlusTime
        color: "#424241"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/6
        Text {
            text: qsTr("Status text")
            color: "#f2f2f2"
            font.pixelSize: 50
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            text: qsTr("Time text")
            color: "#f2f2f2"
            font.pixelSize: 50
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
            height: parent.height*2/3
            width: 3*height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.width/(2*2.5) //2.5 * width
        }
        Loader {
            id: cameraButton
            height: parent.height*3/4
            width: height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.width/(2*3) //2.5 * width
        }

    }
}
