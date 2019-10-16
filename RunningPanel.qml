import QtQuick 2.0

Item {
    id: runningPanel
    anchors.fill: parent
    property int temp
    property int time
    property string tempStr: qsTr("%1°F")
    property string timeStr: qsTr("%1:%2")
    function setTime(t, constValSecs, secs) {
        timeText.text = t
        powerRect2.width = 0.9*runningPanel.width*secs/constValSecs
        //tempText.text = qsTr("%1°F").arg(backend.temp)
    }

    Component.onCompleted: {
        tempText.text = qsTr("%1°F").arg(backend.temp)
        backend.sendCookingTime.connect(runningPanel.setTime)
        if (globalState.state === "cooked") {
            basePanel.setStatus(qsTr("Status: %1 is cooked!").arg(backend.food))
            timeText.text = backend.time
            powerRect2.width = powerRect.width
            return
        }
        if (globalState.state === "stopped") {
            basePanel.setStatus(qsTr("Status: stopped"))
            return
        }

        basePanel.setStatus("Status: cooking...")
    }

    Component.onDestruction: {
        backend.sendCookingTime.disconnect(runningPanel.setTime)
    }

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
        text: "00:00"
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

    Rectangle {
        id: powerRect2
        border.width: 0
        color: "#71e51a"
        radius: height/2
        anchors.top: powerRect.top
        anchors.bottom: powerRect.bottom
        anchors.left: powerRect.left
    }

}
