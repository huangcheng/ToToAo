import QtQuick 2.10
import QtQuick.Window 2.10

import './components'
import './popups'

Window {
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
    property string activityType: ''


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
            console.log(activityDuration,
                        restingDuration,
                        frequency,
                        isShaking,
                        isAlerting)

            isSettingVisible = false

            workingTimer.source = './pages/WorkingTimer.qml'

        }
    }

    Loader {
        id: workingTimer
    }
}
