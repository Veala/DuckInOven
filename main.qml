import QtQuick 2.4
import QtQuick.Window 2.2
import duckinoven.backend 1.0

Window {
    visible: true
    width: 1000
    height: 285
    id: win

    function setState(state) {
        console.log(state)
    }

    Component.onCompleted:  centralPanel.load("DefaultStatePanel")
    Component.onDestruction: {
        ////console.log("Component.onDestruction: Window")
//        centralPanelLoader.sourceComponent = undefined
        centralPanelLoader.source = ""
    }

    BackEnd {
        id: backend
    }

    Rectangle {
        color: "#51504f"
        id: leftPanel
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width/4
        BaseButton {
            id: powerItem
            color: "red"
            height: parent.height/4
            anchors.horizontalCenterOffset: -parent.width/4
            onActivated:
                centralPanel.load("RunningPanel")
        }

        BaseButton {
            id: ovenItem
            color: "green"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: -parent.height/3
            onActivated:
                centralPanel.load("TabMenuPanel")
        }

        BaseButton {
            id: cookBookItem
            color: "yellow"
            anchors.horizontalCenterOffset: parent.width/4
            onActivated:
                centralPanel.load("CookBookPanel")
        }

        BaseButton {
            id: manualBakeItem
            color: "blue"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: parent.height/3
            onActivated:
                centralPanel.load("ManualBakePanel")
        }
    }

    Rectangle {
        color: "#51504f"
        id: rightPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width/4

        BaseButton {
            id: lightItem
            color: "red"
            anchors.horizontalCenterOffset: -parent.width/4
            anchors.verticalCenterOffset: -parent.height/3
            onActivated: {
                console.log(color)
            }
        }

        BaseButton {
            id: timerItem
            color: "green"
            anchors.horizontalCenterOffset: -parent.width/4
            onActivated: {
                centralPanel.load("DefaultStatePanel")
            }
        }

        BaseButton {
            id: settingsItem
            color: "yellow"
            anchors.horizontalCenterOffset: -parent.width/4
            anchors.verticalCenterOffset: parent.height/3
            onActivated: {
                console.log(color)
            }
        }

        BaseButton {
            id: bluetoothItem
            color: "blue"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: -parent.height/3
            onActivated: {
                console.log(color)
            }
        }

        BaseButton {
            id: wifiItem
            color: "blue"
            anchors.horizontalCenterOffset: parent.width/4
            onActivated: {
                console.log(color)
            }
        }
    }

    Rectangle {
        id: centralPanel
        color: "#2f2f2f"
        anchors.right: rightPanel.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: leftPanel.right
        property Loader cpl: centralPanelLoader

        function load(str) {
            if (str === "DefaultStatePanel") {
//                centralPanelLoader.sourceComponent = undefined
                centralPanelLoader.source = "qrc:/DefaultStatePanel.qml"
            } else {
//                centralPanelLoader.sourceComponent = undefined
                centralPanelLoader.source = "qrc:/BasePanel.qml"
                if (str === "CookBookPanel") {
                    centralPanelLoader.item.loadCookBook()
                } else if (str === "ManualBakePanel") {
                    centralPanelLoader.item.loadManualBake()
                } else if (str === "TabMenuPanel") {
                    centralPanelLoader.item.loadTabMenu()
                } else if (str === "RunningPanel") {
                    centralPanelLoader.item.loadRunning()
                } else if (str === "CameraPreview") {
                    centralPanelLoader.item.cameraPreview()
                }
            }
        }

        Loader {
            id: centralPanelLoader
            anchors.fill: parent
        }
    }
}
