import QtQuick 2.0

Rectangle {
    color: "#51504f"
    border.width: 0
    radius: height/2
    property var txt: text.text
    signal activated
    Component.onCompleted:  txt = "NEXT"

    Text {
        id: text
        color: "#f2f2f2"
        font.pixelSize: 15
        text: txt
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        anchors.fill: parent
        onPressed:  parent.activated()
    }
}
