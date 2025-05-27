import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//主界面
ApplicationWindow {
    id:main_window
    width: 1040
    height: 980
    color: "grey"
    visible: true
    title: qsTr("Mail")
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
            //图标
            Image {
                width: 180
                source: "logo.png"
                fillMode: Image.PreserveAspectFit
                Component.onCompleted: console.log("Actual size:", width, height)
            }
            //写信功能
            Rectangle{
                id:mail_message
                width: 180
                height: 200
                color:"transparent"
                //color: "red"
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
                                onClicked: {
                                    if(index==0)
                                        content_loader.source="mailMsg.qml"

                                }
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
            RowLayout{
                width: 200
                height: 48
                Text {
                    text: qsTr("请登录")
                }
                Rectangle{
                    width: 45
                    height: 45
                    radius: 50
                    color: "grey"
                }
                MouseArea{
                    width: 200
                    height: 48
                    anchors.fill:parent
                    onClicked: {
                        sign_in.open()
                    }
                }
                Popup{
                    width: 400
                    height: 200
                    id:sign_in
                    contentItem:ColumnLayout{
                        RowLayout{
                            Text {
                                text: qsTr("账号")
                            }
                            TextInput{
                                width: 400
                                height: 200
                                //placeholderText: "请输入邮箱"
                                inputMask:  qsTr("qqnumber+@qq.com")
                                validator:  RegularExpressionValidator {
                                        regularExpression: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
                                    }
                            }
                        }
                        Label {
                            id: errorLabel1
                            color: "red"
                        }
                        RowLayout{
                            Text {
                                text: qsTr("密码")
                            }
                            TextInput{
                                width: 400
                                height: 200
                                text: qsTr("   ")
                            }
                        }
                        Label {
                            id: errorLabel2
                            color: "red"
                            //text: qsTr("密码")
                        }
                        Button { text: qsTr("登陆") }
                    }
                }
            }

            Rectangle{
                id:content
                Layout.fillWidth:true
                radius: 20
                Layout.preferredWidth: main_window.width-tool_lv.width-20
                height: main_window.height
                color: "white"
                Loader {
                    id:content_loader
                    source: "writeMail.qml"
                }
        }
    }
        Rectangle{
            height: main_window.height
            width: 10
            color:"transparent"
        }
  }
}
