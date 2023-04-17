import QtQuick 2.0
import Sailfish.Silica 1.0
import "d3.js" as D3

Page {

    property var elem
    property var border
    property var rootLine
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    Plot {
        id: plot
        anchors.margins: Theme.horizontalPageMargin
        width: parent.width
        height: parent.height
        function drawPlot(line) {
            line(getPoints());
        }

        function getPoints() {
            var points = [];
            var dx = (maxX - minX) / 100;
            for(var x = minX; x <= maxX; x += dx) {
                var y = 0;
                for (var j = 0; j < 5; j++) {
                    y += Math.pow(x, j)  * elem[j];
                }
                points.push([x, y]);
            }
            return points;
        }

    }
}
