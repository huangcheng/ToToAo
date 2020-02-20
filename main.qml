import QtQuick 2.10
import QtQuick.Window 2.10

import './components'

Window {
    visible: true
    width: 375
    height: 637
    title: qsTr('ToTo凹')
    color: '#F6F6F6'

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
        id: workingButton
        image: '../images/working_button.png'

        anchors.top: slogan.bottom
        anchors.topMargin: 11
        anchors.right: parent.right
        anchors.rightMargin: 12
    }

    Button {
        id: learningButton
        image: '../images/learning_button.png'

        anchors.top: workingButton.bottom
        anchors.topMargin: 11
        anchors.right: parent.right
        anchors.rightMargin: 12
    }

    Button {
        id: gamingButton
        image: '../images/gaming_button.png'

        anchors.top: learningButton.bottom
        anchors.topMargin: 11
        anchors.right: parent.right
        anchors.rightMargin: 12
    }
}
