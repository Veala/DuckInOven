import QtQuick 2.0

Item {
    id: cookBookPanel
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
