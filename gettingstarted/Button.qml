import QtQuick 1.0

Rectangle {
    id: button
    property string label: "button label"
    property int buttonHeight: 75
    property int buttonWidth: 150
    property color onHoverColor: "gold"
    property color borderColor: "white"
    property color buttonColor: "lightblue"

    radius:10
    smooth: true
    border{color: "white"; width: 3}
    width: buttonWidth; height: buttonHeight

    Text{
        id: buttonLabel
        anchors.centerIn: parent
        text: label
    }

    signal buttonClick()
    onButtonClick: {
        console.log(buttonLabel.text + " clicked" )
    }

    MouseArea{
        id: buttonMouseArea
        anchors.fill: parent    //stretch the area to the parent's dimension
        onClicked: buttonClick()

                hoverEnabled: true
                onEntered: parent.border.color = onHoverColor
                onExited:  parent.border.color = borderColor
    }
    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor
}
