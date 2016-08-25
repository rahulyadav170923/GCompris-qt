/* GCompris - guesscount-summer.qml
 *
 * Copyright (C) 2016 RAHUL YADAV <rahulyadav170923@gmail.com>
 *
 * Authors:
 *   <Pascal Georges> (GTK+ version)
 *   RAHUL YADAV <rahulyadav170923@gmail.com> (Qt Quick port)
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
import "guesscount-summer.js" as Activity

Row {
    id: admin
    spacing: 30
    property int level
    property var level_operators
    Rectangle {
        id: operator
        width: parent.width*0.328
        height: parent.height
        radius: 20.0;
        color: "red"
        state: "selected"
        GCText {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fontSize: mediumSize
            text: qsTr("Level "+level.toString())
        }
    }
    Repeater {
        model: Activity.operators
        delegate: Rectangle {
            id: tile
            width: 100
            height: parent.height
            radius: 20
            opacity: 0.7
            state: Activity.check(modelData,level_operators[level]) ? "selected" : "notselected"
            GCText {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: modelData
                fontSize: mediumSize
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(tile.state=="selected"){
                        tile.state="notselected"
                        level_operators[level].splice(level_operators[level].indexOf(modelData),1)
                        Activity.sync(level_operators,level)
                    }
                    else{
                        tile.state="selected"
                        level_operators[level].push(modelData)
                        Activity.sync(level_operators,level)
                    }
                }
            }
            states: [
                State {
                    name: "selected"
                    PropertyChanges { target: tile; color: "green"}
                },
                State {
                    name: "notselected"
                    PropertyChanges { target: tile; color: "red"}
                }
            ]
        }
    }
}
