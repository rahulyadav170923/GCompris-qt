/* GCompris - Shapes.qml
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

    id: shapes

    property alias rectangle: rectangle
    property alias circle: circle
    property alias square: square
    property alias line: line
    property alias textArea: textArea
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
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0

            MouseArea {
                // drag mouse area
                enabled: currentToolType == 'edit' ? true : false
                anchors.fill: parent
                drag{
                    target: currentTool == 'position' ? parent : null
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: {
                    canvas.canvasFocus = selComp
                    if(currentToolType == 'edit'){
                        switch(currentTool){
                        case "deleteItem":
                            parent.destroy()
                            break;
                        case "borderColor":
                            selComp.border.color = borderColor
                            break;
                        case "bodyColor":
                            selComp.color = bodyColor
                            break;
                        default:
                            console.log('edit tool default')
                        }
                    }
                }

                onDoubleClicked: {
                    parent.destroy()        // destroy component
                }
            }

            Resize {
                id: resize
                anchors.fill: parent
                property string type: selComp.type
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
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0

            MouseArea {     // drag mouse area
                enabled: currentToolType == 'edit' ? true : false
                anchors.fill: parent
                drag{
                    target: currentTool == 'position' ? parent : null
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: {
                    canvas.canvasFocus = selComp
                    if(currentToolType == 'edit'){
                        switch(currentTool){
                        case "deleteItem":
                            parent.destroy()
                            break;
                        case "borderColor":
                            selComp.border.color = borderColor
                            break;
                        case "bodyColor":
                            selComp.color = bodyColor
                            break;
                        default:
                            console.log('edit tool default')
                        }
                    }
                }

                onDoubleClicked: {
                    parent.destroy()        // destroy component
                }
            }

            Resize {
                id: resize
                anchors.fill: parent
                property string type: selComp.type
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
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0

            MouseArea {     // drag mouse area
                enabled: currentToolType == 'edit' ? true : false
                anchors.fill: parent
                drag{
                    target: currentTool == 'position' ? parent : null
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: {
                    canvas.canvasFocus = selComp
                    if(currentToolType == 'edit'){
                        switch(currentTool){
                        case "deleteItem":
                            parent.destroy()
                            break;
                        case "borderColor":
                            selComp.border.color = borderColor
                            break;
                        case "bodyColor":
                            selComp.color = bodyColor
                            break;
                        default:
                            console.log('edit tool default')
                        }
                    }
                }
                onDoubleClicked: {
                    parent.destroy()        // destroy component
                }
            }
            Resize {
                id: resize
                anchors.fill: parent
                property string type: selComp.type
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
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0

            transform: Rotation {
                origin.x: 25
                origin.y: 25
                angle: selComp.slope
            }

            MouseArea {     // drag mouse area
                enabled: currentToolType == 'edit' ? true : false
                anchors.fill: parent
                drag{
                    target: currentTool == 'position' ? parent : null
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: {
                    canvas.canvasFocus = selComp
                    if(currentToolType == 'edit'){
                        switch(currentTool){
                        case "deleteItem":
                            parent.destroy()
                            break;
                        case "borderColor":
                            selComp.border.color = borderColor
                            break;
                        case "bodyColor":
                            selComp.color = bodyColor
                            break;
                        default:
                            console.log('edit tool default')
                        }
                    }
                }

                onDoubleClicked: {
                    parent.destroy()        // destroy component
                }
            }
            Resize {
                id: resize
                anchors.fill: parent
                property string type: selComp.type
            }

        }
    }

    Component {
        id: textArea

        Rectangle {
            id: selComp
            width: edit.contentWidth + 30
            height: edit.contentHeight
            property string type: "text"
            border {
                width: 2
                color: "black"
            }
            color: "#354682B4"
            property int rulersSize: 15
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0


            TextEdit {
                id: edit
                anchors.centerIn: parent
                text: qsTr("enter text")
                focus: false
            }


            MouseArea {     // drag mouse area
                enabled: currentToolType == 'edit' ? true : false
                anchors.fill: parent
                drag{
                    target: currentTool == 'position' ? parent : null
                    minimumX: 0
                    minimumY: 0
                    maximumX: parent.parent.width - parent.width
                    maximumY: parent.parent.height - parent.height
                }

                onClicked: {
                    canvas.canvasFocus = selComp
                    if(currentToolType == 'edit'){
                        switch(currentTool){
                        case "deleteItem":
                            parent.destroy()
                            break;
                        case "borderColor":
                            selComp.border.color = borderColor
                            break;
                        case "bodyColor":
                            selComp.color = bodyColor
                            break;
                        default:
                            console.log('edit tool : '+ currentTool)
                        }
                    }
                }

                onDoubleClicked: {
                    edit.focus = true
                }
            }

            Resize {
                id: resize
                anchors.fill: parent
                property string type: selComp.type
            }

        }

    }

}
