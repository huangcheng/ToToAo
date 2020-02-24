import QtQuick 2.10

Rectangle {
    width: 375
    height: 637

    property string type: ''
    property int duration: 0

    signal fired()

    function secondsToHms(d) {
        d = Number(d);
        var h = Math.floor(d / 3600);
        var m = Math.floor(d % 3600 / 60);
        var s = Math.floor(d % 3600 % 60);

        h = h < 0 ? 0 : h
        m = m < 0 ? 0 : m
        s = s < 0 ? 0 : s

        h = h < 10 ? '0' + h : h
        m = m < 10 ? '0' + m : m
        s = s < 10 ? '0' + s : s

        return qsTr(h + ':' + m + ':' + s)
    }

    FontLoader {
        id: roboto
        source: '../fonts/Roboto.ttf'
    }

    Image {
        source: '../images/timer_bg.jpg'

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
            text: qsTr(type + '倒计时ing')
            color: '#B7A5E6'

            font.pixelSize: 20

            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 18
        }

        Text {
            id: counting
            text: secondsToHms(duration)
            color: '#DCD4ED'

            font.family: roboto.name
            font.pixelSize: 76

            anchors.centerIn: parent
        }
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            if (duration <= 0) {
                timer.running = false;

                fired()
            }

            --duration
        }
    }

    Component.onCompleted: {
        timer.start()
    }
}
