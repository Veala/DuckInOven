import QtQuick 2.0

Item {
    id: manualBakePanel
    anchors.fill: parent
    property int temp
    property int time
    property string tempStr: qsTr("%1°F")
    property string timeStr: qsTr("%1:%2")
    Text {
        id: tempText
        color: "#f2f2f2"
        text: "400°F"
        font.pixelSize: parent.width/(20/1)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -3/4*parent.width/2
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: timeText
        color: "#f2f2f2"
        text: "22:31"
        font.pixelSize: parent.width/(25/2)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 3/4*parent.width/2
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        id: powerRect
        border.width: 0
        height: parent.height/20
        width: 0.9*parent.width
        color: "#9c9c9c"
        radius: height/2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 1/2*parent.height/2
    }

}
