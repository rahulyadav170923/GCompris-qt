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

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                color: "black"
                anchors.horizontalCenter: parent.left
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAxis }
                    onMouseXChanged: {
                        if(drag.active){
                            selComp.width = selComp.width - mouseX
                            selComp.x = selComp.x + mouseX
                            if(selComp.width < 0)
                                selComp.width = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                color: "black"
                anchors.horizontalCenter: parent.right
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAxis }
                    onMouseXChanged: {
                        if(drag.active){
                            selComp.width = selComp.width + mouseX
                            if(selComp.width < 0)
                                selComp.width = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                x: parent.x / 2
                y: 0
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.top

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.YAxis }
                    onMouseYChanged: {
                        if(drag.active){
                            selComp.height = selComp.height - mouseY
                            selComp.y = selComp.y + mouseY
                            if(selComp.height < 0)
                                selComp.height = 0
                        }
                    }
                }
            }


            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                x: parent.x / 2
                y: parent.y
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.bottom

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.YAxis }
                    onMouseYChanged: {
                        if(drag.active){
                            selComp.height = selComp.height + mouseY
                            if(selComp.height < 0)
                                selComp.height = 0
                        }
                    }
                }
            }
        }
    }


    Component {
        id: circle

        Rectangle {
            id: selComp
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
            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                color: "black"
                anchors.horizontalCenter: parent.left
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAxis }
                    onMouseXChanged: {
                        if(drag.active){
                            selComp.width = selComp.width - mouseX
                            selComp.height = selComp.width
                            selComp.x = selComp.x + mouseX
                            if(selComp.width < 0)
                                selComp.width = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                color: "black"
                anchors.horizontalCenter: parent.right
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAxis }
                    onMouseXChanged: {
                        if(drag.active){
                            selComp.width = selComp.width + mouseX
                            selComp.height = selComp.width
                            if(selComp.width < 0)
                                selComp.width = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                x: parent.x / 2
                y: 0
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.top

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.YAxis }
                    onMouseYChanged: {
                        if(drag.active){
                            selComp.height = selComp.height - mouseY
                            selComp.width = selComp.height
                            selComp.y = selComp.y + mouseY
                            if(selComp.height < 0)
                                selComp.height = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                x: parent.x / 2
                y: parent.y
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.bottom

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.YAxis }
                    onMouseYChanged: {
                        if(drag.active){
                            selComp.height = selComp.height + mouseY
                            selComp.width = selComp.height
                            if(selComp.height < 0)
                                selComp.height = 0
                        }
                    }
                }
            }
        }
    }
    Component {
        id: square

        Rectangle {
            id: selComp

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

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                color: "black"
                anchors.horizontalCenter: parent.left
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAxis }
                    onMouseXChanged: {
                        if(drag.active){
                            selComp.width = selComp.width - mouseX
                            selComp.height = selComp.width
                            selComp.x = selComp.x + mouseX
                            if(selComp.width < 0)
                                selComp.width = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                color: "black"
                anchors.horizontalCenter: parent.right
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAxis }
                    onMouseXChanged: {
                        if(drag.active){
                            selComp.width = selComp.width + mouseX
                            selComp.height = selComp.width
                            if(selComp.width < 0)
                                selComp.width = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                x: parent.x / 2
                y: 0
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.top

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.YAxis }
                    onMouseYChanged: {
                        if(drag.active){
                            selComp.height = selComp.height - mouseY
                            selComp.width = selComp.height
                            selComp.y = selComp.y + mouseY
                            if(selComp.height < 0)
                                selComp.height = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                x: parent.x / 2
                y: parent.y
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.bottom

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.YAxis }
                    onMouseYChanged: {
                        if(drag.active){
                            selComp.height = selComp.height + mouseY
                            selComp.width = selComp.height
                            if(selComp.height < 0)
                                selComp.height = 0
                        }
                    }
                }
            }
        }
    }
    Component {
        id: line

        Rectangle {
            id: selComp
            height: 2

            border {
                width: 5
                color: "black"
            }
            color: "#354682B4"
            property int rulersSize: 15
            property bool selected: canvas.canvasFocus === selComp ? 1 : 0

            transform: Rotation {
                id: rotation
                origin.x: 25
                origin.y: 25
                angle: 45
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

            /*Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                color: "black"
                anchors.horizontalCenter: parent.left
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAxis }
                    onMouseXChanged: {
                        if(drag.active){
                            selComp.width = selComp.width - mouseX
                            selComp.height = selComp.width
                            selComp.x = selComp.x + mouseX
                            if(selComp.width < 0)
                                selComp.width = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                color: "black"
                anchors.horizontalCenter: parent.right
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAxis }
                    onMouseXChanged: {
                        if(drag.active){
                            selComp.width = selComp.width + mouseX
                            selComp.height = selComp.width
                            if(selComp.width < 0)
                                selComp.width = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                x: parent.x / 2
                y: 0
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.top

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.YAxis }
                    onMouseYChanged: {
                        if(drag.active){
                            selComp.height = selComp.height - mouseY
                            selComp.width = selComp.height
                            selComp.y = selComp.y + mouseY
                            if(selComp.height < 0)
                                selComp.height = 0
                        }
                    }
                }
            }

            Rectangle {
                visible: selComp.selected
                width: rulersSize
                height: rulersSize
                //radius: rulersSize
                x: parent.x / 2
                y: parent.y
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.bottom

                MouseArea {
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.YAxis }
                    onMouseYChanged: {
                        if(drag.active){
                            selComp.height = selComp.height + mouseY
                            selComp.width = selComp.height
                            if(selComp.height < 0)
                                selComp.height = 0
                        }
                    }
                }
            }*/
        }
    }



}
