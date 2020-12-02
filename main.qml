import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

// C++で公開登録したクラスをインポート
import tech.relog.plugin.kitchentimer 1.0

ApplicationWindow {
    width: 400
    height: 200
    visible: true
    title: qsTr("Kitchen Timer")
    color: timer.fired ? "#ee9999" : "white"

    GridLayout {
        anchors.fill: parent
        anchors.margins: 10
        columns: 2
        Label {
            id: remainLabel
            Layout.fillWidth: true
            Layout.columnSpan: 2
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 64
            text: timer.remainTimeString
        }
        Button {
            id: startButton
            Layout.fillWidth: true
            text: "Start"
            enabled: !timer.running
            onClicked: timer.start()
        }
        Button {
            id: clearButton
            Layout.fillWidth: true
            text: "Clear"
            enabled: timer.running
            onClicked: timer.clear()
        }
    }

    KitchenTimer {
        id: timer
    }
}
