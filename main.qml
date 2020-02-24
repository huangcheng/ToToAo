import QtQuick 2.10
import QtQuick.Window 2.10
import QtMultimedia 5.0

import './components'
import './modals'

Window {
    id: window
    visible: true
    width: 375
    height: 637
    minimumWidth: 375
    minimumHeight: 637
    maximumWidth: 375
    maximumHeight: 637
    title: qsTr('ToTo凹')
    color: '#F6F6F6'
    flags: Qt.CustomizeWindowHint |
           Qt.WindowTitleHint |
           Qt.WindowCloseButtonHint |
           Qt.WindowMinimizeButtonHint

    property bool isSettingVisible: false
    property bool isResting: false
    property string activityType: ''

    property int activityDuration: 0
    property int restingDuration: 0
    property int frequency: 0
    property bool isShaking: false
    property bool isAlerting: false

    SequentialAnimation {
        id: shakingAnimation

        property int x: window.x
        property int y: window.y

        NumberAnimation { target: window; property: 'x'; to: x - 3; duration: 25 }
        NumberAnimation { target: window; property: 'y'; to: y - 3; duration: 25 }
        NumberAnimation { target: window; property: 'x'; to: x + 6; duration: 25 }
        NumberAnimation { target: window; property: 'y'; to: y + 6; duration: 25 }
        NumberAnimation { target: window; property: 'x'; to: x - 6; duration: 25 }
        NumberAnimation { target: window; property: 'y'; to: y - 6; duration: 25 }
        NumberAnimation { target: window; property: 'x'; to: x - 6; duration: 25 }
        NumberAnimation { target: window; property: 'y'; to: y - 6; duration: 25 }
        NumberAnimation { target: window; property: 'x'; to: x + 6; duration: 25 }
        NumberAnimation { target: window; property: 'y'; to: y + 6; duration: 25 }
        NumberAnimation { target: window; property: 'x'; to: x - 6; duration: 25 }
        NumberAnimation { target: window; property: 'y'; to: y - 6; duration: 25 }
        NumberAnimation { target: window; property: 'x'; to: x + 6; duration: 25 }
        NumberAnimation { target: window; property: 'y'; to: y + 6; duration: 25 }
        NumberAnimation { target: window; property: 'x'; to: x - 3; duration: 25 }
        NumberAnimation { target: window; property: 'y'; to: y - 3; duration: 25 }
    }

    SoundEffect {
        id: sound
        source: './sounds/alarm.wav'
    }

    function startTimer(type, duration) {
        timer.setSource('./pages/Timer.qml',
                        {
                            type: type,
                            duration: duration * 60

                        }
                        )
    }

    Image {
        anchors.fill: parent
        source: './images/bg.png'
    }

    Image {
        id: slogan
        width: 208
        height: 295
        source: './images/slogan.png'

        anchors.top: parent.top
        anchors.topMargin: 21
        anchors.right: parent.right
        anchors.leftMargin: 12
    }

    Button {
        id: gamingButton
        image: '../images/working_button.png'

        anchors.top: slogan.bottom
        anchors.topMargin: 11
        anchors.right: parent.right
        anchors.rightMargin: 12

        onClicked: {
            activityType = '游戏'

            isSettingVisible = true
        }
    }

    Button {
        id: learningButton
        image: '../images/learning_button.png'

        anchors.top: gamingButton.bottom
        anchors.topMargin: 11
        anchors.right: parent.right
        anchors.rightMargin: 12

        onClicked: {
            activityType = '学习'

            isSettingVisible = true
        }
    }

    Button {
        id: workingButton
        image: '../images/gaming_button.png'

        anchors.top: learningButton.bottom
        anchors.topMargin: 11
        anchors.right: parent.right
        anchors.rightMargin: 12

        onClicked: {
            activityType = '工作'

            isSettingVisible = true
        }
    }

    Setting {
        id: settingPopup
        type: activityType
        visible: isSettingVisible
        anchors.centerIn: parent

        onClosed: isSettingVisible = false
        onConfirmed: {
            window.activityDuration = activityDuration
            window.restingDuration = restingDuration
            window.frequency = frequency
            window.isShaking = isShaking
            window.isAlerting = isAlerting

            isSettingVisible = false

            startTimer(activityType, activityDuration)

        }
    }

    Loader {
        id: timer
    }

    Timer {
        id: clock
        interval: 1000
        onTriggered: {
            isResting = !isResting

            var duration = isResting ? restingDuration : activityDuration
            var title = isResting ? '休息' : activityType

            if (!isResting) {
                --frequency
            }

            if (frequency >= 0) {
                startTimer(title, duration)
            } else {
                timer.source = ''
            }
        }
    }

    Connections {
        target: timer.item
        onFired: {
            window.flags |= Qt.WindowStaysOnTopHint

            clock.start()

            if (isShaking) {
                shakingAnimation.start()
            }

            if (isAlerting) {
                sound.play()
            }

            window.flags &= ~Qt.WindowStaysOnTopHint
        }
    }
}
