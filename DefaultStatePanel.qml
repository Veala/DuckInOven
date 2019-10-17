import QtQuick 2.0

Item {
    id: defaultStatePanel
    anchors.fill: parent
    function setLocalDate(date) {
        dateText.text = date
    }
    function setLocalTime(time) {
        timeText.text = time
    }
    Component.onCompleted: {
        backend.sendLocalTime.connect(defaultStatePanel.setLocalTime)
        backend.sendLocalDate.connect(defaultStatePanel.setLocalDate)
    }

    Component.onDestruction: {
        backend.sendLocalTime.disconnect(defaultStatePanel.setLocalTime)
        backend.sendLocalDate.disconnect(defaultStatePanel.setLocalDate)
    }

    Text {
        id: timeText
        color: "#f2f2f2"
        font.pixelSize: 60
        font.family: "Roboto"
        anchors.top: parent.top
        anchors.bottom: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
    }
    Text {
        id: dateText
        color: "#f2f2f2"
        font.pixelSize: 20
        font.family: "Roboto"
        anchors.top: parent.verticalCenter
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
