import QtQuick 2.10

Rectangle {
    width: 375
    height: 637

    Image {
        source: '../images/working_timer_bg.jpg'

        anchors.fill: parent
    }

    Rectangle {
        color: 'transparent'
        width: 327
        height: 175

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 128

        Text {
            id: title
            text: qsTr('工作倒计时ing')
            color: '#B7A5E6'

            font.pixelSize: 20

            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 18
        }

        Text {
            id: timer
            text: qsTr('00:00:00')
            color: '#DCD4ED'

            font.pixelSize: 76

            anchors.centerIn: parent
        }
    }
}
