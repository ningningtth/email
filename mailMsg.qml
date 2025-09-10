import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
// 邮件详细内容
Item {
    id: mailMsgRoot
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    // 这些属性由 Loader 传递(Main.qml loader)
    property string subject: ""
    property string sender: ""
    property string receiver: ""
    property string time: ""
    property string content: ""
    property bool starred: false

    // 返回回调，由父组件传递
    property var onBack

    ColumnLayout {
        anchors.fill: parent
        spacing: 20
        padding: 30

        // 标题和星标
        RowLayout {
            spacing: 10
            Text {
                text: starred ? "★" : "☆"
                color: starred ? "gold" : "#cccccc"
                font.pixelSize: 28
            }
            Text {
                text: subject
                font.bold: true
                font.pixelSize: 24
            }
        }

        // 发件人、收件人和时间
        RowLayout {
            spacing: 20
            Text { text: "发件人: " + sender; font.pixelSize: 16 }
            Text { text: "收件人: " + receiver; font.pixelSize: 16 }
            Text { text: "时间: " + time; font.pixelSize: 16 }
        }

        // 分割线
        Rectangle {
            width: parent.width
            height: 2
            color: "#cccccc"
        }

        // 邮件正文
        Text {
            text: content
            font.pixelSize: 18
            wrapMode: Text.Wrap
        }

        // 返回按钮
        Button {
            text: "返回"
            onClicked: {
                if (onBack) onBack()
            }
        }
    }
}
