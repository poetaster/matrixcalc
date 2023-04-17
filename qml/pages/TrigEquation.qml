/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        VerticalScrollDecorator {}

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Trigonometric equations")
            }
            Label {
                x: Theme.horizontalPageMargin
                text: getEquation()
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    x: Theme.horizontalPageMargin
                    text: qsTr("a")
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                TextField {
                    id: numberFieldA
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberFieldB.focus = true
                    //text: '5'
                }
            }
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    x: Theme.horizontalPageMargin
                    text: "b"
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                TextField {
                    id: numberFieldB
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberFieldC.focus = true
                    //text: '5'
                }
            }
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    x: Theme.horizontalPageMargin
                    text: "c"
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                TextField {
                    id: numberFieldC
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberFieldD.focus = true
                    //text: '6'
                }
            }
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    x: Theme.horizontalPageMargin
                    text: "d"
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                TextField {
                    id: numberFieldD
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    //text: '6'
                }
            }
            Label {
                id: answer
                visible: false
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("The roots of equation: %1").arg(trigEquation(numberFieldA.text, numberFieldB.text,  numberFieldC.text, numberFieldD.text, 0))
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Button {
                id: graficButton2
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Graph")
                onClicked:{
                    var a = parseFloat(numberFieldA.text.length === 0 ? '0' : numberFieldA.text);
                    var c = parseFloat(numberFieldC.text.length === 0 ? '0' : numberFieldC.text);
                    var y = 0;
                    var border = [[-2 * Math.PI, -a - c + y], [2 * Math.PI, a + c + y]];
                    pageStack.push(Qt.resolvedUrl("GrafixTrig.qml"), {elem: id(), border: border, rootLine: y});
                 }
            }
        }
    }

    function id(){
        var a = numberFieldA.text,b = numberFieldB.text, c = numberFieldC.text, d = numberFieldD.text, y = 0;
        return [y,d,c,b,a]
    }

    function getEquation(){
        var a, b, c, d, y;
        if(numberFieldA.text == "")
            a = "A";
        else
            a = numberFieldA.text;
        if(numberFieldB.text == "")
            b = "B";
        else
            b = numberFieldB.text;

        if(numberFieldC.text == "")
            c = "C";
        else
            c = numberFieldC.text;

        if(numberFieldD.text == "")
            d = "D";
        else
            d = numberFieldD.text;
        return ("0 ="+a+"*sin("+b+"x)+"+c+"*cos("+d+"x)");
    }


    function trigEquation(a,b,c,d,y){
        if( Math.abs(y) > Math.sqrt(a*a+b*b) || a*a+b*b == 0)
            return qsTr("There are no roots");
        else
            return "(-1)^n*arcsin("+c/Math.sqrt(a*a+b*b)+")+Pi*n-"+(-Math.atan2(b,a))
    }

}
