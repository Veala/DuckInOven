import QtQuick 2.0

Item {
    id: timeNumPad
    property int pos: 0
    property var h1
    property var h2
    property var m1
    property var m2
    function getTime() {
        timeText.curText = backend.time
    }

    Component.onCompleted: {
        h1="H"; h2="H"; m1="M"; m2="M"
        var str = "%1%2:%3%4"
        timeText.curText = str.arg(h1).arg(h2).arg(m1).arg(m2)
        timeText.curText = backend.time
        basePanel.setStatus("Status: time settings")
    }

    function changeDate(HM) {
        if (pos === 0) h1=HM
        if (pos === 1) h2=HM
        if (pos === 2) m1=HM
        if (pos === 3) m2=HM
        var str = "%1%2:%3%4"
        timeText.curText = str.arg(h1).arg(h2).arg(m1).arg(m2)
        pos+=1
        if (pos===4) pos =0;
        backend.time = timeText.curText
    }

    Text {
        id: timeText
        property var curText: qsTr("%1%2:%3%4")
        text: curText
        color: "#71e51a"
        font.pixelSize: parent.width/(30/2.5)
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/3
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    NumPadButton {
        timeTxt: "1"
        anchors.horizontalCenterOffset: -1/2*parent.width/2
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "2"
        anchors.horizontalCenterOffset: -1/4*parent.width/2
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "3"
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "4"
        anchors.horizontalCenterOffset: 1/4*parent.width/2
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "5"
        anchors.horizontalCenterOffset: 1/2*parent.width/2
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "6"
        anchors.horizontalCenterOffset: -1/2*parent.width/2
        anchors.verticalCenterOffset: 1/2*parent.height/2
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "7"
        anchors.horizontalCenterOffset: -1/4*parent.width/2
        anchors.verticalCenterOffset: 1/2*parent.height/2
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "8"
        anchors.verticalCenterOffset: 1/2*parent.height/2
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "9"
        anchors.horizontalCenterOffset: 1/4*parent.width/2
        anchors.verticalCenterOffset: 1/2*parent.height/2
        onActivated:    changeDate(timeTxt)
    }
    NumPadButton {
        timeTxt: "0"
        anchors.horizontalCenterOffset: 1/2*parent.width/2
        anchors.verticalCenterOffset: 1/2*parent.height/2
        onActivated:    changeDate(timeTxt)
    }

}
