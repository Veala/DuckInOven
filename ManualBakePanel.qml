import QtQuick 2.0

Item {
    id: manualBakePanel

    Component.onCompleted: {
        basePanel.setStatus("Status: manual bake")
    }

    Rectangle {
        id: duck
        color: "#424241"
        border.width: 1
        border.color: "#c4c4c4"
        height: 1/4*parent.height
        width: 1/5*parent.width
        //txt.contentWidth + 5
        radius: 1/4*height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -parent.width/3
        anchors.verticalCenterOffset: -parent.height/4
        Text {
            id: txt
            font.pixelSize: 10
            text: qsTr("Manual.\nBake for 2 hours\nat 450 degrees.")
            color: "#f2f2f2"
            anchors.centerIn: parent
        }
    }
}
