import QtQuick 2.0

Item {
    id: cookBookPanel

    Component.onCompleted: {
        basePanel.setStatus("Status: cook book")
    }

    Rectangle {
        id: duck
        color: "#424241"
        border.width: 1
        border.color: "#c4c4c4"
        height: 1/4*parent.height
        width: 1/5*parent.width
        radius: 1/4*height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -parent.width/3
        anchors.verticalCenterOffset: -parent.height/4
        Text {
            text: qsTr("Duck")
            color: "#f2f2f2"
            anchors.centerIn: parent
        }
    }
}



