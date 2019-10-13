import QtQuick 2.0

Item {
    id: manualBakePanel
    anchors.horizontalCenterOffset: -parent.width/4
    anchors.verticalCenterOffset: parent.height/3
    Text {
        text: qsTr("Manual. Duck is the good food.")
        anchors.centerIn: parent
    }
}
