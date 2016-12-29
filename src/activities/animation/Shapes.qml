import QtQuick 2.1

import "../../core"
import "animation.js" as Activity


Item {

    id: shapes

    property alias rectangle: rectangle
    property alias circle: circle
    property alias square: square
    property alias line: line
    Component {
        id: rectangle

        Rectangle {
            id: selComp
            property string type: "rectangle"
            border {
                width: 2
                color: "black"
            }
            color: "#354682B4"
            property int rulersSize: 15
            property bool selected: canvas.canvasFocus === selComp ? 1 : 0

            MouseArea {     // drag mouse area
                anchors.fill: parent
                drag{
                    target: parent
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: canvas.canvasFocus = selComp

                onDoubleClicked: {
                    parent.destroy()        // destroy component
                }
            }

            Resize {
                id: resize
                anchors.fill: parent
                property string type: 'rectangle'
            }


        }

    }



    Component {
        id: circle

        Rectangle {
            id: selComp
            property string type: "circle"
            border {
                width: 2
                color: "black"
            }
            radius: width/2
            color: "#354682B4"
            property int rulersSize: 15
            property bool selected: canvas.canvasFocus === selComp ? 1 : 0

            MouseArea {     // drag mouse area
                anchors.fill: parent
                drag{
                    target: parent
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: canvas.canvasFocus = selComp

                onDoubleClicked: {
                    parent.destroy()        // destroy component
                }
            }

            Resize {
                id: resize
                anchors.fill: parent
                property string type: 'circle'
            }


        }
    }
    Component {
        id: square

        Rectangle {
            id: selComp
            property string type: "square"
            border {
                width: 2
                color: "black"
            }
            color: "#354682B4"
            property int rulersSize: 15
            property bool selected: canvas.canvasFocus === selComp ? 1 : 0

            MouseArea {     // drag mouse area
                anchors.fill: parent
                drag{
                    target: parent
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: canvas.canvasFocus = selComp

                onDoubleClicked: {
                    parent.destroy()        // destroy component
                }
            }
            Resize {
                id: resize
                anchors.fill: parent
                property string type: 'square'
            }

        }
    }
    Component {
        id: line
        Rectangle {
            id: selComp
            property string type: "line"
            property var slope: 0
            height: 5

            border {
                width: 5
                color: "black"
            }
            color: "#354682B4"
            property int rulersSize: 15
            property bool selected: canvas.canvasFocus === selComp ? 1 : 0

            transform: Rotation {
                origin.x: 25
                origin.y: 25
                angle: selComp.slope
            }

            MouseArea {     // drag mouse area
                anchors.fill: parent
                drag{
                    target: parent
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: canvas.canvasFocus = selComp

                onDoubleClicked: {
                    parent.destroy()        // destroy component
                }
            }
            Resize {
                id: resize
                anchors.fill: parent
                property string type: 'line'
            }

        }
    }

}
