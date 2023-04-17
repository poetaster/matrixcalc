import QtQuick 2.0
import Sailfish.Silica 1.0
import "d3.js" as D3

Page {

    property var elem
    property var border
    property var rootLine
    property bool debug: true
    id: page

    //backNavigation: false

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    Plot {
        id: plot
        anchors.margins: Theme.horizontalPageMargin
        width: parent.width
        height: parent.height

        function drawPlot(line) {
            if (debug) console.log("draw")
            line(getPoints());
        }

        function getPoints() {
            var points = [];
            var dx = (maxX - minX) / 100;
            if (debug) console.log(dx)
            for(var x = minX; x <= maxX; x += dx) {
                points.push([x, plot.roundOfNum(Math.pow(elem[1], x) - elem[0])]);
            }
            return points;
        }
   }
}
