import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import writeMail 1.0
import "mail.js" as Controller
//写邮件
Item {
    height: 800
    width: 500
    //Layout.alignment:Qt.AlignHCenter
    RowLayout{
        Rectangle{
            width: 40
            height: 300
            color: "transparent"
        }

        ColumnLayout{
            //工具栏
            spacing: 20
            width: 400
            height: 800
            //上边距
            Rectangle{
                color:"transparent"
                radius: 10
                width: 400
                height: 10
            }
            //发送，附件等功能行
            RowLayout{
                //左边距
                Rectangle{
                    width: 30
                    height: 40
                }
                width: 500
                height: 200
                //发送
                Rectangle{
                    width: 80
                    height: 40
                    radius: 20
                    border.color: "lightsteelblue"
                    border.width: 1
                    Text{
                        text:qsTr("发送")
                        anchors.centerIn: parent
                    }
                    TapHandler{
                        onTapped: {
                            write_mail.receiver=set_receiver.text
                            write_mail.subject=set_subject.text
                            write_mail.content=set_content.text
                            write_mail.send(write_mail.receiver,write_mail.subject,write_mail.content)

                        }
                    }
                }
                //附件
                Rectangle{
                    width: 80
                    height: 40
                    radius: 20
                    border.color: "lightsteelblue"
                    border.width: 1
                    Text{
                        text:qsTr("附件")
                        anchors.centerIn: parent
                    }

                }
                //图片
                Rectangle{
                    width: 80
                    height: 40
                    radius: 20
                    border.color: "lightsteelblue"
                    border.width: 1
                    Text{
                        text:qsTr("图片")
                        anchors.centerIn: parent
                    }

                }

            }
            //收件人和输入框
            RowLayout{
                Text {
                    font.pointSize: 24
                    text: qsTr("收件人")
                }
                TextEdit{
                    id:set_receiver
                    width: 500
                    height: 200

                }
            }
            //边缘线条
            Rectangle{
                height: 1
                width: 500
                color:"lightsteelblue"
            }
            RowLayout{
                Text {
                    font.pointSize: 24
                    text: qsTr("主题")
                }
                TextEdit{
                    id:set_subject
                    width: 500
                    height: 200

                }
            }
            //边缘线条
            Rectangle{
                height: 1
                width: 500
                color:"lightsteelblue"
            }
            //正文
            ColumnLayout{
                Text {
                    font.pointSize: 24
                    text: qsTr("正文")
                }
                //边缘线条
                Rectangle{
                    height: 1
                    width: 500
                    color:"lightsteelblue"
                }
                /*Flickable{

                }*/

                TextEdit{
                    id:set_content
                    width: 500
                    height: 400

                }
                //边缘线条
                Rectangle{
                    height: 1
                    width: 500
                    color:"lightsteelblue"
                }
            }
        }

    }
}
