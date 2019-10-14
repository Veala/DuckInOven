import QtQuick 2.0

Item {
    id: basePanel
    function setLocalTime(time) {
        timeText.text = time
    }
    function setStatus(stat) {
        statusText.text = stat
    }
    function loadCookBook() {
        centralPanelLoader_2.source = "qrc:/CookBookPanel.qml"
        nextOrCancelButton.source = ""
        cameraButton.source = ""
    }

    function loadManualBake() {
        centralPanelLoader_2.source = "qrc:/ManualBakePanel.qml"
        nextOrCancelButton.source = ""
        cameraButton.source = ""
    }

    function loadTabMenu() {
        centralPanelLoader_2.source = "qrc:/TabMenuPanel.qml"
        nextOrCancelButton.source = "qrc:/BottomButton1.qml"
        cameraButton.source = ""
        nextOrCancelButton.item.txt = "NEXT"
    }
    function loadRunning() {
        if (backend.time[0] === "H" || backend.time[1] === "H" || backend.time[3] === "M" || backend.time[4] === "M") {
            centralPanel.load("TabMenuPanel")
            centralPanelLoader_2.item.nextButton()
            basePanel.setStatus("Status: time incorrect")
            return
        }
        centralPanelLoader_2.source = "qrc:/RunningPanel.qml"
        nextOrCancelButton.source = "qrc:/BottomButton1.qml"
        cameraButton.source = "qrc:/BottomButton2.qml"
        nextOrCancelButton.item.txt = "CANCEL"
    }
    function cameraPreview() {
        if (centralPanelLoader_2.source.toString() !== "qrc:/CameraPreview.qml")
            centralPanelLoader_2.source = "qrc:/CameraPreview.qml"
        else
            centralPanelLoader_2.source = "qrc:/RunningPanel.qml"
    }

    Component.onCompleted: {
        backend.sendLocalTime.connect(basePanel.setLocalTime)
    }
    Component.onDestruction: {
        backend.sendLocalTime.disconnect(basePanel.setLocalTime)
    }

    Rectangle {
        id: statusTextPlusTime
        color: "#424241"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/6
        Text {
            id: statusText
            color: "#f2f2f2"
            font.pixelSize: 20
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: timeText
            color: "#f2f2f2"
            font.pixelSize: 30
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
        }
    }
    Loader {
        id: centralPanelLoader_2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: statusTextPlusTime.bottom
        anchors.bottom: bottomLine.top
    }

    Rectangle {
        id: bottomLine
        color: "#393939"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/6
        Loader {
            id: nextOrCancelButton
            height: parent.height*2/3.5
            width: 3*height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 2.1/3*parent.width/2
        }
        Loader {
            id: cameraButton
            height: parent.height*3/4
            width: height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 1/2*parent.width/2-width
        }

    }
}
