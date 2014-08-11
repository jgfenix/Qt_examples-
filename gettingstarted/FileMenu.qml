import QtQuick 1.0

Rectangle {
    id: fileMenu
    property string menuName: "File"
    height: 600; width:600
    color: "#6C646A"

    Rectangle{
        id:actionContainer

        color:"transparent"
        anchors.centerIn: parent
        width: parent.width / 1.5; height: parent.height / 5

        Row{
            anchors.centerIn: parent
            spacing: parent.width/6
            Button{
                id: loadButton
                buttonColor: "lightgrey"
                label: "Load"
            }

            Button{
                buttonColor: "grey"
                id: saveButton
                label: "Save"
            }
            Button{
                id: exitButton
                label: "Exit"
                buttonColor: "darkgrey"

                //exit the application if the exitButton is clicked
                onButtonClick:{
                    Qt.quit()
                }
            }
        }
    }
}

