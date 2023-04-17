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
                anchors.horizontalCenter: parent.horizontalCenter
                text: "+"
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
                    y: 10
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
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                TextField{
                    id : rowsValue
                    objectName: "rowsValue"
                    inputMethodHints: Qt.ImhDigitsOnly
                    label: qsTr("Row")
                    text: "1"
                    placeholderText : label
                    width : 200
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: {
                        if(rowsValue.text >globalVariables.rows2)
                            rowsValue.text = qsTr('')
                        else
                            columnsValue.focus = true
                    }
                    onFocusChanged: {
                        if (focus)
                            selectAll();
                    }
                }
                TextField{
                    id : columnsValue
                    objectName: "columnsValue"
                    inputMethodHints: Qt.ImhDigitsOnly
                    label: qsTr("Column")
                    text: "1"
                    placeholderText : label
                    width : 200
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: {
                        if(columnsValue.text > globalVariables.columns2)
                            columnsValue.text = qsTr('')
                        else{
                            var rows = rowsValue.text-1;
                            var columns = columnsValue.text-1;
                            cellValue.text = qsTr(String(globalVariables.matrix2[rows][columns]))
                            cellValue.focus = true
                        }
                    }
                    onFocusChanged: {
                        if (focus)
                            selectAll();
                    }
                }
            }
            TextField{
                id : cellValue
                width : 500
                inputMethodHints: Qt.ImhDigitsOnly
                label: qsTr("Element Value")
                placeholderText : label
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: {
                    if (columnsValue.text > globalVariables.columns2)
                    {
                        columnsValue.text = qsTr('1')
                        rowsValue.text = qsTr('1')
                        cellValue.text = qsTr('')
                    }
                    else
                    {
                        if (rowsValue.text > globalVariables.rows2)
                        {
                            columnsValue.text = qsTr('1')
                            rowsValue.text = qsTr('1')
                            cellValue.text = qsTr('')
                        }
                        else
                        {
                            if (Number(cellValue.text.length) < 4)
                            {
                                var rows = Number(rowsValue.text-1);
                                var columns = Number(columnsValue.text-1);
                                globalVariables.matrix2[rows][columns] = Number(cellValue.text);
                                canvas.requestPaint();
                                if (Number(rowsValue.text) < globalVariables.rows2)
                                {
                                    if (Number(columnsValue.text) < globalVariables.columns2)
                                    {
                                        columnsValue.text = qsTr(String(Number(columnsValue.text)+1))
                                        rowsValue.text = qsTr(String(Number(rowsValue.text)))
                                        cellValue.text = qsTr('')
                                        cellValue.focus = true
                                    }
                                    else
                                    {
                                        columnsValue.text = qsTr("1")
                                        rowsValue.text = qsTr(String(Number(rowsValue.text)+1))
                                        cellValue.text = qsTr('')
                                        cellValue.focus = true
                                    }
                                }
                                else
                                {
                                    if (Number(columnsValue.text) < globalVariables.columns)
                                    {
                                        columnsValue.text = qsTr(String(Number(columnsValue.text)+1))
                                        rowsValue.text = qsTr(String(Number(rowsValue.text)))
                                        cellValue.text = qsTr('')
                                        cellValue.focus = true
                                    }
                                    else
                                    {
                                        columnsValue.text = qsTr("1")
                                        rowsValue.text = qsTr("1")
                                        cellValue.text = qsTr('')
                                        cellValue.focus = true
                                    }
                                }
                            }
                            else{
                                cellValue.text = qsTr('')
                                cellValue.focus = true
                            }
                        }
                    }
                }
                onFocusChanged: {
                    if (focus)
                        selectAll();
                }
            }
            Button {
                id: buttonEnter
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Enter")
                onClicked:{
                    if (columnsValue.text > globalVariables.columns2)
                    {
                        columnsValue.text = qsTr('1')
                        rowsValue.text = qsTr('1')
                        cellValue.text = qsTr('')
                    }
                    else
                    {
                        if (rowsValue.text > globalVariables.rows2)
                        {
                            columnsValue.text = qsTr('1')
                            rowsValue.text = qsTr('1')
                            cellValue.text = qsTr('')
                        }
                        else
                        {
                            if (Number(cellValue.text.length) < 4)
                            {
                                var rows = Number(rowsValue.text-1);
                                var columns = Number(columnsValue.text-1);
                                globalVariables.matrix2[rows][columns] = Number(cellValue.text);
                                canvas.requestPaint();
                                if (Number(rowsValue.text) < globalVariables.rows)
                                {
                                    if (Number(columnsValue.text) < globalVariables.columns)
                                    {
                                        columnsValue.text = qsTr(String(Number(columnsValue.text)+1))
                                        rowsValue.text = qsTr(String(Number(rowsValue.text)))
                                        cellValue.text = qsTr('')
                                        cellValue.focus = true
                                    }
                                    else
                                    {
                                        columnsValue.text = qsTr("1")
                                        rowsValue.text = qsTr(String(Number(rowsValue.text)+1))
                                        cellValue.text = qsTr('')
                                        cellValue.focus = true
                                    }
                                }
                                else
                                {
                                    if (Number(columnsValue.text) < globalVariables.columns)
                                    {
                                        columnsValue.text = qsTr(String(Number(columnsValue.text)+1))
                                        rowsValue.text = qsTr(String(Number(rowsValue.text)))
                                        cellValue.text = qsTr('')
                                        cellValue.focus = true
                                    }
                                    else
                                    {
                                        columnsValue.text = qsTr("1")
                                        rowsValue.text = qsTr("1")
                                        cellValue.text = qsTr('')
                                        cellValue.focus = true
                                    }
                                }
                            }
                            else{
                                cellValue.text = qsTr('')
                                cellValue.focus = true
                            }
                        }
                    }
                }
            }
            Button {
                id: buttonCount
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr(globalVariables.funct)
                onClicked:{
                    if(globalVariables.funct === "Add")
                        pageStack.push(Qt.resolvedUrl("MatrixTwoResult.qml"), {globalVariables: globalVariables})
                }
            }
        }
    }
}



