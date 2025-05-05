import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id:main_window
    width: 1040
    height: 980
    color: "grey"
    visible: true
    title: qsTr("text_Mail")
    //背景颜色
    Rectangle{
        id:window_bg
        width: main_window.width
        height: main_window.height
        //anchors.fill:parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "steelblue" }
        }
    }
    //整个窗口布局
    RowLayout{
        anchors.fill: parent
        width: 1040
        height:980
        spacing: 0
        //侧边栏
        ColumnLayout{
            Layout.margins: 10
            width: 180
            height: 980
            //图标和写信功能
            Rectangle{
                id:mail_message
                width: 180
                height: 150
                color: "red"
                //写信功能
                Rectangle{
                   id:msg_tx_bg
                   width: 180
                   height: 60
                   radius: 20
                   Text {
                       id:msg_text
                       anchors.centerIn: parent
                       text: qsTr("Compose")
                   }
                }

            }
            //工具栏模型
            ListModel{
                id:tool_lm
                ListElement{ name: qsTr("Inbox")}
                ListElement{ name: qsTr("Starred") }
                ListElement{ name: qsTr("Sent") }
                ListElement{ name: qsTr("Drafts") }
            }
            //工具栏视图
            Rectangle{
                color:"transparent"
                id:tool_lv
                width: 180
                height: 980-mail_message.height
                ListView{
                    anchors.fill: parent
                    opacity: 1
                    visible: true
                    spacing: 10
                    model: tool_lm
                    delegate:ColumnLayout{
                        Rectangle{
                            id:tool
                            width: 180
                            height: 50
                            radius: 20
                            color:tool_ma.containsMouse?"lightslategrey":"transparent"
                            Behavior on color{
                                ColorAnimation {
                                    duration: 200
                                }
                            }
                            Text{
                                anchors.centerIn: parent
                                text: name
                            }
                            MouseArea{
                                id:tool_ma
                                anchors.fill: parent
                                hoverEnabled: true
                            }
                        }
                    }
                }
            }
        }
        //邮件内容
        ColumnLayout{
            id:content_bg
            Layout.fillWidth:true
            height: main_window.height
            Rectangle{
                id:content
                Layout.fillWidth:true
                Layout.preferredWidth: main_window.width-tool_lv.width
                height: main_window.height
                color: "white"
            }
        }
    }
}
