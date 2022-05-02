var component;
var card;
var GcardX,GcardY,GcardWidth,GcardHeight,GcardName,GcardToken,GcardColor1,GcardColor2,Gi;
function createCard(cardX=null,cardY=null,cardWidth,cardHeight,cardName,cardToken,cardColor1,cardColor2,i) {
    GcardX=cardX;
    GcardY=cardY;
    GcardWidth=cardWidth;
    GcardHeight=cardHeight;
    GcardName=cardName;
    GcardToken=cardToken;
    GcardColor1=cardColor1;
    GcardColor2=cardColor2;
    Gi=i;
    component = Qt.createComponent("qrc:/qml/Card.qml");
    card = component.createObject(mainArea,
                                        {
                                              cardX: mainWindow.width*0.00684+Gi*GcardWidth+mainWindow.width*0.0273*(Gi+1)
                                              ,cardY: GcardY
                                              ,cardWidth: GcardWidth
                                              ,cardHeight: GcardHeight
                                              ,cardName: GcardName
                                              ,cardToken: GcardToken
                                              ,cardColor1: GcardColor1
                                              ,cardColor2: GcardColor2
                                        });
    return card
}
