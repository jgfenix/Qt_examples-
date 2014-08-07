/* Using Grid and Cell to change the color font of 'Hello World' text.
   If you click in the color cells, they'll rotate

*/
import QtQuick 1.0

Rectangle { //this is the 'background' that holds everything
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

//here we use the content of Cell.qml and create a grid of cells
        Cell { cellColor: "red"; onClicked: helloText.color = cellColor }//(row 1,colum1)
        Cell { cellColor: "green"; onClicked: helloText.color = cellColor }//(row 1,colum2)
        Cell { cellColor: "blue"; onClicked: helloText.color = cellColor }//(row 1,colum3)
        Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }//(row 2,colum1)
        Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }//(row 2,colum2)
        Cell { cellColor: "black"; onClicked: helloText.color = cellColor }//(row 2,colum3)
    }

//this Rectangle holds the content of Button.qml to create buttons without declare them
//all time
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
    MouseArea { id: mouseArea; anchors.fill: colorPicker }//anchors.fill -> the 'thing' that will be clicked

            states: State {
                name: "down"; when: mouseArea.pressed == true
                PropertyChanges { target: colorPicker; y: 160; rotation: 180}
            }

            transitions: Transition {
                         from: ""; to: "down"; reversible: true
                         ParallelAnimation {
                             NumberAnimation { properties: "y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                             ColorAnimation { duration: 500 }
                         }
                     }
}

