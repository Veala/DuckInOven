import QtQuick 2.0

Rectangle {
    id: rect
    color: "#424241"
    border.width: 1
    border.color: "#c4c4c4"
    height: 0.8/4*parent.height
    width: 1/5*parent.width
    radius: 1/4*height
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenterOffset: -parent.width/3
    anchors.verticalCenterOffset: -parent.height/4
    property var text: txt.text
    signal activated()

    Component.onCompleted: {
        if (backend.food === text)
            activated()
    }

    onActivated: {
        rect.color = "#f6771e"
        backend.food = rect.text
    }

    function disactivated() {
        rect.color = "#424241"
    }

    Text {
        id: txt
        text: parent.text
        color: "#f2f2f2"
        anchors.centerIn: parent
    }
    MouseArea {
        id: area
        anchors.fill: parent
        onPressed: activated()
    }
}
