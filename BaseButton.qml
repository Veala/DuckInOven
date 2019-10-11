import QtQuick 2.0

Rectangle {
    height: parent.height/8
    width: height
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    signal activated
    MouseArea {
        anchors.fill: parent
        onPressed: parent.activated()
    }
}
