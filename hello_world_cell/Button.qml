import QtQuick 1.0

Rectangle {
    id: button
    width: 60
    height: 60
    color: "lightgreen"
    property alias text: label.text

    Text {
        id: label
        text:"button"
        //y: 20; x:100
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 12; font.bold: true
        color:"white"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: console.log(text +" clicked")
    }
}
