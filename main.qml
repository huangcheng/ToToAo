import QtQuick 2.10
import QtQuick.Window 2.10

import './components'

Window {
    visible: true
    width: 375
    height: 637
    title: qsTr('ToTo凹')
    color: '#F6F6F6'

    Text {
        id: slogan
        color: '#707070'
        text: qsTr('保护你的腰')

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 128
        anchors.rightMargin: 29

        font.pointSize: 48
    }

    Button {
        id: workingButton
        text: qsTr('工作')

        anchors.top: slogan.bottom
        anchors.topMargin: 53
        anchors.right: parent.right
        anchors.rightMargin: 61
    }

    Button {
        id: learningButton
        text: qsTr('学习')

        anchors.top: workingButton.bottom
        anchors.topMargin: 27
        anchors.right: parent.right
        anchors.rightMargin: 40
    }

    Button {
        id: gamingButton
        text: qsTr('游戏')

        anchors.top: learningButton.bottom
        anchors.topMargin: 39
        anchors.right: parent.right
        anchors.rightMargin: 13
    }
}
