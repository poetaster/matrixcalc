import QtQuick 2.6
import QtQml 2.2
import Sailfish.Silica 1.0
import "GlobalVariables.js" as GlobalVariables


Page {
    id: page
    height: column.height
    allowedOrientations: Orientation.All

    onStatusChanged: {
        if (status == PageStatus.Active)
            pageStack.pushAttached(Qt.resolvedUrl("ChoiceOfEquation.qml"))
    }
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
            Button {
                id: buttonTrans
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Transposition")
                onClicked:{
                        GlobalVariables.funct = "Transposition";
                        pageStack.push(Qt.resolvedUrl("MatrixSizes.qml"), {globalVariables: GlobalVariables})
                }
            }
            Button {
                id: buttonRang
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Grade")
                onClicked:{
                        GlobalVariables.funct = "Grade";
                        pageStack.push(Qt.resolvedUrl("MatrixSizes.qml"), {globalVariables: GlobalVariables})
                }
            }
            Button {
                id: buttonDet
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Determinant")
                onClicked:{
                        GlobalVariables.funct = "Determinant";
                        pageStack.push(Qt.resolvedUrl("MatrixSizes.qml"), {globalVariables: GlobalVariables})
                }
            }
            Button {
                id: buttonSumm
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Add")
                onClicked:{
                        GlobalVariables.funct = "Add";
                        pageStack.push(Qt.resolvedUrl("MatrixSizes.qml"), {globalVariables: GlobalVariables})
                }
            }
            Button {
                id: buttonMult
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Multiply")
                onClicked:{
                        GlobalVariables.funct = "Multiply";
                        pageStack.push(Qt.resolvedUrl("MatrixSizes.qml"), {globalVariables: GlobalVariables})
                }
            }
        }
    }
}

