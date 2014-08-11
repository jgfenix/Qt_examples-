import QtQuick 1.0

Rectangle {
    id: screen
    width: 600; height: 600
    property int partition: height/3
    state: "DRAWER_OPEN"

    MenuBar{
        id:menuBar
        height: partition
        width:parent.width
        z:1
    }

    TextArea{
        id:textArea
        y:drawer.height
        border.color: Qt.darker(color, 1.4)
        border.width: 2
        color: "#3F3F3F"
        fontColor: "#DCDCCC"
        height: partition*2
        width:parent.width
    }

    Rectangle{
        id:drawer
        height:15
        width: parent.width
        border.color : "#6A6D6A"
        border.width: 1

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#8C8F8C" }
            GradientStop { position: 0.17; color: "#6A6D6A" }
            GradientStop { position: 0.77; color: "#3F3F3F" }
            GradientStop { position: 1.0; color: "#6A6D6A" }
            }

        Image{
            id: arrowIcon
            source: "arrow.png"
            anchors.horizontalCenter: parent.horizontalCenter

            Behavior{NumberAnimation{property: "rotation";easing.type: Easing.OutExpo }}
        }

        MouseArea{
            id: drawerMouseArea
            anchors.fill:parent
            onClicked:{
                if (screen.state == "DRAWER_CLOSED"){
                    screen.state = "DRAWER_OPEN"
                    console.log("drawer OPEN")
                }
                else if (screen.state == "DRAWER_OPEN"){
                    screen.state = "DRAWER_CLOSED"
                    console.log("drawer closed")
                }
            }

            hoverEnabled: true

            onEntered: parent.border.color = Qt.lighter("#6A6D6A")
            onExited:  parent.border.color = "#6A6D6A"
        }

    }
    states:[
        State{
            name: "DRAWER_OPEN"
            PropertyChanges { target: menuBar; y:0}
            PropertyChanges { target: textArea; y: partition + drawer.height}
            PropertyChanges { target: drawer; y: partition}
            PropertyChanges { target: arrowIcon; rotation: 180}
        },
        State{
            name: "DRAWER_CLOSED"
            PropertyChanges { target: menuBar; y:-partition}
            PropertyChanges { target: textArea; y: drawer.height; height: screen.height - drawer.height}
            PropertyChanges { target: drawer; y: 0}
            PropertyChanges { target: arrowIcon; rotation: 0}
        }

    ]
    transitions: [
        Transition{
            to: "*"
            NumberAnimation { target: textArea; properties: "y, height"; duration: 100; easing.type:Easing.OutExpo }
            NumberAnimation { target: menuBar; properties: "y"; duration: 100;easing.type: Easing.OutExpo }
            NumberAnimation { target: drawer; properties: "y"; duration: 100;easing.type: Easing.OutExpo }
        }

    ]
}
