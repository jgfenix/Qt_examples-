import QtQuick 1.1

Rectangle {
    id:page
    width: 200
    height: 200
    color: "lightblue"

    Text {
        id: helloText
        text: "Hello Qt"
        anchors.horizontalCenterOffset: 0
        y:84
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 20;
        font.bold: true ;
        font.italic: true
    }
}
