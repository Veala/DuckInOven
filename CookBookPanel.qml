import QtQuick 2.0

BasePanel {
    id: cookBookPanel
    Rectangle {
        id: cookBook
        color: "#2f2f2f"
        anchors.top: statusTextPlusTime.bottom
        anchors.bottom: bottomLine.top
        anchors.left: parent.left
        anchors.right: parent.right
        BaseButton {
            id: duck
            color: "blue"
            anchors.horizontalCenterOffset: -parent.width/4
            anchors.verticalCenterOffset: parent.height/3
            onActivated: {
                console.log(color)
            }
            Text {
                text: qsTr("Duck")
                anchors.centerIn: parent
            }
        }
        BaseButton {
            id: duck2
            anchors.horizontalCenterOffset: -parent.width/4
            anchors.verticalCenterOffset: -parent.height/3
            onActivated: {
                console.log(color)
            }
            Text {
                text: qsTr("Duck2")
                anchors.centerIn: parent
            }
        }
    }
}
