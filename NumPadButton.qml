import QtQuick 2.0

Rectangle {
    height: parent.height/6
    width: height
    color: "#51504f"
    border.color: "#f2f2f2"
    border.width: 1
    radius: height/2
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    property var timeTxt: text.text
    signal activated
    Text {
        id: text
        color: "#f2f2f2"
        font.pixelSize: 36
        text: timeTxt
        anchors.centerIn: parent
        //anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            parent.activated()
        }
    }
}
