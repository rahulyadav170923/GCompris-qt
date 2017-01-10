/* GCompris - Resize.qml
 *
 * Copyright (C) 2016 Rahul Yadav <rahulyadav170923@gmail.com>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (GTK+ version)
 *   Rahul Yadav <rahulyadav170923@gmail.com> (Qt Quick port)
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.1
import "../../core"
import "animation.js" as Activity

/*
1. add corner resizing
2. resizing even after zero width
3. error in line resiging ( detected once )

*/




Item {
    Rectangle {
        visible: resizeVisible
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
                switch (true) {
                case (type=="rectangle" || type=="text" || type=="image"):
                    if(drag.active){
                        console.log('inside')
                        selectComponent.width = selectComponent.width - mouseX
                        selectComponent.x = selectComponent.x + mouseX
                        if(selectComponent.width < 0)
                            selectComponent.width = 0
                    }
                    break;
                case type=="circle":
                    if(drag.active){
                        selectComponent.width = selectComponent.width - mouseX
                        selectComponent.height = selectComponent.width
                        selectComponent.x = selectComponent.x + mouseX
                        if(selectComponent.width < 0)
                            selectComponent.width = 0
                    }
                    break;
                case type=="square":
                    if(drag.active){
                        selectComponent.width = selectComponent.width - mouseX
                        selectComponent.height = selectComponent.width
                        selectComponent.x = selectComponent.x + mouseX
                        if(selectComponent.width < 0)
                            selectComponent.width = 0
                    }
                    break;
                case type=="line":
                    if(drag.active){
                        if(selectComponent.width > 0){
                            selectComponent.width = selectComponent.width - mouseX
                            selectComponent.x = selectComponent.x + mouseX
                            selectComponent.y = selectComponent.y + mouseX*Math.tan(Math.PI*selectComponent.slope / 180)
                        }
                        if(selectComponent.width < 0)
                            selectComponent.width = 0
                    }
                    break;
                default:
                    console.log(type)
                    console.log("Sorry, we are out of types of resize elements");
                }

            }
        }
    }

    Rectangle {

        visible: resizeVisible
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
                switch (true) {
                case (type=="rectangle" || type=="text" || type=="image"):
                    if(drag.active){
                        selectComponent.width = selectComponent.width + mouseX
                        if(selectComponent.width < 0)
                            selectComponent.width = 0
                    }
                    break;
                case type=="circle":
                    if(drag.active){
                        selectComponent.width = selectComponent.width + mouseX
                        selectComponent.height = selectComponent.width
                        if(selectComponent.width < 0)
                            selectComponent.width = 0
                    }
                    break;
                case type=="square":
                    if(drag.active){
                        selectComponent.width = selectComponent.width + mouseX
                        selectComponent.height = selectComponent.width
                        if(selectComponent.width < 0)
                            selectComponent.width = 0
                    }
                    break;
                case type=="line":
                    if(drag.active){
                        selectComponent.width = selectComponent.width + mouseX
                        if(selectComponent.width < 0)
                            selectComponent.width = 0
                    }
                    break;
                default:
                    console.log("Sorry, we are out of types of resize elements");
                }

            }
        }
    }

    Rectangle {
        visible: resizeVisible && type!="line"
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
                switch (true) {
                case (type=="rectangle" || type=="text" || type=="image"):
                    if(drag.active){
                        selectComponent.height = selectComponent.height - mouseY
                        selectComponent.y = selectComponent.y + mouseY
                        if(selectComponent.height < 0)
                            selectComponent.height = 0
                    }
                    break;
                case type=="circle":
                    if(drag.active){
                        selectComponent.height = selectComponent.height - mouseY
                        selectComponent.width = selectComponent.height
                        selectComponent.y = selectComponent.y + mouseY
                        if(selectComponent.height < 0)
                            selectComponent.height = 0
                    }
                    break;
                case type=="square":
                    if(drag.active){
                        selectComponent.height = selectComponent.height - mouseY
                        selectComponent.width = selectComponent.height
                        selectComponent.y = selectComponent.y + mouseY
                        if(selectComponent.height < 0)
                            selectComponent.height = 0
                    }
                    break;
                default:
                    console.log("Sorry, we are out of types of resize elements");
                }

            }
        }
    }


    Rectangle {
        visible: resizeVisible && type!="line"
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
                switch (true) {
                case (type=="rectangle" || type=="text" || type=="image"):
                    if(drag.active){
                        selectComponent.height = selectComponent.height + mouseY
                        if(selectComponent.height < 0)
                            selectComponent.height = 0
                    }
                    break;
                case type=="circle":
                    if(drag.active){
                        selectComponent.height = selectComponent.height + mouseY
                        selectComponent.width = selectComponent.height
                        if(selectComponent.height < 0)
                            selectComponent.height = 0
                    }
                    break;
                case type=="square":
                    if(drag.active){
                        selectComponent.height = selectComponent.height + mouseY
                        selectComponent.width = selectComponent.height
                        if(selectComponent.height < 0)
                            selectComponent.height = 0
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

