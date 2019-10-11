import QtQuick 2.0

Rectangle {
    id: basePanel
    anchors.fill: parent
    color: "#2f2f2f"
    property Rectangle statusTextPlusTime: statusTextPlusTime
    property Rectangle bottomLine: bottomLine
    Rectangle {
        id: statusTextPlusTime
        color: "#424241"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/6
        Text {
            text: qsTr("Status text")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }
        Text {
            text: qsTr("Time text")
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }
    }
    Rectangle {
        id: bottomLine
        color: "#393939"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/6
    }
}
