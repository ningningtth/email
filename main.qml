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
    RowLayout{
        anchors.fill: parent
        width: 1040
        height:980
        spacing: 0
        ColumnLayout{
            width: 200
            height: 980
            Rectangle{
                id:mail_message
                width: 200
                height: 150
                color: "red"
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
            ListModel{
                id:tool_lm
                ListElement{ name: qsTr("Inbox")}
                ListElement{ name: qsTr("Starred") }
                ListElement{ name: qsTr("Sent") }
                ListElement{ name: qsTr("Drafts") }
            }
            Rectangle{
                color:"transparent"
                id:tool_lv
                width: 200
                height: 980-mail_message.height
                ListView{
                    anchors.fill: parent
                    opacity: 1
                    visible: true
                    model: tool_lm
                    delegate:ColumnLayout{
                        Rectangle{
                            id:tool
                            width: 200
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
        ColumnLayout{
            id:content_bg
            Layout.fillWidth:true
            //width: main_window.width-tool_lv.width
            height: main_window.height
            Rectangle{
                id:content
                Layout.fillWidth:true
                Layout.preferredWidth: main_window.width-tool_lv.width
                //width: main_window.width-tool_lv.width
                height: main_window.height
                color: "white"
            }
        }
    }
}
