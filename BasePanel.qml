import QtQuick 2.0

Item {
    id: basePanel
    property var nameOfLoad
    property var error: 0

    function setLocalTime(time) {
        timeText.text = time
    }
    function setStatus(stat) {
        statusText.text = stat
    }

    function finishNextOrCancelButtonCreation() {
        if (nameOfLoad === "TabMenuPanel")  nextOrCancelButton.item.txt = "NEXT"
        else nextOrCancelButton.item.txt = "CANCEL"
    }
    function finishCameraButtonCreation() {
        cameraButton.item.state = "default"
    }
    function finishTabMenuPanelCreation() {
        if (error === 1 && nameOfLoad === "TabMenuPanel") {
            centralPanelLoader_2.item.nextButton()
            basePanel.setStatus("Status: time incorrect")
            error = 0
        }
    }

    function load(str) {
        nameOfLoad = str
        if (str === "CookBookPanel") {
            centralPanelLoader_2.source = "qrc:/CookBookPanel.qml"
            nextOrCancelButton.source = ""
            cameraButton.source = ""
        } else if (str === "ManualBakePanel") {
            centralPanelLoader_2.source = "qrc:/ManualBakePanel.qml"
            nextOrCancelButton.source = ""
            cameraButton.source = ""
        } else if (str === "TabMenuPanel") {
            centralPanelLoader_2.source = "qrc:/TabMenuPanel.qml"
            cameraButton.source = ""
            nextOrCancelButton.source = "qrc:/BottomButton1.qml"
            if (nextOrCancelButton.status == Loader.Ready)
                finishNextOrCancelButtonCreation()
        } else if (str === "RunningPanel") {
            if (backend.time[0] === "H" || backend.time[1] === "H" || backend.time[3] === "M" || backend.time[4] === "M" || backend.time === "00:00") {
                error=1
                centralPanel.load("TabMenuPanel")
                if (centralPanelLoader_2.status == Loader.Ready)
                    finishTabMenuPanelCreation()
                return
            }
            if (backend.cooking === 0) {
                backend.cooking = 1
                globalState.state = "cooking"
            }
            centralPanelLoader_2.source = "qrc:/RunningPanel.qml"
            nextOrCancelButton.source = "qrc:/BottomButton1.qml"
            if (nextOrCancelButton.status == Loader.Ready)
                finishNextOrCancelButtonCreation()

            cameraButton.source = "qrc:/BottomButton2.qml"
            if (cameraButton.status == Loader.Ready)
                finishCameraButtonCreation()

        } else if (str === "CameraPreview") {
            if (centralPanelLoader_2.source.toString() !== "qrc:/CameraPreview.qml") {
                centralPanelLoader_2.source = "qrc:/CameraPreview.qml"
            }
            else {
                centralPanelLoader_2.source = "qrc:/RunningPanel.qml"
            }
        }
    }

    Component.onCompleted: {
        backend.sendLocalTime.connect(basePanel.setLocalTime)
        backend.sendCookingStatus.connect(basePanel.setStatus)

        nextOrCancelButton.loaded.connect(finishNextOrCancelButtonCreation)
        cameraButton.loaded.connect(finishCameraButtonCreation)
        centralPanelLoader_2.loaded.connect(finishTabMenuPanelCreation)

    }
    Component.onDestruction: {
        backend.sendLocalTime.disconnect(basePanel.setLocalTime)
        backend.sendCookingStatus.disconnect(basePanel.setStatus)
        centralPanelLoader_2.source = ""
        nextOrCancelButton.source = ""
        cameraButton.source = ""

        nextOrCancelButton.loaded.disconnect(finishNextOrCancelButtonCreation)
        cameraButton.loaded.disconnect(finishCameraButtonCreation)
        centralPanelLoader_2.loaded.disconnect(finishTabMenuPanelCreation)

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
