import QtQuick 2.0
import Sailfish.Silica 1.0
import "Calculator.js" as Calculator

Page {
    id: page
    allowedOrientations: Orientation.All
    PageHeader{
        title: qsTr("History")
        visible: countOfOperations===0
    }
    Label{
        id: emptyLabel
        visible: countOfOperations===0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: Theme.secondaryHighlightColor
        font.pixelSize: Theme.fontSizeLarge
        text: qsTr("Empty")
    }
    SilicaListView {
        id:list
        PullDownMenu {
            MenuItem {
                text: qsTr("Clear history")
                onClicked: clearHistory()
            }
        }
        visible: countOfOperations!==0
        width: parent.width;
        height: parent.height
        model: ListModel {
           id: historyModel
        }
        header: PageHeader{ title: qsTr("History") }
        delegate: Item {
            width: parent.width
            height: Theme.itemSizeMedium
            Label {
                text: value
                font.pixelSize: Theme.fontSizeMedium
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    pageStack.navigateBack({value: Calculator.parseValue(list.model.get(index).value)});
                }
            }
        }
        Component.onCompleted: {
            for(var i=0;i<=countOfOperations;i++) {
                var element = { "value" : qsTr("%1").arg(history[i]) }
                historyModel.append(element)
            }
        }
    }
    function clearHistory(){
        countOfOperations = 0;
        history = [];
        Calculator.clearHistory();
    }
}
