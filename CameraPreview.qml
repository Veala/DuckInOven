import QtQuick 2.0

//Image {
Rectangle {
    color: "yellow"
    anchors.fill: parent
    Component.onCompleted: {
        basePanel.setStatus("Status: camera preview")
    }
}
