import QtQuick 2.0

Item {
    id: cookBookPanel

    Component.onCompleted: basePanel.setStatus("Status: cook book")

    Food {
        id: duck
        anchors.verticalCenterOffset: -parent.height/4
        text: qsTr("Duck")
        onActivated: {
            chicken.disactivated()
            partridge.disactivated()
        }
    }
    Food {
        id: chicken
        anchors.verticalCenterOffset: 0
        text: qsTr("Chicken")
        onActivated: {
            duck.disactivated()
            partridge.disactivated()
        }
    }
    Food {
        id: partridge
        anchors.verticalCenterOffset: parent.height/4
        text: qsTr("Partridge")
        onActivated: {
            chicken.disactivated()
            duck.disactivated()
        }
    }
}



