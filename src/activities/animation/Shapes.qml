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

/*
1. add support for hollow and filled shapes.
2. Correct the basic code for the shapes(circle , square)
3. Connect positioning and resizing together
4. Custom setting for border width and add focus to text when created
5. Custom setting for font size,color and family
6. Seperating shapes as seperate components.
7. clean the code
*/


Item {

    id: shapes

    property alias rectangle: rectangle
    property alias circle: circle
    property alias square: square
    property alias line: line
    property alias textArea: textArea
    property alias image: image
    Component {
        id: rectangle
        Rectangle {
            id: selComp
            property string type: "rectangle"
            color: "blue"
            property int rulersSize: 15
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0
            border {
                width: 2
                color: "black"
            }
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
            radius: width/2
            color: "#354682B4"
            property int rulersSize: 15
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0

            border {
                width: 2
                color: "black"
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
        id: square

        Rectangle {
            id: selComp
            property string type: "square"
            color: "#354682B4"
            property int rulersSize: 15
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0

            border {
                width: 2
                color: "black"
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
            height: 10
            color: "black"
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
                            break;
                        case "bodyColor":
                            selComp.color = bodyColor
                            break;
                        default:
                            console.log('edit tool default')
                        }
                    }
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

            color: "#354682B4"
            property int rulersSize: 15
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0
            border {
                width: 2
                color: "black"
            }

            TextEdit {
                id: edit
                anchors.centerIn: parent
                text: qsTr("enter text")
                focus: false
                Component.onCompleted: focus = true
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
    Component {
        id: image

        // add support for image selection

        Rectangle {
            id: selComp
            width: playground.width*0.3
            height: playground.height*0.3
            color: "transparent"

            property string type: "image"
            property int rulersSize: 15
            property bool resizeVisible: canvas.canvasFocus === selComp && currentTool == 'resize' ? 1 : 0
            border {
                width: 2
                color: resizeVisible ? "black" : "transparent"
            }
            Image {
                width: parent.width; height: parent.height
                fillMode: Image.PreserveAspectFit
                source: "animation.svg"
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
                            break;
                        case "bodyColor":
                            break;
                        default:
                            console.log('edit tool : '+ currentTool)
                        }
                    }
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
