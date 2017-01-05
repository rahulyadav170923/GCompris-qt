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
                switch (true) {
                case (type=="rectangle" || type=="text"):
                    if(drag.active){
                        console.log('inside')
                        selComp.width = selComp.width - mouseX
                        selComp.x = selComp.x + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case type=="circle":
                    if(drag.active){
                        selComp.width = selComp.width - mouseX
                        selComp.height = selComp.width
                        selComp.x = selComp.x + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case type=="square":
                    if(drag.active){
                        selComp.width = selComp.width - mouseX
                        selComp.height = selComp.width
                        selComp.x = selComp.x + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case type=="line":
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
                    console.log(type)
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
                switch (true) {
                case (type=="rectangle" || type=="text"):
                    if(drag.active){
                        selComp.width = selComp.width + mouseX
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case type=="circle":
                    if(drag.active){
                        selComp.width = selComp.width + mouseX
                        selComp.height = selComp.width
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case type=="square":
                    if(drag.active){
                        selComp.width = selComp.width + mouseX
                        selComp.height = selComp.width
                        if(selComp.width < 0)
                            selComp.width = 0
                    }
                    break;
                case type=="line":
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
                switch (true) {
                case (type=="rectangle" || type=="text"):
                    if(drag.active){
                        selComp.height = selComp.height - mouseY
                        selComp.y = selComp.y + mouseY
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case type=="circle":
                    if(drag.active){
                        selComp.height = selComp.height - mouseY
                        selComp.width = selComp.height
                        selComp.y = selComp.y + mouseY
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case type=="square":
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
                switch (true) {
                case (type=="rectangle" || type=="text"):
                    if(drag.active){
                        selComp.height = selComp.height + mouseY
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case type=="circle":
                    if(drag.active){
                        selComp.height = selComp.height + mouseY
                        selComp.width = selComp.height
                        if(selComp.height < 0)
                            selComp.height = 0
                    }
                    break;
                case type=="square":
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

