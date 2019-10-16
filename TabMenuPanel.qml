import QtQuick 2.0

Item {
    id: tabMenuPanel

    signal running()

    function nextButton() {
        if (tabMenuPanelLoader.source.toString() === "qrc:/TempSelector.qml") {
            timer.activated()
        } else if (tabMenuPanelLoader.source.toString() === "qrc:/TimeNumPad.qml") {
            if (backend.time[0] === "H" || backend.time[1] === "H" || backend.time[3] === "M" || backend.time[4] === "M" || backend.time === "00:00") {
                basePanel.setStatus("Status: time incorrect")
                return
            }
            centralPanel.load("RunningPanel")
        }
    }

    Component.onCompleted: {
        temperature.activated()
    }

    Component.onDestruction: {
        tabMenuPanelLoader.source = ""
    }

    Rectangle {
        id: tabMenu
        color: "#393939"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/5

        TabButtonDIO {
            id: temperature
            anchors.horizontalCenterOffset: -3/4*parent.width/2
            Component.onCompleted: buttonText = qsTr("Temperature")

            onActivated: {
                timer.disactivated()
                tabMenuPanelLoader.source = "qrc:/TempSelector.qml"
            }
        }
        TabButtonDIO {
            id: timer
            anchors.horizontalCenterOffset: -1/4*parent.width/2
            Component.onCompleted: buttonText = qsTr("Timer")
            onActivated: {
                temperature.disactivated()
                tabMenuPanelLoader.source = "qrc:/TimeNumPad.qml"
            }
        }
    }

    Loader {
        id: tabMenuPanelLoader
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tabMenu.bottom
        anchors.bottom: parent.bottom
    }
}
