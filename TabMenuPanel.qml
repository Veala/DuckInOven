import QtQuick 2.0

Item {
    id: tabMenuPanel

    signal setTemp(var t)
    signal setTime(var t)
    signal getTemp(var t)
    signal getTime(var t)
    signal running()
    property var time
    property var temp
    onTempChanged: {
        getTemp(temp)
    }
    onTimeChanged: {
        getTime(time)
    }

    function nextButton() {
        if (tabMenuPanelLoader.source.toString() === "qrc:/TempSelector.qml") {
            timer.activated()
        } else if (tabMenuPanelLoader.source.toString() === "qrc:/TimeNumPad.qml") {
            tabMenuPanel.running()
        }
    }

    Component.onCompleted: {
////        tabMenuPanelLoader.source = "qrc:/TempSelector.qml"
////        tabMenuPanel.setTemp.connect(tabMenuPanelLoader.item.getTemp)
////        tabMenuPanelLoader.item.setTemp.connect(tabMenuPanel.getTemp)
//        tabMenuPanel.setTime.connect(tabMenuPanelLoader.item.getTime)
//        tabMenuPanelLoader.item.setTime.connect(tabMenuPanel.getTime)
        temperature.activated()
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
//                timer.disactivated()
                if (tabMenuPanelLoader.source.toString() === "qrc:/TimeNumPad.qml") {
                    timer.disactivated()
                    tabMenuPanel.getTime.disconnect(tabMenuPanelLoader.item.getTime)
                    tabMenuPanelLoader.item.setTime.disconnect(tabMenuPanel.setTime)
                }
                tabMenuPanelLoader.source = "qrc:/TempSelector.qml"
                tabMenuPanel.getTemp.connect(tabMenuPanelLoader.item.getTemp)
                tabMenuPanelLoader.item.setTemp.connect(tabMenuPanel.setTemp)
                tabMenuPanelLoader.item.getTemp(tabMenuPanel.temp)
            }
        }
        TabButtonDIO {
            id: timer
            anchors.horizontalCenterOffset: -1/4*parent.width/2
            Component.onCompleted: buttonText = qsTr("Timer")
            onActivated: {
//                temperature.disactivated()
                if (tabMenuPanelLoader.source.toString() === "qrc:/TempSelector.qml") {
                    temperature.disactivated()
                    tabMenuPanel.getTemp.disconnect(tabMenuPanelLoader.item.getTemp)
                    tabMenuPanelLoader.item.setTemp.disconnect(tabMenuPanel.setTemp)
                }
                tabMenuPanelLoader.source = "qrc:/TimeNumPad.qml"
                tabMenuPanel.getTime.connect(tabMenuPanelLoader.item.getTime)
                tabMenuPanelLoader.item.setTime.connect(tabMenuPanel.setTime)
                tabMenuPanelLoader.item.getTime(tabMenuPanel.time)
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
