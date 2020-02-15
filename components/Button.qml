import QtQuick 2.10

Rectangle {
    width: 148
    height: 48
    radius: 10
    color: '#e5e5e5'

    property alias text: text.text

    signal clicked(var mouse)

    MouseArea {
       anchors.fill: parent
       onClicked: parent.clicked(mouse)

       Text {
           id: text
           color: '#707070'
           x: parent.width / 2 - text.width / 2 + 10

           anchors.verticalCenter: parent.verticalCenter

           font.pixelSize: 16
           font.bold: true
       }
    }
}
