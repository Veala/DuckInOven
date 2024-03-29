import QtQuick 2.0

Rectangle {
    color: "#424141"
    border.width: 2
    border.color: "#9c9c9c"
    radius: height/2
    property string defaultImage: "qrc:/pic/CameraButton_default.png"
    property string activeImage1: "qrc:/pic/CameraButton_active1.png"
    property string activeImage2: "qrc:/pic/CameraButton_active2.png"
    property string inactiveImage
    property string name

    Component.onCompleted: {
        state = "default"
    }

    states: [
        State {
            name: "default"
            PropertyChanges { target: img; source: defaultImage }
        },
        State {
            name: "activated1"
            PropertyChanges { target: img; source: activeImage1 }
        },
        State {
            name: "activated2"
            PropertyChanges { target: img; source: activeImage2 }
        }
    ]

    Image {
        id: img
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        height: parent.height/1.87
        width: parent.height/1.7
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            backend.activateButton = "cameraItem"
            centralPanel.load("CameraPreview")
            if (parent.state === "default") parent.state = "activated2"
            else parent.state = "default"
        }
    }

}
