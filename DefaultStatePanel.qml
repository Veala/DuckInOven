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

    Text {
        id: timeText
        color: "#f2f2f2"
        font.pixelSize: 60
        anchors.top: parent.top
        anchors.bottom: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        //text: qsTr("hh:mm AP")
    }
    Text {
        id: dateText
        color: "#f2f2f2"
        font.pixelSize: 20
        anchors.top: parent.verticalCenter
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        //text: qsTr("dddd, MMMM yy")
    }
}
