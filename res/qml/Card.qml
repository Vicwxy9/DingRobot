import QtQuick 2.0

Rectangle{

    property var cardName
    property var cardToken
    property var cardColor1
    property var cardColor2
    property double cardWidth
    property double cardHeight
    property double cardX
    property double cardY
    property var card:this

    x:cardX
    y:cardY
    width:cardWidth
    height:cardHeight
    radius:11

    gradient: Gradient {
        GradientStop {
            position: 0.02;
            color: cardColor1;
        }
        GradientStop {
            position: 1.00;
            color: cardColor2;
        }
    }
    Canvas{
        width: 44
        height: 44
        x:parent.width-39-10
        y:10
        z:2
        opacity: 0.5
        onPaint: {
            var ctx = getContext("2d")
            ctx.fillStyle = Qt.rgba(255,255,255);
            ctx.beginPath();
            ctx.arc(26, 17, 13, 0, 2 * Math.PI);
            ctx.fill();
        }
    }
    Canvas{
        width: 44
        height: 44
        x:parent.width-39-10
        y:10
        z:2
        opacity: 0.5
        onPaint: {
            var ctx = getContext("2d")
            ctx.fillStyle = Qt.rgba(255,255,255);
            ctx.beginPath();
            ctx.arc(16, 26, 13, 0, 2 * Math.PI);
            ctx.fill();
        }
    }
    Canvas{
        width: 44
        height: 44
        x:parent.width-39-10
        y:10
        z:2
        opacity: 0.5
        onPaint: {
            var ctx = getContext("2d")
            ctx.fillStyle = Qt.rgba(255,255,255);
            ctx.beginPath();
            ctx.arc(13, 13, 13, 0, 2 * Math.PI);
            ctx.fill();
        }
    }
    Text {
        x:10
        y:5
        wrapMode: Text.WrapAnywhere
        text: cardName
        font.family: "Inter UI"
        font.pointSize: 22
        font.weight: Font.Bold
        color: "#ffffff"
    }
    Text {
        x:10
        y:50
        width: 180
        lineHeight: 0.75
        wrapMode: Text.WrapAnywhere
        text: cardToken
        font.family: "Inter UI"
        font.pointSize: 8
        font.weight: Font.Thin
        color: "#ffffff"
    }
    Text {
        x:parent.width-110
        y:parent.height-25
        text: "Robot Card"
        font.family: "Inter UI"
        font.pointSize: 12
        font.weight: Font.Bold
        font.letterSpacing:2
        color: "#ffffff"
        opacity:0.5
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: ParallelAnimation{
            PropertyAnimation {
                id:widthc
                target:card
                property: "width";
                to: cardWidth+5;
                duration: 50

            }
            PropertyAnimation {
                target:card
                property: "x";
                to: cardX-2.5;
                duration: 50
            }
            PropertyAnimation {
                target:card
                property: "height";
                to: cardHeight+5;
                duration: 50
            }
            PropertyAnimation {
                target:card
                property: "y";
                to: cardY-2.5;
                duration: 50
            }
        }
        onExited: ParallelAnimation{
            PropertyAnimation {
                target:card
                property: "width";
                to: cardWidth;
                duration: 50
            }
            PropertyAnimation {
                target:card
                property: "x";
                to: cardX;
                duration: 50
            }
            PropertyAnimation {
                target:card
                property: "height";
                to: cardHeight;
                duration: 50
            }
            PropertyAnimation {
                target:card
                property: "y";
                to: cardY;
                duration: 50
            }
        }
        onClicked: {
            console.log(cardX)
            console.log(cardY)
        }
    }
}
