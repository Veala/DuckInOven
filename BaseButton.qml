import QtQuick 2.0

Image {
    id: img
    height: parent.height/8
    width: height
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    property string name
    property string defaultImage
    property string activeImage1
    property string activeImage2
    property string inactiveImage
    states: [
        State {
            name: "default"
            PropertyChanges { target: img; source: defaultImage}
        },
        State {
            name: "actived1"
            PropertyChanges { target: img; source: activeImage1}
        },
        State {
            name: "actived2"
            PropertyChanges { target: img; source: activeImage2}
        },
        State {
            name: "inactived"
            PropertyChanges { target: img; source: inactiveImage}
        }
    ]

    signal activated
    onActivated: backend.activateButton = name

    MouseArea {
        anchors.fill: parent
        onPressed: {
            if (img.state !== "inactived")
                img.activated()
        }
    }
}
