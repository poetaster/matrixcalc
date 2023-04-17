import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    Column {
        id: column

        width: page.width
        spacing: Theme.paddingLarge
        PageHeader {
            title: qsTr("Choice of the equation")
        }
        Button {
            id: powerEquation
            width: page.width - 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Power equation"
            onClicked: pageStack.push(Qt.resolvedUrl("PowerEquation.qml"))
        }
        Button {
            id: expEquation
            width: page.width - 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Exponential equation"
            onClicked: pageStack.push(Qt.resolvedUrl("ExpEquation.qml"))
        }
        Button {
            id: trigEquation
            width: page.width - 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Trigonometric equation"
            onClicked: pageStack.push(Qt.resolvedUrl("TrigEquation.qml"))
        }
    }
}
