import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


CheckBox {
    style: CheckBoxStyle {
        indicator: Rectangle {
            color: '#5C57AD'
            implicitWidth: 10
            implicitHeight: 10

            Image {
                visible: control.checked
                source: '../images/check.png'

                anchors.fill: parent
            }
        }

        label: Text {
            color: '#FFF'
            text: control.text

            font.family: titleFont.name
            font.pixelSize: 12
        }
    }

    FontLoader {
        id: titleFont
        source: '../fonts/PangMenZhengDao.ttf'
    }
}
