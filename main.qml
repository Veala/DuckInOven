import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1000
    height: 400

    Component.onCompleted: {
        centralPanelLoader.source = "qrc:/DefaultStatePanel.qml";
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
            onActivated: {
                console.log(color)
            }
        }

        BaseButton {
            id: ovenItem
            color: "green"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: -parent.height/3
            onActivated: {
                if (centralPanelLoader.source.toString() !== "qrc:/DefaultStatePanel.qml") {
                    if (centralPanelLoader.item.centralPanelLoader_2.source.toString() !== "qrc:/TabMenuPanel.qml") {
                        centralPanelLoader.item.cameraButton.source = ""
                        centralPanelLoader.item.nextOrCancelButton.source = "qrc:/BaseButton.qml"
                        centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/TabMenuPanel.qml"
                        //centralPanelLoader.item.nextOrCancelButton.item.parent = centralPanelLoader.item.centralPanelLoader_2
                    }
                } else {
                    centralPanelLoader.source = "qrc:/BasePanel.qml"
                    centralPanelLoader.item.nextOrCancelButton.source = "qrc:/BaseButton.qml"
                    centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/TabMenuPanel.qml"
                    //centralPanelLoader.item.nextOrCancelButton.item.parent = centralPanelLoader.item.centralPanelLoader_2
                }
            }
        }

        BaseButton {
            id: cookBookItem
            color: "yellow"
            anchors.horizontalCenterOffset: parent.width/4
            onActivated: {
                if (centralPanelLoader.source.toString() !== "qrc:/DefaultStatePanel.qml") {
                    if (centralPanelLoader.item.centralPanelLoader_2.source.toString() !== "qrc:/CookBookPanel.qml") {
                        centralPanelLoader.item.cameraButton.source = ""
                        centralPanelLoader.item.nextOrCancelButton.source = ""
                        centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/CookBookPanel.qml"
                    }
                } else {
                    centralPanelLoader.source = "qrc:/BasePanel.qml"
                    centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/CookBookPanel.qml"
                }
            }
        }

        BaseButton {
            id: manualBakeItem
            color: "blue"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: parent.height/3
            onActivated: {
                if (centralPanelLoader.source.toString() !== "qrc:/DefaultStatePanel.qml") {
                    if (centralPanelLoader.item.centralPanelLoader_2.source.toString() !== "qrc:/ManualBakePanel.qml") {
                        centralPanelLoader.item.cameraButton.source = ""
                        centralPanelLoader.item.nextOrCancelButton.source = ""
                        centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/ManualBakePanel.qml"
                    }
                } else {
                    centralPanelLoader.source = "qrc:/BasePanel.qml"
                    centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/ManualBakePanel.qml"
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
                console.log(color)
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
        Loader {
            id: centralPanelLoader
            anchors.fill: parent
            //anchors.centerIn: parent
        }
    }
}
