import QtQuick 1.0

Rectangle {
    id: page
    width: 500; height: 200
    color: "#d4d4d4"

    Text {
        id: helloText
        text: "Hello world!"
        y: 30
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 24; font.bold: true
    }

    Grid {
        id: colorPicker
        x: 187; y: 113; anchors.bottom: page.bottom; anchors.bottomMargin: 34
        rows: 2; columns: 3; spacing: 3

        Cell { cellColor: "red"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "green"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "blue"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "black"; onClicked: helloText.color = cellColor }
    }

    Rectangle {
        x: 55
        y: 70
        width: 60
        height: 60
        color: "#d4d4d4"

        Column{
            anchors.centerIn: parent
            spacing: 2
            Button{ width: 56; height: 20; color: "#93ee91"}
            Button{ width: 68; height: 21; color: "blue"; text: "click me!"}
            Button{ width: 111; height: 21; color: "#93ee91"; text: "don't click me!"}
        }
    }
}

