import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 500
    height: 200
    property var centralComponent
    property var centralObject

    Component.onCompleted: {
        centralComponent = Qt.createComponent("qrc:/DefaultStatePanel.qml");
        if(centralComponent.status === Component.Ready)
            centralObject = centralComponent.createObject(centralPanel);
        else if (centralComponent.status === Component.Error)
           console.log("Error loading component:", component.errorString());
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
                console.log(color)
            }
        }

        BaseButton {
            id: cookBookItem
            color: "yellow"
            anchors.horizontalCenterOffset: parent.width/4
            onActivated: {
                centralObject.destroy();
                centralComponent = Qt.createComponent("qrc:/CookBookPanel.qml");
                if(centralComponent.status === Component.Ready)
                    centralObject = centralComponent.createObject(centralPanel);
                else if (centralComponent.status === Component.Error)
                   console.log("Error loading component:", component.errorString());
            }
        }

        BaseButton {
            id: moreItem
            color: "blue"
            anchors.horizontalCenterOffset: parent.width/4
            anchors.verticalCenterOffset: parent.height/3
            onActivated: {
                console.log(color)
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

    Item {
        id: centralPanel
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: leftPanel.right
        anchors.right: rightPanel.left
    }
}
