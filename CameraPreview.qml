import QtQuick 2.0

Image {
    source: "qrc:/pic/Duck.png"
    anchors.centerIn: parent
    Component.onCompleted: {
        basePanel.setStatus("Status: camera preview")
    }
}
