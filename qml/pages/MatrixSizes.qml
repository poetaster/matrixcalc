import QtQuick 2.0
import QtQml 2.2
import Sailfish.Silica 1.0


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
                title: qsTr("Matrix calculator")
            }
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Enter the dimension of the matrix\nfrom 1x1 to 15x15")
            }

            Item {
                id: item
                width: parent.width
                height: Theme.itemSizeSmall
                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    TextField{
                        id : rowsValue
                        objectName: "rowsValue"
                        inputMethodHints: Qt.ImhDigitsOnly
                        label: qsTr("Rows")
                        text: qsTr("1")
                        placeholderText : label
                        width : 250
                        EnterKey.iconSource: "image://theme/icon-m-enter-next"
                        EnterKey.onClicked: {
                            if((Number(rowsValue.text)) > 0 && parseInt(Number(rowsValue.text)) === (Number(rowsValue.text)) && (Number(rowsValue.text)) < 16)
                                columnsValue.focus = true
                            else
                                rowsValue.text = qsTr('')
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
                        label: qsTr("Columns")
                        text: qsTr("1")
                        placeholderText : label
                        width : 250
                        EnterKey.iconSource: "image://theme/icon-m-enter-next"
                        EnterKey.onClicked: {
                            if((Number(columnsValue.text)) > 0 && parseInt(Number(columnsValue.text)) === (Number(columnsValue.text)) && (Number(columnsValue.text)) < 16)
                                globalVariables.initialization(Number(rowsValue.text), Number(columnsValue.text))
                            else
                                columnsValue.text = qsTr('')

                        }
                        onFocusChanged: {
                            if (focus)
                                selectAll();
                        }
                    }
                }
            }
            Button {
                id: buttonEnter
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Continue")
                onClicked:{
                    if ((Number(columnsValue.text)) > 0 && parseInt(Number(columnsValue.text)) === (Number(columnsValue.text)) && (Number(rowsValue.text)) > 0 && parseInt(Number(rowsValue.text)) === (Number(rowsValue.text)) && (Number(columnsValue.text)) < 16 && (Number(rowsValue.text)) < 16)
                    {
                        if(globalVariables.funct === "Add"){
                            globalVariables.initialization2(Number(rowsValue.text), Number(columnsValue.text), Number(rowsValue.text), Number(columnsValue.text))
                            pageStack.push(Qt.resolvedUrl("Matrix.qml"), {globalVariables: globalVariables})
                        }
                        else{
                            globalVariables.initialization(Number(rowsValue.text), Number(columnsValue.text))
                            pageStack.push(Qt.resolvedUrl("Matrix.qml"), {globalVariables: globalVariables})
                        }
                    }
                    else
                    {
                        columnsValue.text = qsTr('')
                        rowsValue.text = qsTr('')

                    }
                }
            }
        }
    }
}

