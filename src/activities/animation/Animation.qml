/* GCompris - Animation.qml
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

ActivityBase {
    id: activity
    onStart: focus = true
    onStop: {}

    pageComponent: Rectangle {
        id: background
        anchors.fill: parent
        color: "#ABCDEF"
        signal start
        signal stop

        Component.onCompleted: {
            activity.start.connect(start)
            activity.stop.connect(stop)
        }

        // Add here the QML items you need to access in javascript
        QtObject {
            id: items
            property Item main: activity.main
            property alias background: background
            property alias bar: bar
            property alias bonus: bonus
        }

        onStart: { Activity.start(items) }
        onStop: { Activity.stop() }


        // Temporary tool box for testing the tools on the canvas
        Rectangle {
            id: tools
            width: parent.width*0.2
            height: parent.height
            anchors.left: parent.left
            color: "green"
            border.color: "black"
            border.width: 5
            radius: 10
            property var currentTool: playground
            onCurrentToolChanged: console.log(currentTool)
            property string currentToolType: 'createObject'
            Column {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                Repeater {
                    model: ["rectangle", "square", "circle", "line", "text", "delete", "resize", "position"]
                    Rectangle {
                        width: parent.width*0.8
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 70
                        GCText {
                            id: tooltext
                            fontSize: regularSize
                            color: "white"
                            style: Text.Outline
                            styleColor: "black"
                            text: modelData
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                switch(modelData) {
                                case 'rectangle':
                                    tools.currentToolType = 'createObject'
                                    tools.currentTool = shapes.rectangle
                                    break;
                                case 'circle':
                                    tools.currentToolType = 'createObject'
                                    tools.currentTool = shapes.circle
                                    break;
                                case 'square':
                                    tools.currentToolType = 'createObject'
                                    tools.currentTool = shapes.square
                                    break;
                                case 'line':
                                    tools.currentToolType = 'createObject'
                                    tools.currentTool = shapes.line
                                    break;
                                case 'text':
                                    tools.currentToolType = 'createObject'
                                    tools.currentTool = shapes.textArea
                                    break;
                                case 'delete':
                                    tools.currentToolType = 'edit'
                                    tools.currentTool = 'deleteItem'
                                    break;
                                case 'resize':
                                    tools.currentToolType = 'edit'
                                    tools.currentTool = 'resize'
                                    break;
                                    //not implemented
                                case 'position':
                                    tools.currentToolType = 'edit'
                                    tools.currentTool = 'position'
                                    break;
                                default:
                                    console.log('choose a tool')
                                }
                                console.log('currentTool :' + tools.currentTool )
                            }
                        }
                    }
                }
            }
        }


        Rectangle {
            id: playground
            color: parent.color
            anchors.left: tools.right
            width: parent.width*0.8
            height: parent.height
            property string type: 'canvas'
            MouseArea {
                id: canvas
                property var originx
                property var originy
                property var canvasFocus: canvas
                property var collection: []
                property var selectionItem
                anchors.fill: parent
                onClicked: canvasFocus = canvas
                onPressed: {
                    if(tools.currentToolType == 'createObject' && tools.currentTool.type != 'canvas'){
                        originx = mouse.x
                        originy = mouse.y
                        if(tools.currentTool!=null){
                            selectionItem = tools.currentTool.createObject(parent, {"x": mouseX, "y": mouse.y})
                            collection.push(selectionItem)
                        }
                        console.log("colllectio length  :  " + collection.length)
                    }
                }
                onPositionChanged: {
                    if(tools.currentToolType == 'createObject'){
                        switch (selectionItem.type) {
                        case ("canvas"):
                            break;
                        case "rectangle":
                            if(mouseX < selectionItem.x){
                                selectionItem.x = mouseX
                                selectionItem.width = (Math.abs (originx - selectionItem.x))
                            }
                            else if( selectionItem.x < originx){
                                selectionItem.x = mouseX
                                selectionItem.width = (Math.abs (mouseX - originx))
                            }
                            else
                                selectionItem.width = (Math.abs (mouseX - originx))

                            if(mouse.y < selectionItem.y){
                                selectionItem.y = mouse.y
                                selectionItem.height = (Math.abs (originy - selectionItem.y))
                            }
                            else if( selectionItem.y < originy){
                                selectionItem.y = mouse.y
                                selectionItem.height = (Math.abs (mouse.y - originy))
                            }
                            else
                                selectionItem.height = (Math.abs (mouse.y - originy))
                            break;
                        case "circle":
                            if(mouseX < selectionItem.x){
                                selectionItem.x = mouseX
                                selectionItem.width = (Math.abs (originx - selectionItem.x))
                            }
                            else if( selectionItem.x < originx){
                                selectionItem.x = mouseX
                                selectionItem.width = (Math.abs (mouseX - originx))
                            }
                            else
                                selectionItem.width = (Math.abs (mouseX - originx))

                            if(mouse.y < selectionItem.y){
                                selectionItem.y = mouse.y
                                selectionItem.height = (Math.abs (originy - selectionItem.y))
                            }
                            else if( selectionItem.y < originy){
                                selectionItem.y = mouse.y
                                selectionItem.height = (Math.abs (mouse.y - originy))
                            }
                            else
                                selectionItem.height = (Math.abs (mouse.y - originy))

                            // for making a circle (best possible solution)

                            if(Math.abs(selectionItem.width)>Math.abs(selectionItem.height))
                                selectionItem.height = selectionItem.width
                            else
                                selectionItem.width = selectionItem.height
                            break;
                        case "square":
                            if(mouseX < selectionItem.x){
                                selectionItem.x = mouseX
                                selectionItem.width = (Math.abs (originx - selectionItem.x))
                            }
                            else if( selectionItem.x < originx){
                                selectionItem.x = mouseX
                                selectionItem.width = (Math.abs (mouseX - originx))
                            }
                            else
                                selectionItem.width = (Math.abs (mouseX - originx))

                            if(mouse.y < selectionItem.y){
                                selectionItem.y = mouse.y
                                selectionItem.height = (Math.abs (originy - selectionItem.y))
                            }
                            else if( selectionItem.y < originy){
                                selectionItem.y = mouse.y
                                selectionItem.height = (Math.abs (mouse.y - originy))
                            }
                            else
                                selectionItem.height = (Math.abs (mouse.y - originy))


                            if(Math.abs(selectionItem.width)>Math.abs(selectionItem.height))
                                selectionItem.height = selectionItem.width
                            else
                                selectionItem.width = selectionItem.height

                            break;
                        case "line":
                            var x = mouseX - originx
                            var y = mouseY - originy

                            var length = Math.sqrt(x*x + y*y)
                            selectionItem.width = length
                            selectionItem.slope = Math.atan2(y, x) * 180 / Math.PI ;
                            break;
                        default:
                            console.log("either shape is not present or no resizing needed");
                        }
                    }
                }


            }

            Shapes {
                id: shapes
                property alias canvas: canvas
                property alias currentToolType: tools.currentToolType
                property alias currentTool: tools.currentTool
            }

        }

        DialogHelp {
            id: dialogHelp
            onClose: home()
        }

        Bar {
            id: bar
            content: BarEnumContent { value: help | home | level }
            onHelpClicked: {
                displayDialog(dialogHelp)
            }
            onPreviousLevelClicked: Activity.previousLevel()
            onNextLevelClicked: Activity.nextLevel()
            onHomeClicked: activity.home()
        }

        Bonus {
            id: bonus
            Component.onCompleted: win.connect(Activity.nextLevel)
        }
    }

}
