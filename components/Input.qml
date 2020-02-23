import QtQuick 2.10

Rectangle {
    width: 200
    height: 30
    color: '#5B57AD'
    radius: 10

    property alias isFocus: input.focus
    property alias title: title.text
    property alias unit: unit.text

    signal editingFinished(string text)

    FontLoader {
        id: titleFont
        source: '../fonts/PangMenZhengDao.ttf'
    }

    Text {
        id: title
        color: '#FFF'

        font.family: titleFont.name
        font.pixelSize: 12

        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    TextInput {
        id: input
        color: '#FFF'
        width: parent.width - title.width - unit.width - 20
        horizontalAlignment: Text.AlignRight
        padding: 5

        font.family: titleFont.name
        font.pixelSize: 12

        anchors.left: title.right
        anchors.verticalCenter: parent.verticalCenter

        onEditingFinished: parent.editingFinished(input.text)
    }

    Text {
        id: unit
        color: '#FFF'

        font.family: titleFont.name
        font.pixelSize: 12

        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }
}
