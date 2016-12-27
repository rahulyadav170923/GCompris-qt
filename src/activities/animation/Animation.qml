/* GCompris - animation.qml
 *
 * Copyright (C) 2016 YOUR NAME <xx@yy.org>
 *
 * Authors:
 *   <THE GTK VERSION AUTHOR> (GTK+ version)
 *   YOUR NAME <YOUR EMAIL> (Qt Quick port)
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

        property Rectangle selectionItem: null


        MouseArea {
            id: canvas
            property var originx
            property var originy
            property var canvasFocus: canvas
            anchors.fill: parent
            onClicked: canvasFocus = canvas
            onPressed: {
                originx = mouseX
                originy = mouse.y
                //selectionItem = selectionComponent.createObject(parent, {"x": mouseX, "y": mouse.y})
                selectionItem = shapes.line.createObject(parent, {"x": mouseX, "y": mouse.y})

            }
            /*onPositionChanged: {
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

            }
            onPositionChanged: {
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
            }
            onPositionChanged: {
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
            }*/
            onPositionChanged: {
                var x = Math.abs (originx - mouseX)
                var y = Math.abs (originy - mouseY)

                var length = Math.sqrt(x*x + y*y)

                if(mouseX < selectionItem.x){
                    selectionItem.x = mouseX
                    selectionItem.width = length
                }
                else if( selectionItem.x < originx){
                    selectionItem.x = mouseX
                    selectionItem.width = length
                }
                else
                    selectionItem.width = length

                console.log(x + ": x y :"+ y)
                //selectionItem.transform.rotation.angle = Math.atan2(y, x) * 180 / Math.PI;
            }

        }

        Shapes {
            id: shapes
            property alias canvas: canvas
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
