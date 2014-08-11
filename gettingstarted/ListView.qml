import QtQuick 1.1

Rectangle {
    width: 100
    height: 62

    VisualItemModel{
            id: menuListModel
            FileMenu{
                width: menuListView.width
                height: menuBar.height
                color: fileColor
            }
            EditMenu{
                color: editColor
                width:  menuListView.width
                height: menuBar.height
            }
        }


}
