import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Mail 1.0

Item {
    id: mail_msg
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    property int userId: 1
    property string box: "Inbox"
    property int selectedMailId: -1
    property var mainBoxes: ["Inbox", "Starred", "Sent", "Drafts"]

    MailModel {
        id: mailModel
        userId: mail_msg.userId
        box: mail_msg.box
    }

    // 顶部操作按钮栏
    Rectangle {
        id: topBar
        width: parent.width
        height: 56
        color: "#f5f5f5"
        border.color: "#cccccc"
        border.width: 1
        visible: mainBoxes.indexOf(box) !== -1

        RowLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 18

            Button { text: "删除";    onClicked: {/* TODO: 删除选中邮件 */} }
            Button { text: "移动到";  onClicked: {/* TODO: 移动到其他文件夹 */} }
            Button { text: "彻底删除"; onClicked: {/* TODO: 彻底删除选中邮件 */} }
            Button { text: "转发";    onClicked: {/* TODO: 转发选中邮件 */} }
            Button { text: "举报";    onClicked: {/* TODO: 举报选中邮件 */} }
            Button { text: "全部标记为已读"; onClicked: {/* TODO: 标记全部为已读 */} }
        }
    }

    // 邮件列表表头
    Rectangle {
        id: headerBar
        width: parent.width
        height: 40
        y: topBar.visible ? topBar.height : 0
        color: "#fafbfc"
        border.color: "#e0e0e0"
        border.width: 1

        RowLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 0

            CheckBox { id: selectAllBox; width: 32; onClicked: {/* TODO: 全选/取消全选 */} }
            Text { text: "发件人"; font.bold: true; width: 140; horizontalAlignment: Text.AlignLeft }
            Text { text: "主题"; font.bold: true; Layout.fillWidth: true; horizontalAlignment: Text.AlignLeft }
            Text { text: "时间"; font.bold: true; width: 120; horizontalAlignment: Text.AlignRight }
        }
    }

    // 邮件列表
    ListView {
        id: mailListView
        anchors.top: headerBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        model: mailModel
        clip: true

        delegate: Rectangle {
            width: mailListView.width
            height: 48
            color: ListView.isCurrentItem ? "#e6f7ff" : "transparent"
            border.color: "#eeeeee"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 0

                CheckBox { checked: false; width: 32; onClicked: {/* TODO: 单选邮件 */} }
                Text { text: sender; width: 140; elide: Text.ElideRight; verticalAlignment: Text.AlignVCenter }
                Text { text: subject; Layout.fillWidth: true; elide: Text.ElideRight; verticalAlignment: Text.AlignVCenter }
                Text { text: time; width: 120; horizontalAlignment: Text.AlignRight; verticalAlignment: Text.AlignVCenter }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mail_msg.selectedMailId = id
                    // TODO: 加载详情页
                }
            }
        }
    }
}
