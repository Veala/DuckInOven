import QtQuick 2.0

Rectangle {
    id: rect
    height: parent.height/5
    width: height
    color: "#51504f"
    border.color: "#f2f2f2"
    border.width: 1
    radius: height/2
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    property var timeTxt: text.text

    function animate() {
        animation.running = true;
    }

    signal activated
    //onActivated:    animate()

    PropertyAnimation {
        id: animation;
        target: rect;
        property: "color";
        from: "#f6771e"
        to: "#51504f";
        duration: 250
    }
    Text {
        id: text
        color: "#f2f2f2"
        font.pixelSize: 16
        text: timeTxt
        anchors.centerIn: parent
        //anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            parent.activated()
        }
    }
}
