import QtQuick
import QtQuick.Window
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import File
import "../js/Main.js" as Mainjs

Window {
    id: mainWindow
    visible: true
    width: 670
    height: 670
    color: "#00000000"
    flags: Qt.FramelessWindowHint | Qt.Window

    property bool ismax : false

    Rectangle {
        id: mainArea
        anchors.fill: parent
        anchors.margins: mainWindow.visibility == Window.Maximized ? 0 : 70
        radius: 11
//        border.color:"#e3e3e3"
//        border.width:0.8
        Rectangle{
            id:titleBar
            x:0
            y:0
            z:0
            width: mainWindow.visibility == Window.Maximized ?  Window.width : Window.width-140
            height: 38
            radius: 11
            color: "#ffffff"
//            border.color:"#e3e3e3"
//            border.width:1
            Rectangle{
                x:0
                y:19
                z:0
                width:mainWindow.visibility == Window.Maximized ?  Window.width : Window.width-140
                height: 19
                color: "#ffffff"
                border.color:"#e3e3e3"
                border.width:1
            }
            Rectangle{
                //x:1
                x:0
                y:18
                z:0
                width:mainWindow.visibility == Window.Maximized ?  Window.width : Window.width-140 // -142
                height: 19
                color: "#ffffff"
            }
            MouseArea {
                anchors.fill: parent
                property int dx
                property int dy
                onPressed: { dx = mouseX; dy = mouseY }
                onPositionChanged: {

                    if(mainWindow.visibility === Window.Maximized){
                        mainWindow.showNormal()
                        ismax=false
                        mainWindow.x += mouseX
                        mainWindow.y += mouseY
                    }
                    else{
                        mainWindow.x += mouseX - dx
                        mainWindow.y += mouseY - dy
                    }


                }
                onDoubleClicked: {
                    mainWindow.visibility = mainWindow.visibility === Window.Maximized ? Window.AutomaticVisibility : Window.Maximized
                }
            }
        }
        Rectangle{
            width: 16
            height: 16
            x:12
            y:10
            id:close
            Canvas{
                id : closeBtn
                width: 16; height: 16
                x:0
                y:0
                z:2
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.fillStyle = "#DF4744";
                    ctx.beginPath();
                    ctx.arc(8, 8, 8, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#FC5753";
                    ctx.beginPath();
                    ctx.arc(7.948, 7.948, 7.329, 0, 2 * Math.PI);
                    ctx.fill();
                }
            }
            Canvas{
                id : closeBtn_pressed
                width: 16; height: 16
                x:0
                y:0
                z:1
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.fillStyle = "#DF4744";
                    ctx.beginPath();
                    ctx.arc(8, 8, 8, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#FC5753";
                    ctx.beginPath();
                    ctx.arc(7.948, 7.948, 7.329, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#7E0508"
                    ctx.path = "m4.322 5.125.803-.803 6.35 6.351-.802.803z"
                    ctx.fill()
                    ctx.fillStyle = "#7E0508"
                    ctx.path = "m4.322 10.672 6.35-6.35.803.802-6.35 6.35z"
                    ctx.fill()
                }
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    closeBtn.z=1
                    closeBtn_pressed.z=2
                }
                onExited: {
                    closeBtn.z=2
                    closeBtn_pressed.z=1
                }
                onClicked: {
                    Qt.quit()
                }
            }
        }
        Rectangle{
            width: 16
            height: 16
            x:38
            y:10
            id:minimize
            Canvas{
                id : minimizeBtn
                width: 16; height: 16
                x:0
                y:0
                z:2
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.fillStyle = "#DE9F34";
                    ctx.beginPath();
                    ctx.arc(8, 8, 8, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#FDBC40";
                    ctx.beginPath();
                    ctx.arc(7.948, 7.948, 7.329, 0, 2 * Math.PI);
                    ctx.fill();
                }
            }
            Canvas{
                id : minimizeBtn_pressed
                width: 16; height: 16
                x:0
                y:0
                z:1
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.fillStyle = "#DE9F34";
                    ctx.beginPath();
                    ctx.arc(8, 8, 8, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#FDBC40";
                    ctx.beginPath();
                    ctx.arc(7.948, 7.948, 7.329, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#7E0508"
                    ctx.path = "M3.51 7.432h8.981v1.135H3.51z"
                    ctx.fill()
                }
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    minimizeBtn.z=1
                    minimizeBtn_pressed.z=2
                }
                onExited: {
                    minimizeBtn.z=2
                    minimizeBtn_pressed.z=1
                }
                onClicked: {
                    mainWindow.showMinimized()
                }
            }
        }
        Rectangle{
            width: 16
            height: 16
            x:64
            y:10
            id:maximize
            Canvas{
                id : maximizeBtn
                width: 16; height: 16
                x:0
                y:0
                z:3
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.fillStyle = "#27AA35";
                    ctx.beginPath();
                    ctx.arc(8, 8, 8, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#36C84B";
                    ctx.beginPath();
                    ctx.arc(7.948, 7.948, 7.329, 0, 2 * Math.PI);
                    ctx.fill();
                }
            }
            Canvas{
                id : maximizeBtn_after_pressed
                width: 16; height: 16
                x:0
                y:0
                z:1
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.fillStyle = "#27AA35";
                    ctx.beginPath();
                    ctx.arc(8, 8, 8, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#36C84B";
                    ctx.beginPath();
                    ctx.arc(7.948, 7.948, 7.329, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#0B650D"
                    ctx.path = "M8.96 7.952A1 1 0 0 1 7.959 6.95l.007-2.485c.002-.89 1.078-1.333 1.707-.704l2.478 2.478c.63.629.186 1.705-.704 1.707l-2.485.007Zm-2.01.006A1 1 0 0 1 7.951 8.96l-.007 2.485c-.002.89-1.078 1.333-1.707.704L3.76 9.672c-.63-.629-.186-1.705.704-1.707l2.485-.007Z"
                    ctx.fill()
                }
            }
            Canvas{
                id : maximizeBtn_pressed
                width: 16; height: 16
                x:0
                y:0
                z:1
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.fillStyle = "#27AA35";
                    ctx.beginPath();
                    ctx.arc(8, 8, 8, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#36C84B";
                    ctx.beginPath();
                    ctx.arc(7.948, 7.948, 7.329, 0, 2 * Math.PI);
                    ctx.fill();
                    ctx.fillStyle = "#0B650D"
                    ctx.path = "M10.89 4.016a1 1 0 0 1 1.004 1.003l-.007 2.485c-.003.89-1.079 1.334-1.707.705L7.7 5.73c-.629-.629-.185-1.704.705-1.707l2.485-.007Zm-5.87 7.878a1 1 0 0 1-1.004-1.003l.007-2.485c.003-.89 1.079-1.334 1.708-.705l2.478 2.479c.629.629.185 1.704-.705 1.707l-2.485.007Z"
                    ctx.fill()
                }
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    maximizeBtn.z=1
                    if(ismax){
                        maximizeBtn_pressed.z=-1
                        maximizeBtn_after_pressed.z=2
                    }
                    else{
                        maximizeBtn_pressed.z=2
                        maximizeBtn_after_pressed.z=-1
                    }
                }
                onExited: {
                    maximizeBtn.z=2
                    if(ismax){
                        maximizeBtn_pressed.z=-1
                        maximizeBtn_after_pressed.z=1
                    }
                    else{
                        maximizeBtn_pressed.z=1
                        maximizeBtn_after_pressed.z=-1
                    }
                }
                onClicked: {
                    if(!ismax){
                        mainWindow.showMaximized()
                        ismax=true
                    }
                    else{
                        mainWindow.showNormal()
                        ismax=false
                    }

                }
            }
        }

        ReadFile {
            id: robots
            json: "robot.json"
            Component.onCompleted: {
                getRobots();
                for(var i=0;i<robotLength;i++){
                    Mainjs.createCard(10+i*280,50,260,140,getRobotName(i),getRobotToken(i),"#6094ea","#f02fc2");
                }
            }
        }
    }

    DropShadow {
        anchors.fill: mainArea
        transparentBorder: true
        horizontalOffset: 0
        verticalOffset: 20
        radius: 100
        color: "#000000"
        spread: -1
        source: mainArea
    }
}
