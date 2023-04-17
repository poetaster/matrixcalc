import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQml 2.2


Page {
    property var globalVariables

    id: page
    height: column.height
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
                title: qsTr("%1").arg(globalVariables.funct)
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Matrix 1")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Item {
                id: item1
                width: parent.width
                height: canvas1.height + Theme.itemSizeSmall
                Canvas {
                    id: canvas1
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: page.width - 10
                    height: canvas1.width
                    onPaint: {
                        var ctx = canvas1.getContext("2d");
                        ctx.clearRect(0,0,canvas1.width,canvas1.height);
                        ctx.fillStyle = "rgba(255,255,255,0.3)";
                        ctx.fillRect(0, 0, width, height);
                        var rows = globalVariables.rows;
                        var columns = globalVariables.columns;
                        var matrix = globalVariables.matrix;
                        var i = 0;
                        var column = canvas1.width/columns;
                        var row = canvas1.width/rows;
                        var column_i = 10;
                        var row_i = row/2;
                        for(i=0; i < rows; i++){
                            for(var j = 0; j < columns; j++)
                            {
                                if (Number(String(matrix[i][j]).length) >= 4){
                                    ctx.fillStyle = "black";
                                    ctx.font = 'italic 15px sans-serif';
                                    ctx.fillText("..", column_i, row_i);
                                    column_i += column;
                                }
                                else {
                                    ctx.fillStyle = "black";
                                    ctx.font = 'italic 15px sans-serif';
                                    ctx.fillText(matrix[i][j], column_i, row_i);
                                    column_i += column;
                                }
                            }
                            row_i += row;
                            column_i = 10;
                        }
                    }
                }
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Matrix 2")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Item {
                id: item2
                width: parent.width
                height: canvas.height + Theme.itemSizeSmall
                Canvas {
                    id: canvas
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: page.width - 10
                    height: canvas.width
                    onPaint: {
                        var ctx = canvas.getContext("2d");
                        ctx.clearRect(0,0,canvas.width,canvas.height);
                        ctx.fillStyle = "rgba(255,255,255,0.3)";
                        ctx.fillRect(0, 0, width, height);
                        var rows = globalVariables.rows2;
                        var columns = globalVariables.columns2;
                        var matrix = globalVariables.matrix2;
                        var i = 0;
                        var column = canvas.width/columns;
                        var row = canvas.width/rows;
                        var column_i = 10;
                        var row_i = row/2;
                        for(i=0; i < rows; i++){
                            for(var j = 0; j < columns; j++)
                            {
                                ctx.fillStyle = "black";
                                ctx.font = 'italic 15px sans-serif';
                                ctx.fillText(matrix[i][j], column_i, row_i);
                                column_i += column;
                            }
                            row_i += row;
                            column_i = 10;
                        }
                    }
                }
            }
            Label {
                x: Theme.horizontalPageMargin
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Result")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Item {
                id: item3
                width: parent.width
                height: canvasResult.height + Theme.itemSizeSmall
                Canvas {
                    id: canvasResult
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: page.width - 10
                    height: canvasResult.width
                    onPaint: {
                        var columns;
                        if(globalVariables.funct === "Multiply"){
                            globalVariables.multMatrix();
                            columns = globalVariables.rows;
                        }
                        else{
                            globalVariables.sumMatrix();
                            columns = globalVariables.columns;
                        }
                        var ctx = canvasResult.getContext("2d");
                        ctx.clearRect(0,0,canvasResult.width,canvasResult.height);
                        ctx.fillStyle = "rgba(255,255,255,0.3)";
                        ctx.fillRect(0, 0, width, height);
                        var rows = globalVariables.rows;
                        var matrix = globalVariables.matrixRes;
                        var i = 0;
                        var column = canvasResult.width/columns;
                        var row = canvasResult.width/rows;
                        var column_i = 10;
                        var row_i = row/2;
                        for(i=0; i < rows; i++){
                            for(var j = 0; j < columns; j++)
                            {
                                ctx.fillStyle = "black";
                                ctx.font = 'italic 15px sans-serif';
                                ctx.fillText(matrix[i][j], column_i, row_i);
                                column_i += column;
                            }
                            row_i += row;
                            column_i = 10;
                        }
                    }
                }
            }
            Button {
                id: buttonReturn
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Return to the selection of operations")
                onClicked:{
                    pageStack.push(Qt.resolvedUrl("MatrixInput.qml"))
                }
            }
        }
    }
}




