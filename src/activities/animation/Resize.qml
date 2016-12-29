import QtQuick 2.1

import "../../core"
import "animation.js" as Activity

Item {
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
                switch (type) {
                case "rectangle":
                    if(drag.active){
                        selComp.width = selComp.width - mouseX
                        selComp.x = selComp.x + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case "circle":
                    if(drag.active){
                        selComp.width = selComp.width - mouseX
                        selComp.height = selComp.width
                        selComp.x = selComp.x + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case "square":
                    if(drag.active){
                        selComp.width = selComp.width - mouseX
                        selComp.height = selComp.width
                        selComp.x = selComp.x + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case "line":
                    if(drag.active){
                        if(selComp.width > 0){
                            selComp.width = selComp.width - mouseX
                            selComp.x = selComp.x + mouseX
                            selComp.y = selComp.y + mouseX*Math.tan(Math.PI*selComp.slope / 180)
                        }
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                default:
                    console.log("Sorry, we are out of types of resize elements");
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
                switch (type) {
                case "rectangle":
                    if(drag.active){
                        selComp.width = selComp.width + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case "circle":
                    if(drag.active){
                        selComp.width = selComp.width + mouseX
                        selComp.height = selComp.width
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case "square":
                    if(drag.active){
                        selComp.width = selComp.width + mouseX
                        selComp.height = selComp.width
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case "line":
                    if(drag.active){
                        selComp.width = selComp.width + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                default:
                    console.log("Sorry, we are out of types of resize elements");
                }

            }
        }
    }

    Rectangle {
        visible: selComp.selected && type!="line"
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
                switch (type) {
                case "rectangle":
                    if(drag.active){
                        selComp.height = selComp.height - mouseY
                        selComp.y = selComp.y + mouseY
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case "circle":
                    if(drag.active){
                        selComp.height = selComp.height - mouseY
                        selComp.width = selComp.height
                        selComp.y = selComp.y + mouseY
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case "square":
                    if(drag.active){
                        selComp.height = selComp.height - mouseY
                        selComp.width = selComp.height
                        selComp.y = selComp.y + mouseY
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                default:
                    console.log("Sorry, we are out of types of resize elements");
                }

            }
        }
    }


    Rectangle {
        visible: selComp.selected && type!="line"
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
                switch (type) {
                case "rectangle":
                    if(drag.active){
                        selComp.height = selComp.height + mouseY
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case "circle":
                    if(drag.active){
                        selComp.height = selComp.height + mouseY
                        selComp.width = selComp.height
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case "square":
                    if(drag.active){
                        selComp.height = selComp.height + mouseY
                        selComp.width = selComp.height
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case "line":
                    break;
                default:
                    console.log("Sorry, we are out of types of resize elements");
                }

            }
        }
    }

}

