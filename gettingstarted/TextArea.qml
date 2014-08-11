import QtQuick 1.0

Rectangle {
    id:textArea

    width :400
    height:400
    property color fontColor: "white"

    Flickable{
        id: flickArea

        width: parent.width
        height: parent.height
        anchors.fill:parent

        function ensureVisible(r){
            if (contentX >= r.x)
            contentX = r.x;
            else if (contentX+width <= r.x+r.width)
            contentX = r.x+r.width-width;
            if (contentY >= r.y)
            contentY = r.y;
            else if (contentY+height <= r.y+r.height)
            contentY = r.y+r.height-height;
        }

        TextEdit{
            id: textEditor
            anchors.fill:parent
            width:parent.width; height:parent.height
            color:fontColor
            focus: true

            wrapMode: TextEdit.Wrap

            onCursorRectangleChanged: flickArea.ensureVisible(cursorRectangle)
        }
    }
}
