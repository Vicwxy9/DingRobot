var component;
var card;
var GcardX,GcardY,GcardWidth,GcardHeight,GcardName,GcardToken,GcardColor1,GcardColor2;
function createCard(cardX,cardY,cardWidth,cardHeight,cardName,cardToken,cardColor1,cardColor2) {
    GcardX=cardX;
    GcardY=cardY;
    GcardWidth=cardWidth;
    GcardHeight=cardHeight;
    GcardName=cardName;
    GcardToken=cardToken;
    GcardColor1=cardColor1;
    GcardColor2=cardColor2;
    component = Qt.createComponent("qrc:/qml/Card.qml");
    if (component.status === Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation() {
    if (component.status === Component.Ready) {
        card = component.createObject(mainArea,
                                        {
//                                                cardX:290
//                                                ,cardY:50
//                                                ,cardWidth:260
//                                                ,cardHeight:140
//                                                ,cardName: "Name"
//                                                ,cardToken: "d2419902243663cc0681c9ebfa7e23c7ec2f4c158ae4c5d4c04c7940035a63a5"
//                                                ,cardColor1: "#6094ea"
//                                                ,cardColor2: "#f02fc2"
                                              cardX: GcardX
                                              ,cardY: GcardY
                                              ,cardWidth: GcardWidth
                                              ,cardHeight: GcardHeight
                                              ,cardName: GcardName
                                              ,cardToken: GcardToken
                                              ,cardColor1: GcardColor1
                                              ,cardColor2: GcardColor2
                                        });
        if (card === null) {
            console.log("Error creating object");
        }
    } else if (component.status === Component.Error) {
        console.log("Error loading component:", component.errorString());
    }
}
