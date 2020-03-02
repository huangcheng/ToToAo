import QtQuick 2.10

Item {
    id: root
    width: 266
    height: 300

    signal closed()

    Image {
        source: '../images/about.png'
        anchors.fill: parent

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

            onClicked: root.closed()
        }
    }
}
