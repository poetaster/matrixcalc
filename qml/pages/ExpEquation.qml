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
                title: qsTr("Exponential equation")
            }
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    x: Theme.horizontalPageMargin
                    text: getA()
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                Label {
                    x: Theme.horizontalPageMargin
                    text: " = "
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                Label {
                    x: Theme.horizontalPageMargin
                    text: getB()
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                Label {
                    text: "x"
                    font.pixelSize: Theme.fontSizeExtraSmall
                    color: Theme.secondaryHighlightColor
                }
            }
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    x: Theme.horizontalPageMargin
                    text: "a"
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeExtraLarge
                }
                TextField {
                    id: numberFieldA
                    width: 300
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberFieldB.focus = true
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
                    width: 300
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberFieldB.focus = false
                }
            }
            Label {
                id: answer
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Root of the equation:\n %1").arg(simpleExpEquation(numberFieldA.text, numberFieldB.text))
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Button {
                id: graficButton2
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("graph")
                onClicked:{
                    var a = parseFloat(numberFieldA.text.length === 0 ? '1' : numberFieldA.text);
                    var b = parseFloat(numberFieldB.text.length === 0 ? '1' : numberFieldB.text);
                    var delta = 5;
                    var root = roundOfNum(simpleExpEquation(a,b));
                    if(root == '-Infinity' || root == 'Infinity' || isNaN(root) == true )
                        root = 0;
                    pageStack.push(Qt.resolvedUrl("GrafixExp.qml"), {elem: [a,b],
                                       border: [[root-delta, root-delta], [root+delta, root+delta]], rootLine: 0});
                 }
            }
        }
    }

    //Function check deg of number
    function itDegOfNumber(a,b){
        var ma, mi;
        if(a>b){
            ma = a;
            mi = b;
        }
        else{
            ma = b;
            mi = a;
        }
        if( Math.log(ma) % Math.log(mi) < 0.000001 ){
            return true;
        }
        else
            return false;
    }

    function getA(){
        var a;
        if (numberFieldA.text == "")
            a = "a";
        else
            a = numberFieldA.text;
        return a;
    }

    function getB(){
        var a;
        if (numberFieldB.text == "")
            a = "b";
        else
            a = numberFieldB.text;
        return a;
    }

    function getBaseLog(x, y) {
      return Math.log(y) - Math.log(x);
    }

    function simpleExpEquation(a, b){
        if( a == "" && b == "")
            return qsTr("You did not enter anything");
            else
            return getBaseLog(b,a);
    }

    function roundOfNum(num){
        return Math.round(num * 100) / 100;
    }
}
