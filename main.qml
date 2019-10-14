import QtQuick 2.4
import QtQuick.Window 2.2
import duckinoven.backend 1.0

Window {
    visible: true
    width: 1000
    height: 285

    Component.onCompleted: {
        centralPanelLoader.source = "qrc:/DefaultStatePanel.qml";
        backend.sendTime.connect(centralPanelLoader.item.setLocalTime)
        backend.sendDate.connect(centralPanelLoader.item.setLocalDate)
    }

    BackEnd {
        id: backend
        function setTemp(temp) {
            backend.temp = temp
        }

        function setTime(time) {
            backend.time = time
        }

        onTempChanged: {
            if (centralPanelLoader.item.centralPanelLoader_2.source.toString() === "qrc:/TabMenuPanel.qml")
                centralPanelLoader.item.centralPanelLoader_2.item.temp = backend.temp
        }
        onTimeChanged: {
            if (centralPanelLoader.item.centralPanelLoader_2.source.toString() === "qrc:/TabMenuPanel.qml")
                centralPanelLoader.item.centralPanelLoader_2.item.time = backend.time
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
            color: "red"
            height: parent.height/4
            anchors.horizontalCenterOffset: -parent.width/4
            onActivated: {
                if (centralPanelLoader.source.toString() !== "qrc:/DefaultStatePanel.qml") {
                    if (centralPanelLoader.item.centralPanelLoader_2.source.toString() !== "qrc:/RunningPanel.qml") {
                        //centralPanelLoader.item.cameraButton.source = ""

                        centralPanelLoader.item.nextOrCancelButton.item.activated.disconnect(centralPanelLoader.item.centralPanelLoader_2.item.nextButton)
                        centralPanelLoader.item.centralPanelLoader_2.item.running.disconnect(powerItem.activated)


                        centralPanelLoader.item.nextOrCancelButton.source = "qrc:/BottomButton1.qml"
                        centralPanelLoader.item.nextOrCancelButton.item.txt = "CANCEL"
                        centralPanelLoader.item.cameraButton.source = "qrc:/BottomButton2.qml"
                        centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/RunningPanel.qml"
                        //centralPanelLoader.item.nextOrCancelButton.item.parent = centralPanelLoader.item.centralPanelLoader_2
                    }
                } else {
                    backend.sendTime.disconnect(centralPanelLoader.item.setLocalTime)
                    backend.sendDate.disconnect(centralPanelLoader.item.setLocalDate)
                    centralPanelLoader.source = "qrc:/BasePanel.qml"
                    centralPanelLoader.item.nextOrCancelButton.source = "qrc:/BottomButton1.qml"
                    centralPanelLoader.item.nextOrCancelButton.item.txt = "CANCEL"
                    centralPanelLoader.item.cameraButton.source = "qrc:/BottomButton2.qml"
                    centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/RunningPanel.qml"
                    backend.sendTime.connect(centralPanelLoader.item.setLocalTime)

                    //centralPanelLoader.item.nextOrCancelButton.item.parent = centralPanelLoader.item.centralPanelLoader_2
                }
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
                        centralPanelLoader.item.nextOrCancelButton.source = "qrc:/BottomButton1.qml"
                        centralPanelLoader.item.nextOrCancelButton.item.txt = "NEXT"
                        centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/TabMenuPanel.qml"


                        centralPanelLoader.item.nextOrCancelButton.item.activated.connect(centralPanelLoader.item.centralPanelLoader_2.item.nextButton)
                        centralPanelLoader.item.centralPanelLoader_2.item.running.connect(powerItem.activated)


                        backend.sendTime.connect(centralPanelLoader.item.setLocalTime)
                        centralPanelLoader.item.centralPanelLoader_2.item.setTime.connect(backend.setTime)
                        centralPanelLoader.item.centralPanelLoader_2.item.setTemp.connect(backend.setTemp)
                        centralPanelLoader.item.centralPanelLoader_2.item.time = backend.time
                        centralPanelLoader.item.centralPanelLoader_2.item.temp = backend.temp
                        //centralPanelLoader.item.nextOrCancelButton.item.parent = centralPanelLoader.item.centralPanelLoader_2
                    }
                } else {
                    backend.sendTime.disconnect(centralPanelLoader.item.setLocalTime)
                    backend.sendDate.disconnect(centralPanelLoader.item.setLocalDate)
                    centralPanelLoader.source = "qrc:/BasePanel.qml"
                    centralPanelLoader.item.nextOrCancelButton.source = "qrc:/BottomButton1.qml"
                    centralPanelLoader.item.nextOrCancelButton.item.txt = "NEXT"
                    centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/TabMenuPanel.qml"


                    centralPanelLoader.item.nextOrCancelButton.item.activated.connect(centralPanelLoader.item.centralPanelLoader_2.item.nextButton)
                    centralPanelLoader.item.centralPanelLoader_2.item.running.connect(powerItem.activated)



                    backend.sendTime.connect(centralPanelLoader.item.setLocalTime)
                    centralPanelLoader.item.centralPanelLoader_2.item.setTime.connect(backend.setTime)
                    centralPanelLoader.item.centralPanelLoader_2.item.setTemp.connect(backend.setTemp)
                    centralPanelLoader.item.centralPanelLoader_2.item.time = backend.time
                    centralPanelLoader.item.centralPanelLoader_2.item.temp = backend.temp

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
                    backend.sendTime.disconnect(centralPanelLoader.item.setLocalTime)
                    backend.sendDate.disconnect(centralPanelLoader.item.setLocalDate)
                    centralPanelLoader.source = "qrc:/BasePanel.qml"
                    centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/CookBookPanel.qml"
                    backend.sendTime.connect(centralPanelLoader.item.setLocalTime)

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
                    backend.sendTime.disconnect(centralPanelLoader.item.setLocalTime)
                    backend.sendDate.disconnect(centralPanelLoader.item.setLocalDate)
                    centralPanelLoader.source = "qrc:/BasePanel.qml"
                    centralPanelLoader.item.centralPanelLoader_2.source = "qrc:/ManualBakePanel.qml"
                    backend.sendTime.connect(centralPanelLoader.item.setLocalTime)

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
