import QtQuick 2.0
import Sailfish.Silica 1.0
import "Calculator.js" as Calculator

Page {
    id: page
    allowedOrientations: Orientation.All

    onStatusChanged: {
        if (status == PageStatus.Active)
            pageStack.pushAttached(Qt.resolvedUrl("MatrixInput.qml"))
    }

    property var value

    SilicaListView{
        anchors.fill: parent
        contentHeight: column.height
        PullDownMenu{
            MenuItem{
                text: qsTr("History")
                onClicked: pageStack.push(Qt.resolvedUrl("CalculatorHistory.qml"));
            }
        }
    }
    Column {
        id: column
        width: page.width
        spacing: Theme.paddingLarge

        PageHeader {
            title: qsTr("Calculator")
        }
        Label {
            id : buffer
            text: qsTr("= %1").arg(Calculator.showBuffer())
            font.pixelSize: Theme.fontSizeMedium
            color: Theme.primaryColor
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.horizontalPageMargin
            }
        }
        Label {
            id : result
            text: qsTr("%1").arg(Calculator.calculated())
            font.pixelSize: Theme.fontSizeExtraLarge
            color: Theme.primaryColor
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.horizontalPageMargin
            }
        }
    }
    property bool isSimpleView: true
    property int simpleW: Math.round(page.width/4-25)
    property int simpleH: Math.round(page.height/8-20)
    property int advancedW: Math.round(page.width/9-15)
    property int advancedH: Math.round(page.height/8-7)
    //because of Theme.paddingLarge = 24, we have 3*26=78 and 4 buttons 78/4=14 => width: page.width/4-14
    Grid{
        id: simpleGrid
        columns: 4
        rows: 5
        spacing: Theme.paddingLarge
        anchors{
            bottom: page.bottom
            margins: Theme.horizontalPageMargin
        }
        visible: isPortrait&&isSimpleView
        Button { id: buttonAC; text: "AC";onClicked: Calculator.ac(); width: simpleW; height: simpleH}
        Button { id: buttonC; text: "C"; onClicked: Calculator.del(); width: simpleW; height: simpleH}
        Button { id: buttonPLMIN; text: "\u00b1"; onClicked: Calculator.plusMinus(); width: simpleW; height: simpleH}
        Button { id: buttonMore; text: "More..."; onClicked: isSimpleView = false; width: simpleW; height: simpleH}
        Button { id: button1; text: "1"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: button2; text: "2"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: button3; text: "3"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: buttonDIV; text: "\u00F7"; onClicked: Calculator.doOperation('/'); width: simpleW; height: simpleH}
        Button { id: button4; text: "4"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: button5; text: "5"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: button6; text: "6"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: buttonMIN; text: "-"; onClicked: Calculator.doOperation(this.text); width: simpleW; height: simpleH}
        Button { id: button7; text: "7"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: button8; text: "8"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: button9; text: "9"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: buttonPLS; text: "+"; onClicked: Calculator.doOperation(this.text); width: simpleW; height: simpleH}
        Button { id: buttonZPT; text: ","; onClicked: Calculator.dot() ; width: simpleW; height: simpleH}
        Button { id: button0; text: "0"; onClicked: Calculator.inputNum(this.text);width: simpleW; height: simpleH}
        Button { id: buttonMULT; text: "*"; onClicked: Calculator.doOperation(this.text); width: simpleW; height: simpleH}
        Button { id: buttonEQL; text: "="; onClicked: Calculator.doOperation(this.text); width: simpleW; height: simpleH}
    }
    Grid{
        id: advancedGrid
        columns: 4
        rows: 5
        spacing: Theme.paddingLarge
        anchors{
            bottom: page.bottom
            margins: Theme.horizontalPageMargin
        }
        visible: isPortrait&&(!isSimpleView)
        Button { id: buttonAC1; text: "AC"; onClicked: Calculator.ac(); width: simpleW; height:simpleH}
        Button { id: buttonC1; text: "C"; onClicked: Calculator.del(); width: simpleW; height: simpleH}
        Button { id: buttonMC; text: "MC"; onClicked: Calculator.memСlear(); width: simpleW; height: simpleH}
        Button { id: buttonSmp; text: "Simple"; onClicked: isSimpleView = true; width: simpleW; height: simpleH}
        Button { id: buttonSIN; text: "Sin x"; onClicked: Calculator.numberOperation('sin');width: simpleW; height: simpleH}
        Button { id: buttonCOS; text: "Cos x"; onClicked: Calculator.numberOperation('cos');width: simpleW; height: simpleH}
        Button { id: buttonTAN; text: "Tan x"; onClicked: Calculator.numberOperation('tan');width: simpleW; height: simpleH}
        Button { id: buttonMPLS; text: "M+"; onClicked: Calculator.memPLS(); width: simpleW; height: simpleH}
        Button { id: buttonSQRT; text: "\u221ax"; onClicked: Calculator.numberOperation('sqrt');width: simpleW; height: simpleH}
        Button { id: buttonPOW; text: "x\u02b8"; onClicked: Calculator.degree();width: simpleW; height: simpleH}
        Button { id: buttonFACT; text: "x!"; onClicked: Calculator.numberOperation('factorial');width: simpleW; height: simpleH}
        Button { id: buttonMMIN; text: "M-"; onClicked: Calculator.memMIN; width:simpleW; height: simpleH}
        Button { id: buttonPI; text: "\u03c0"; onClicked: Calculator.numberOperation('pi');width: simpleW; height: simpleH}
        Button { id: buttonLOG; text: "log x"; onClicked: Calculator.numberOperation('log');width: simpleW; height: simpleH}
        Button { id: buttonLN; text: "%"; onClicked: Calculator.numberOperation('percent');width: simpleW; height: simpleH}
        Button { id: buttonMEM; text: "MS"; onClicked: Calculator.memShow(); width: simpleW; height: simpleH}
        Button { id: buttonE; text: "e\u02b8"; onClicked: Calculator.numberOperation('exp'); width: simpleW; height: simpleH}
        Button { id: buttonABS; text: "|x|"; onClicked: Calculator.numberOperation('abs');width: simpleW; height: simpleH}
        Button { id: button; text: "e"; onClicked:Calculator.numberOperation('e'); width: simpleW; height: simpleH}
        Button { id: buttonEQL1; text: "="; onClicked: Calculator.doOperation(this.text); width: simpleW; height: simpleH}
    }
    Grid{
        //because of Theme.paddingMedium = 12, we have 8*14=112 and 9 buttons 112/9=12 => width: page.width/9-12
        //12*3 = 36 and 4 buttons 36/4=9 => height: page.height/8-9
        id: portraitGrid
        columns: 9
        rows: 4
        spacing: Theme.paddingMedium
        anchors{
            bottom: page.bottom
            margins: Theme.horizontalPageMargin
        }
        visible: isLandscape ? true : false
        Button { id: buttonAC2; text: "AC"; onClicked: Calculator.ac(); width: advancedW; height: advancedH}
        Button { id: buttonC2; text: "C"; onClicked: Calculator.del();width: advancedW; height: advancedH}
        Button { id: buttonMC2; text: "MC"; onClicked: Calculator.memСlear();width: advancedW; height: advancedH}
        Button { id: buttonMR2; text: "MR"; onClicked: Calculator.memRemove(); width: advancedW; height: advancedH}
        Button { id: button12; text: "1"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: button22; text: "2"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: button32; text: "3"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: buttonMULT2; text: "*"; onClicked: Calculator.doOperation(this.text); width: advancedW; height: advancedH}
        Button { id: buttonMPLS2; text: "M+"; onClicked: Calculator.memPLS(); width: advancedW; height: advancedH}
        Button { id: buttonSIN2; text: "Sin x"; onClicked: Calculator.numberOperation('sin');width: advancedW; height: advancedH}
        Button { id: buttonCOS2; text: "Cos x"; onClicked: Calculator.numberOperation('cos');width: advancedW; height: advancedH}
        Button { id: buttonTAN2; text: "Tan x"; onClicked: Calculator.numberOperation('tan');width: advancedW; height: advancedH}
        Button { id: buttonABS2; text: "|x|"; onClicked: Calculator.numberOperation('abs');width: advancedW; height: advancedH}
        Button { id: button42; text: "4"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: button52; text: "5"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: button62; text: "6"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: buttonDIV2; text: "\u00F7"; onClicked: Calculator.doOperation('/'); width: advancedW; height: advancedH}
        Button { id: buttonMMIN2; text: "M-"; onClicked: Calculator.memMIN(); width: advancedW; height: advancedH}
        Button { id: buttonSQRT2; text: "\u221ax"; onClicked: Calculator.numberOperation('sqrt');width: advancedW; height: advancedH}
        Button { id: buttonPOW2; text: "x\u02b8"; onClicked: Calculator.degree();width: advancedW; height: advancedH}
        Button { id: buttonFACT2; text: "x!"; onClicked: Calculator.numberOperation('factorial');width: advancedW; height: advancedH}
        Button { id: buttonE2; text: "e\u02b8"; onClicked: Calculator.numberOperation('exp'); width: advancedW; height: advancedH}
        Button { id: button72; text: "7"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: button82; text: "8"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: button92; text: "9"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: buttonPLS2; text: "+"; onClicked: Calculator.doOperation(this.text); width: advancedW; height: advancedH}
        Button { id: buttonMEM2; text: "MS"; onClicked: Calculator.memShow(); width: advancedW; height: advancedH}
        Button { id: buttonPI2; text: "\u03c0"; onClicked: Calculator.numberOperation('pi');width: advancedW; height: advancedH}
        Button { id: buttonLOG2; text: "log x"; onClicked: Calculator.numberOperation('log');width: advancedW; height: advancedH}
        Button { id: buttonLN2; text: "e"; onClicked: Calculator.numberOperation('e');width: advancedW; height: advancedH}
        Button { id: buttonLOG1; text: "%"; onClicked: Calculator.numberOperation('percent');width: advancedW; height: advancedH}
        Button { id: buttonZPT2; text: ","; onClicked: Calculator.dot(); width: advancedW;height: advancedH}
        Button { id: button02; text: "0"; onClicked: Calculator.inputNum(this.text);width: advancedW; height: advancedH}
        Button { id: buttonPLMIN2; text: "\u00b1"; onClicked: Calculator.plusMinus();width: advancedW; height: advancedH}
        Button { id: buttonMIN2; text: "-"; onClicked: Calculator.doOperation(this.text); width: advancedW; height: advancedH}
        Button { id: buttonEQL2; text: "="; onClicked: Calculator.doOperation(this.text); width: advancedW; height: advancedH}
    }
}
