import QtQuick 1.1

Rectangle {
    id: menuBar
    width: 600
    height:300

    property color fileColor: "thistle"
    property color editColor: "powderblue"

    Rectangle{
        id: labelList
        height:parent.height/10
        width: parent.width
        color: "steelblue"
        z: 1
        Row{
            anchors.centerIn: parent
            spacing:40
            Button{
                height: 20
                width: 50
                label: "File"
                id: fileButton
                buttonColor : menuListView.currentIndex == 0? fileColor : Qt.darker(fileColor, 1.5)
                scale: menuListView.currentIndex == 0? 1.25: 1
                radius: 1

                onButtonClick: {
                    menuListView.currentIndex = 0
                }
            }
            Button{
                height: 20
                width: 50
                id: editButton
                buttonColor : menuListView.currentIndex == 1?  editColor : Qt.darker(editColor, 1.5)
                scale: menuListView.currentIndex == 1? 1.25: 1
                label: "Edit"
                radius: 1

                onButtonClick: {
                    menuListView.currentIndex = 1
                }
            }
        }
    }

    VisualItemModel{
        id: menuListModel
        FileMenu{
            width: menuListView.width
            height: menuBar.height
            color: fileColor
        }
        /*EditMenu{
            color: editColor
            width:  menuListView.width
            height: menuBar.height
        }*/
    }

    ListView{
        id: menuListView
        anchors.fill:parent
        anchors.bottom: parent.bottom
        width:parent.width
        height: parent.height

        model: menuListModel

        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickDeceleration: 5000
        highlightFollowsCurrentItem: true
        highlightMoveDuration:240
        highlightRangeMode: ListView.StrictlyEnforceRange
    }
}
