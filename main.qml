import QtQuick 2.4
import QtQuick.Window 2.2
import duckinoven.backend 1.0

Window {
    visible: true
    width: 1000
    height: 285

    StateGroup {
        id: globalState
        states:[
            State {
                name: "default"
                PropertyChanges { target: powerItem; state: "default" }
                PropertyChanges { target: ovenItem; state: "default" }
                PropertyChanges { target: cookBookItem; state: "default" }
                PropertyChanges { target: manualBakeItem; state: "default" }
                PropertyChanges { target: lightItem; state: "default" }
                PropertyChanges { target: timerItem; state: "inactived" }
                PropertyChanges { target: settingsItem; state: "default" }
            },
            State {
                name: "cooking"
                PropertyChanges { target: powerItem; state: "actived2" }
                PropertyChanges { target: ovenItem; state: "inactived" }
                PropertyChanges { target: cookBookItem; state: "inactived" }
                PropertyChanges { target: manualBakeItem; state: "inactived" }
                PropertyChanges { target: lightItem; state: "actived2" }
                PropertyChanges { target: timerItem; state: "default" }
                PropertyChanges { target: settingsItem; state: "inactived" }
            },
            State {
                name: "cooked"
                PropertyChanges { target: powerItem; state: "actived1" }
                PropertyChanges { target: ovenItem; state: "default" }
                PropertyChanges { target: cookBookItem; state: "default" }
                PropertyChanges { target: manualBakeItem; state: "default" }
                PropertyChanges { target: lightItem; state: "actived1" }
                PropertyChanges { target: timerItem; state: "inactived" }
                PropertyChanges { target: settingsItem; state: "default" }
            },
            State {
                name: "stopped"
                PropertyChanges { target: powerItem; state: "default" }
                PropertyChanges { target: ovenItem; state: "default" }
                PropertyChanges { target: cookBookItem; state: "default" }
                PropertyChanges { target: manualBakeItem; state: "default" }
                PropertyChanges { target: lightItem; state: "default" }
                PropertyChanges { target: timerItem; state: "inactived" }
                PropertyChanges { target: settingsItem; state: "default" }
            }
        ]
    }


    Component.onCompleted: {
        centralPanel.load("DefaultStatePanel")
        globalState.state = "default"
        wifiItem.state = "default"
        bluetoothItem.state = "default"
    }
    Component.onDestruction: {
        centralPanelLoader.source = ""
    }

    BackEnd {
        id: backend
        onSendCookingStatus: {
            var stat = qsTr("Status: %1 is cooked!").arg(food)
            if (s === stat) {
                globalState.state = "cooked"
            } else if (s === qsTr("Status: stopped")) {
                globalState.state = ""
                globalState.state = "stopped"
            } else if (s === qsTr("Status: cooking...")) {
                powerItem.activated()
            }
        }
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
            name: "powerItem"
            defaultImage: "qrc:/pic/PowerButton_default.png"
            activeImage1: "qrc:/pic/PowerButton_active1.png"
            activeImage2: "qrc:/pic/PowerButton_active2.png"
            inactiveImage: ""
            height: parent.height/4
            anchors.horizontalCenterOffset: -parent.width/4
            onActivated: {
                if (powerItem.state === "actived1") {
                    powerItem.state = "default"
                    lightItem.state = "default"
                    return
                }
                if (globalState.state === "default" || globalState.state === "stopped" || globalState.state === "cooked") {
                    cookBookItem.state = "default"
                    manualBakeItem.state = "default"
                    ovenItem.state = "actived2"
                    centralPanel.load("RunningPanel")
                } else if (globalState.state === "cooking") {
                    backend.cooking = 0
                    //centralPanel.load("DefaultStatePanel")
                    //globalState.state = "stopped"
                }
            }
        }

        BaseButton {
            id: ovenItem
            name: "ovenItem"
            defaultImage: "qrc:/pic/OvenButton_default.png"
            activeImage1: ""
            activeImage2: "qrc:/pic/OvenButton_active2.png"
            inactiveImage:"qrc:/pic/OvenButton_inactive.png"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: -parent.height/3
            onActivated: {
                if (ovenItem.state === "default") {
                    cookBookItem.state = "default"
                    manualBakeItem.state = "default"
                    ovenItem.state = "actived2"
                    centralPanel.load("TabMenuPanel")
                } else if(ovenItem.state === "actived2") {
                    ovenItem.state = "default"
                    centralPanel.load("DefaultStatePanel")
                }
            }
        }

        BaseButton {
            id: cookBookItem
            name: "cookBookItem"
            defaultImage: "qrc:/pic/CookBookButton_default.png"
            activeImage1: ""
            activeImage2: "qrc:/pic/CookBookButton_active2.png"
            inactiveImage:"qrc:/pic/CookBookButton_inactive.png"
            anchors.horizontalCenterOffset: parent.width/4
            onActivated: {
                if (cookBookItem.state === "default") {
                    cookBookItem.state = "actived2"
                    manualBakeItem.state = "default"
                    ovenItem.state = "default"
                    centralPanel.load("CookBookPanel")
                } else if (cookBookItem.state === "actived2") {
                    cookBookItem.state = "default"
                    centralPanel.load("DefaultStatePanel")
                }
            }
        }

        BaseButton {
            id: manualBakeItem
            name: "manualBakeItem"
            defaultImage: "qrc:/pic/MoreButton_default.png"
            activeImage1: ""
            activeImage2: "qrc:/pic/MoreButton_active2.png"
            inactiveImage:"qrc:/pic/MoreButton_inactive.png"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: parent.height/3
            onActivated: {
                if (manualBakeItem.state === "default") {
                    cookBookItem.state = "default"
                    manualBakeItem.state = "actived2"
                    ovenItem.state = "default"
                    centralPanel.load("ManualBakePanel")
                } else if (manualBakeItem.state === "actived2") {
                    manualBakeItem.state = "default"
                    centralPanel.load("DefaultStatePanel")
                }
            }
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
            name: "lightItem"
            defaultImage: "qrc:/pic/Light_default.png"
            activeImage1: "qrc:/pic/Light_active1.png"
            activeImage2: "qrc:/pic/Light_active2.png"
            inactiveImage:"qrc:/pic/Light_inactive.png"
            anchors.horizontalCenterOffset: -parent.width/4
            anchors.verticalCenterOffset: -parent.height/3
        }

        BaseButton {
            id: timerItem
            name: "timerItem"
            defaultImage: "qrc:/pic/TimerButton_default.png"
            activeImage1: ""
            activeImage2: ""
            inactiveImage:"qrc:/pic/TimerButton_inactive.png"
            anchors.horizontalCenterOffset: -parent.width/4
            onActivated: {
                if (globalState.state === "cooking")
                    centralPanel.load("RunningPanel")
            }
        }

        BaseButton {
            id: settingsItem
            name: "settingsItem"
            defaultImage: "qrc:/pic/SettingsButton_default.png"
            activeImage1: ""
            activeImage2: ""
            inactiveImage:"qrc:/pic/SettingsButton_inactive.png"
            anchors.horizontalCenterOffset: -parent.width/4
            anchors.verticalCenterOffset: parent.height/3
            onActivated: {
                console.log("Unknown functionality...")
            }
        }

        BaseButton {
            id: bluetoothItem
            name: "bluetoothItem"
            defaultImage: "qrc:/pic/BluetoothButton_default.png"
            activeImage1: "qrc:/pic/BluetoothButton_active1.png"
            activeImage2: "qrc:/pic/BluetoothButton_active2.png"
            inactiveImage:"qrc:/pic/BluetoothButton_inactive.png"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: -parent.height/3
            onActivated: {
                if (bluetoothItem.state === "default") {
                    bluetoothItem.state = "actived1"
                    backend.bluetooth = 1
                } else {
                    bluetoothItem.state = "default"
                    backend.bluetooth = 0
                }
            }
        }

        BaseButton {
            id: wifiItem
            name: "wifiItem"
            defaultImage: "qrc:/pic/WifiButton_default.png"
            activeImage1: "qrc:/pic/WifiButton_active1.png"
            activeImage2: "qrc:/pic/WifiButton_active2.png"
            inactiveImage:"qrc:/pic/WifiButton_inactive.png"
            anchors.horizontalCenterOffset: parent.width/4
            onActivated: {
                if (wifiItem.state === "default") {
                    wifiItem.state = "actived1"
                    backend.wifi = 1
                } else {
                    wifiItem.state = "default"
                    backend.wifi = 0
                }
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
                centralPanelLoader.source = "qrc:/DefaultStatePanel.qml"
            } else {
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
