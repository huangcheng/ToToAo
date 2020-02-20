import QtQuick 2.10

Rectangle {
    width: 184
    height: 56
    color: 'transparent'

    property string image: ''
    signal clicked(var mouse)

    MouseArea {
       anchors.fill: parent

       onClicked: parent.clicked(mouse)

       Image {
           source: image

           anchors.fill: parent
       }
    }
}
