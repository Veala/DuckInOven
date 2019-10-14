import QtQuick 2.0

Rectangle {
    color: "#424141"
    border.width: 2
    border.color: "#9c9c9c"
    radius: height/2
    Image {
        id: img
        //source:
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            centralPanel.load("CameraPreview")
        }
    }

}
