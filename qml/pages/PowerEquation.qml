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

    property var global
    property var roots: []
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
                title: qsTr("Equation of the 4th degree")
            }
            Grid {
                id: lableAndTextFieald
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 0
                columns: 2
                rows: 5
                Row{
                    Label {
                        x: Theme.horizontalPageMargin
                        text: "x"
                        color: Theme.secondaryHighlightColor
                        font.pixelSize: Theme.fontSizeExtraLarge
                    }
                    Label {
                        text: "4"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryHighlightColor
                    }
                }
                TextField {
                    id: numberField4
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    label: "a"
                    placeholderText: label
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberField3.focus = true
                }

                Row{
                    Label {
                        x: Theme.horizontalPageMargin
                        text: "x"
                        color: Theme.secondaryHighlightColor
                        font.pixelSize: Theme.fontSizeExtraLarge
                    }
                    Label {
                        text: "3"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryHighlightColor
                    }
                }
                TextField {
                    id: numberField3
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    label: "b"
                    placeholderText: label
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberField2.focus = true
                }
                Row{
                    Label {
                        x: Theme.horizontalPageMargin
                        text: "x"
                        color: Theme.secondaryHighlightColor
                        font.pixelSize: Theme.fontSizeExtraLarge
                    }

                    Label {
                        text: "2"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryHighlightColor
                    }
                }
                TextField {
                    id: numberField2
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    label: "c"
                    placeholderText: label
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberField1.focus = true
                }
                Row{
                    Label {
                        x: Theme.horizontalPageMargin
                        text: "x"
                        color: Theme.secondaryHighlightColor
                        font.pixelSize: Theme.fontSizeExtraLarge
                    }

                    Label {
                        text: "1"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryHighlightColor
                    }
                }
                TextField {
                    id: numberField1
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    label: "d"
                    placeholderText: label
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: numberField0.focus = true
                }
                Row{
                    Label {
                        x: Theme.horizontalPageMargin
                        text: "x"
                        color: Theme.secondaryHighlightColor
                        font.pixelSize: Theme.fontSizeExtraLarge
                    }

                    Label {
                        text: "0"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryHighlightColor
                    }
                }
                TextField {
                    id: numberField0
                    width: 400
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    //text: qsTr("0")
                    label: "e"
                    placeholderText: label
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                }
            }
            Label {
                id: answer1
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("The roots of equation:\n%1").arg(square_equation())
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Button {
                id: graficButton2
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Graph")
                onClicked:{
                    var a = 4 * parseFloat(numberField4.text.length === 0 ? '0' : numberField4.text);
                    var b = 3 * parseFloat(numberField3.text.length === 0 ? '0' : numberField3.text);
                    var c = 2 * parseFloat(numberField2.text.length === 0 ? '0' : numberField2.text);
                    var d = parseFloat(numberField1.text.length === 0 ? '0' : numberField1.text);
                    var xCoordinates = [];
                    var allAnswers;
                    var delta = 10;
                    if (a !== 0) {
                        allAnswers = equationThirndDegree(a, b, c, d);
                    } else if (b !== 0) {
                        allAnswers = equationSecondDegree(b, c, d);
                    } else if (c !== 0) {
                        allAnswers = [-d / c, 0];
                    } else {
                        allAnswers = [-c,c];
                    }
                    allAnswers = allAnswers.concat(roots);
                    // Getting rid of answers with imaginary part
                    for (var i = 0; i < allAnswers.length; i += 2) {
                        if (allAnswers[i + 1] === 0) xCoordinates.push(allAnswers[i]);
                    }
                    var yCoordinates = xCoordinates.map(function(x) {
                        return functionValue(x);
                    });
                    var border = [[Math.min.apply(null, xCoordinates)-delta, Math.min.apply(null, yCoordinates)-delta],
                                  [Math.max.apply(null, xCoordinates)+delta, Math.max.apply(null, yCoordinates)+delta]];
                    pageStack.push(Qt.resolvedUrl("Grafix.qml"), {elem: value(), border: border, rootLine: 0});
                }
            }
        }
    }

    function functionValue(x) {
        var сoefficients = []
        сoefficients.push(numberField0.text);
        сoefficients.push(numberField1.text);
        сoefficients.push(numberField2.text);
        сoefficients.push(numberField3.text);
        сoefficients.push(numberField4.text);
        var answer = 0;
        for (var i = 0; i < 5; i++) {
            answer += parseFloat(сoefficients[i].length === 0 ? '0' : сoefficients[i]) * Math.pow(x, i);
        }
        return answer;
    }

    function value(){
        var a = numberField4.text,b = numberField3.text, c = numberField2.text, d = numberField1.text, e = numberField0.text;
        return [e,d,c,b,a]
    }

    //Function calling the subfunction depending on the values entered.
    function square_equation() {
        var root, answer;
        var a = numberField4.text,b = numberField3.text, c = numberField2.text, d = numberField1.text, e = numberField0.text;
        if( b == 0 && c == 0 && d == 0 && e == 0 && a == 0 ) {
            roots = [];
            return qsTr("You did not enter anything");
        }
        if( b == 0 && c == 0 && d == 0 && a == 0 ) {
            roots = [];
            return qsTr("No solutions");
        }
        if( b == 0 && c == 0 && a == 0 ) {
            answer = roundOfNum(+(-e/d))
            roots = [answer, 0];
            return answer;
        }
        if( b == 0 && a == 0){
            root = equationSecondDegree(c,d,e);//[re1,im1,re2,im2]
            if (root[1]==0)
                answer=roundOfNum(root[0])+"\n";
            else
                answer=roundOfNum(root[0])+"+i*("+roundOfNum(root[1])+")\n";
            if (root[3]==0)
                answer+=roundOfNum(root[2])+"\n";
            else
                answer+=roundOfNum(root[2])+"+i*("+roundOfNum(root[3])+")\n";
            roots = root;
        }
        else if( a == 0){
            root = equationThirndDegree(b,c,d,e);
            if (root[1]===0)
                answer=roundOfNum(root[0])+"\n";
            else
                answer=roundOfNum(root[0])+"+i*("+roundOfNum(root[1])+")\n";
            if (root[3]===0)
                answer+=roundOfNum(root[2])+"\n";
            else
                answer+=roundOfNum(root[2])+"+i*("+roundOfNum(root[3])+")\n";
            if (root[5]===0)
                answer+=roundOfNum(root[4])+"\n";
            else
                answer+=roundOfNum(root[4])+"+i*("+roundOfNum(root[5])+")\n";
            roots = root;
        } else {
            root = equationFourthDegree(a,b,c,d,e);
            if (root[1]===0)
                answer=roundOfNum(root[0])+"\n";
            else
                answer=roundOfNum(root[0])+"+i*("+roundOfNum(root[1])+")\n";
            if (root[3]===0)
                answer+=roundOfNum(root[2])+"\n";
            else
                answer+=roundOfNum(root[2])+"+i*("+roundOfNum(root[3])+")\n";
            if (root[5]===0)
                answer+=roundOfNum(root[4])+"\n";
            else
                answer+=roundOfNum(root[4])+"+i*("+roundOfNum(root[5])+")\n";
            if (root[7]===0)
                answer+=roundOfNum(root[6])+"\n";
            else
                answer+=roundOfNum(root[6])+"+i*("+roundOfNum(root[7])+")\n";
            roots = root;
        }
        return answer;
    }

    //Solves equation 4 of its degree.(Ferrary solution)
    function equationFourthDegree(a,b,c,d,e){

        var re1, im1 = 0, re2, im2 = 0, re3, im3 = 0, re4, im4 = 0;
        var p = (8*a*c-3*b*b)/(8*a*a);
        var q = (8*a*a*d+b*b*b-4*a*b*c)/(8*a*a*a);
        var r = (16*a*b*b*c-64*a*a*b*d-3*b*b*b*b+256*a*a*a*e)/(256*a*a*a*a);
        var a0 = 1;
        var b0 = p;
        var c0 = (p*p-4*r)/4;
        var d0 = -q*q/8;
        // cardano function (3rd degree)
        // returns the real and imaginary parts (those z1, h1 ...)
        var root = equationThirndDegree(a0,b0,c0,d0);
        var z1=root[0],h1=root[1],z2=root[2],h2=root[3], z3=root[4],h3=root[5];
        if( z1 <= 0 ){
            //Solve the Biquadratic equation
            var f = 0;
            var p1 = (8*a*c-3*b*b)/(8*a*a);
            var r1 = (16*a*b*b*c-64*a*a*b*d-3*Math.pow(b,4)+256*Math.pow(a,3)*e)/(256*Math.pow(a,4));
            if( p1*p1-4*r1 >= 0 ){
                if( -p1+Math.sqrt(p1*p1-4*r1) >= 0 ){
                    re1 = Math.sqrt((-p1+Math.sqrt(p1*p1-4*r1))/2)-b/(4*a);
                    im1 = 0;
                    re2 = -Math.sqrt((-p1+Math.sqrt(p1*p1-4*r1))/2)-b/(4*a);
                    im2 = 0;
                }else{
                    re1 = -b/(4*a);
                    im1 = Math.sqrt((p1-Math.sqrt(p1*p1-4*r1))/2);
                    re2 = -b/(4*a);
                    im2 = -Math.sqrt((p1-Math.sqrt(p1*p1-4*r1))/2);
                }
                if( -p1-Math.sqrt(p1*p1-4*r1) >= 0 ){
                    re3 = Math.sqrt((-p1-Math.sqrt(p1*p1-4*r1))/2)-b/(4*a);
                    im3 = 0;
                    re4 = -Math.sqrt((-p1+Math.sqrt(p1*p1-4*r1))/2)-b/(4*a);
                    im4 = 0;
                }
                else{
                    re3 = -b/(4*a);
                    im3 = Math.sqrt((p1+Math.sqrt(p1*p1-4*r1))/2);
                    re4 = -b/(4*a);
                    im4 = -Math.sqrt((p1+Math.sqrt(p1*p1-4*r1))/2);
                }
                return [re1,im1,re2,im2,re3,im3,re4,im4];
            }
            if( p1*p1-4*r < 0 ){
                if ( p1 < 0 )
                    f = Math.atan(-Math.sqrt(4*r1-p1*p1)/p1);
                if( p1 > 0 )
                    f = Math.atan(-Math.sqrt(4*r1-p1*p1)/p1)+Math.PI;
                if( p1 == 0 )
                    f = Math.PI/2;
                re1 = Math.sqrt(Math.sqrt(r))*Math.cos(f/2)-b/(4*a);
                re2 = Math.sqrt(Math.sqrt(r))*Math.cos(f/2)-b/(4*a);
                re3 = -Math.sqrt(Math.sqrt(r))*Math.cos(f/2)-b/(4*a);
                re4 = -Math.sqrt(Math.sqrt(r))*Math.cos(f/2)-b/(4*a);
                im1 = Math.sqrt(Math.sqrt(r))*Math.sin(F/2);
                im2 = -Math.sqrt(Math.sqrt(r))*Math.sin(F/2);
                im3 = Math.sqrt(Math.sqrt(r))*Math.sin(F/2);
                im4 = -Math.sqrt(Math.sqrt(r))*Math.sin(F/2);
                return [re1,im1,re2,im2,re3,im3,re4,im4];
            }
        }
        var d1 = 2*z1-4*(p/2+z1+q/2/Math.sqrt(2*z1));
        var d2 = 2*z1-4*(p/2+z1-q/2/Math.sqrt(2*z1));
        if( d1 >= 0 ){
            re1 = (Math.sqrt(2*z1)+Math.sqrt(d1))/2-b/(4*a);
            re2 = (Math.sqrt(2*z1)-Math.sqrt(d1))/2-b/(4*a);
        }else{
            re1 = Math.sqrt(2*z1)/2-b/(4*a);
            im1 = Math.sqrt(-d1)/2;
            re2 = Math.sqrt(2*z1)/2-b/(4*a);
            im2 = -Math.sqrt(-d1)/2;
        }
        if( d2 >= 0 ){
            re3 = (-Math.sqrt(2*z1)+Math.sqrt(d2))/2-b/(4*a);
            re4 = (-Math.sqrt(2*z1)-Math.sqrt(d2))/2-b/(4*a);
        }else{
            re3 = -Math.sqrt(2*z1)/2-b/(4*a);
            im3 = Math.sqrt(-d2)/2;
            re4 = -Math.sqrt(2*z1)/2-b/(4*a);
            im4 = -Math.sqrt(-d2)/2;
        }
        return [re1,im1,re2,im2,re3,im3,re4,im4];
    }

    //Solves equation 3 of its degree.(Formula Cardano)
    function equationThirndDegree(a,b,c,d){
        var re1, im1 = 0, re2, im2 = 0, re3, im3 = 0, y1, y2;
        var p = (3*a*c-Math.pow(b, 2))/(3*Math.pow(a,2));
        var q = (2*Math.pow(b,3)-9*a*b*c+27*Math.pow(a,2)*d)/(27*Math.pow(a,3));
        var S = (4*Math.pow(3*a*c-Math.pow(b,2),3)+Math.pow(2*Math.pow(b,3)-9*a*b*c+27*Math.pow(a,2)*d, 2))/(2916*Math.pow(a,6));
        if ( S < 0 ){
            var F;
            if( q < 0 )
                F = Math.atan(-2*Math.sqrt(-S)/q);
            if( q > 0 )
                F = Math.atan(-2*Math.sqrt(-S)/q) + Math.PI;
            if( q == 0 )
                F = Math.PI/2;
            re1 = 2*Math.sqrt(-p/3)*Math.cos(F/3)-b/a/3;
            re2 = 2*Math.sqrt(-p/3)*Math.cos((F+2*Math.PI)/3)-b/a/3;
            re3 = 2*Math.sqrt(-p/3)*Math.cos((F+4*Math.PI)/3)-b/a/3;
            if( q == 0 )
                re3 = -b/a/3;
        }
        if ( S > 0 ){
            if ( -q/2+Math.sqrt(S) > 0 )
                y1 = Math.exp(Math.log(Math.abs(-q/2+Math.sqrt(S)))/3);
            if ( -q/2+Math.sqrt(S) < 0 )
                y1 = -Math.exp(Math.log(Math.abs(-q/2+Math.sqrt(S)))/3);
            if ( -q/2+Math.sqrt(S) == 0 )
                y1 = 0;
            if ( -q/2-Math.sqrt(S) > 0 )
                y2 = Math.exp(Math.log(Math.abs(-q/2-Math.sqrt(S)))/3);
            if ( -q/2-Math.sqrt(S) < 0 )
                y2 = -Math.exp(Math.log(Math.abs(-q/2-Math.sqrt(S)))/3);
            if ( -q/2-Math.sqrt(S) == 0 )
                y2 = 0;
            re1 = y1+y2-b/a/3;
            re2 = -(y1+y2)/2-b/a/3;
            im2 = (y1-y2)*Math.sqrt(3)/2;
            re3 = -(y1+y2)/2-b/a/3;
            im3 = -(y1-y2)*Math.sqrt(3)/2;
        }
        if ( S == 0 ){
            if ( q < 0 ){
                y1 = Math.exp(Math.log(Math.abs(-q/2))/3);
            }
            if ( q > 0 ){
                y1 = -Math.exp(Math.log(Math.abs(-q/2))/3)
            }
            if ( q == 0 ){
                y1 = 0;
            }
            re1 = 2*y1-b/a/3;
            re2 = -y1-b/a/3;
            re3 = -y1-b/a/3
        }
        return [re1,im1,re2,im2,re3,im3];
    }

    //Solves the quadratic equation.
    function equationSecondDegree(a,b,c){
        var dis = Math.pow(b,2)-4*a*c, x1, x2;
        var re1,re2,im1=0,im2=0;
        if ( dis >= 0 ){
            re1 = (-b+Math.sqrt(b*b-4*a*c))/(2*a);
            re2 = (-b-Math.sqrt(b*b-4*a*c))/(2*a);
        }else{
            re1 = -b/2/a;
            im1 = Math.sqrt(4*a*c-b*b)/(2*a);
            re2 = -b/2/a;
            im2 = -Math.sqrt(4*a*c-b*b)/(2*a);
        }
        return [re1,im1,re2,im2];
    }

    //Function of rounding a number with a specified accuracy.
    function roundOfNum(num){
        return Math.round(num * 100) / 100;
    }
}
