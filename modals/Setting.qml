import QtQuick 2.10

import '../components';

Rectangle {
    id: root
    color: '#3B3259'
    width: 266
    height: 300
    radius: 16

    property string type: ''

    property int activityDuration: 0
    property int restingDuration: 0
    property int frequency: 0
    property bool isShaking: false
    property bool isAlerting: false

    signal closed()
    signal confirmed(int activityDuration,
                     int restingDuration,
                     int frequency,
                     bool isShaking,
                     bool isAlerting)

    FontLoader {
        id: titleFont
        source: '../fonts/PangMenZhengDao.ttf'
    }

    MouseArea {
        id: closeButton
        width: 20
        height: 20

        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8

        Image {
            source: '../images/close.png'

            anchors.fill: parent
        }

        onClicked: parent.closed()
    }

    Input {
        id: activityInput
        title: qsTr(type + '时间:')
        unit: qsTr('分')
        isFocus: true


        anchors.top: closeButton.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter

        onTextChanged: activityDuration = parseInt(text, 10)
    }

    Input {
        id: restingInput
        title: qsTr('休息时间:')
        unit: qsTr('分')

        anchors.top: activityInput.bottom
        anchors.topMargin: 13
        anchors.horizontalCenter: parent.horizontalCenter

        onTextChanged: restingDuration = parseInt(text, 10)
    }

    Input {
        id: frequencyInput
        title: qsTr('提醒频次:')
        unit: qsTr('次')

        anchors.top: restingInput.bottom
        anchors.topMargin: 13
        anchors.horizontalCenter: parent.horizontalCenter

        onTextChanged: frequency = parseInt(text, 10)
    }

    Text {
        id: notificationTitle
        text: qsTr('提醒模式:')
        color: '#FFF'

        font.family: titleFont.name
        font.pixelSize: 12

        anchors.top: frequencyInput.bottom
        anchors.topMargin: 14
        anchors.left: parent.left
        anchors.leftMargin: 43
    }

    Rectangle {
        id: checkGroup
        width: parent.width
        anchors.top: notificationTitle.bottom
        anchors.topMargin: 11

        CheckBox {
            id: shakingCheckBox
            text: qsTr('抖动')

            anchors.left: parent.left
            anchors.leftMargin: 43
            anchors.verticalCenter: parent.verticalCenter

            onClicked: isShaking = shakingCheckBox.checked
        }

        CheckBox {
            id: soundCheckBox
            text: qsTr('音乐')

            anchors.left: shakingCheckBox.right
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter

            onClicked: isAlerting = soundCheckBox.checked
        }

        Text {
            text: qsTr('无羁')
            color: '#FFF'

            font.family: titleFont.name
            font.pixelSize: 12

            anchors.right: parent.right
            anchors.rightMargin: 41
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        color: '#5C57AD'
        width: 80
        height: 30
        radius: 10

        anchors.top: checkGroup.bottom
        anchors.topMargin: 35
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            anchors.fill: parent

            Text {
                text: '确定'
                color: '#FFF'

                font.family: titleFont.name
                font.pixelSize: 12

                anchors.centerIn: parent
            }

            onClicked: root.confirmed(activityDuration,
                                      restingDuration,
                                      frequency,
                                      isShaking,
                                      isAlerting)
        }
    }
}
