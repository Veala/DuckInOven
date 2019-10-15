import QtQuick 2.0

Item {
    height: parent.height
    width: txt.contentWidth
    anchors.verticalCenter: parent.verticalCenter
    property var buttonText: txt.text
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle {
        id: rect
        color: "#9c9c9c"
        border.width: 0
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
    }
    Text {
        id: txt
        color: "#9c9c9c"
        text: buttonText
        font.pixelSize: 18
        anchors.centerIn: parent
        anchors.top: rect.bottom
        anchors.bottom: parent.bottom
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

    }
    signal activated
    signal disactivated

    onActivated: {
        rect.color = "#71e51a"
        txt.color = "#71e51a"
    }
    onDisactivated: {
        rect.color = "#9c9c9c"
        txt.color = "#9c9c9c"
    }

    MouseArea {
        id: area
        anchors.fill: parent
        onPressed: parent.activated()
    }
}
