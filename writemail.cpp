#include "writemail.h"
#include <QDebug>

writeMail::writeMail(QObject *parent, QByteArray username, QByteArray password)
{
    this->username = username;
    this->password = password;
}
void writeMail::send(QByteArray receiver, QString subject, QString content)
{
    this->receiver = receiver;
    this->subject = subject;
    this->content = content;
    QByteArray usernametmp = this->username;
    QByteArray recvaddrtmp = this->receiver;
    socket = new QTcpSocket();
    //socket = new QSslSocket();
    this->socket->connectToHost("smtp.163.com", 25, QTcpSocket::ReadWrite);
    //this->socket->connectToHostEncrypted("smtp.163.com", 456);
    this->socket->waitForConnected(1000);
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    this->socket->write("EHLO MSG\r\n");
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    this->socket->write("AUTH LOGIN\r\n");
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    qDebug() << "username" << username;
    this->socket->write(username.toBase64().append("\r\n"));
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    qDebug() << "password:" << password;
    this->socket->write(password.toBase64().append("\r\n"));
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    this->socket->write(mailfrom.append(usernametmp.append(">\r\n")));
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    //发送邮箱
    //qDebug()<<"MAIL FROM:"<<mailfrom.append(usernametmp.append(">\r\n"));
    this->socket->write(rcptto.append(recvaddrtmp.append(">\r\n")));
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    //接收邮箱
    //qDebug()<<"RCPT TO:"<<rcptto.append(recvaddrtmp.append(">\r\n"));
    //data表示开始传输数据
    this->socket->write("DATA\r\n");
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    usernametmp = this->username;
    recvaddrtmp = this->receiver;
    this->socket->write(prefrom.append(usernametmp.append("\r\n")));
    this->socket->write(preto.append(recvaddrtmp.append("\r\n")));
    this->socket->write(presubject.append(subject.toUtf8().append("\r\n"))); //toLocal8Bit()
    this->socket->write("MIME-Version: 1.0\r\n");
    this->socket->write("\r\n");
    this->socket->write(content.toUtf8().append("\r\n"));
    this->socket->write(".\r\n");
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
    this->socket->write("QUIT\r\n");
    this->socket->waitForReadyRead(1000);
    data = socket->readAll();
    qDebug() << data;
}

void writeMail::setusername(QByteArray username)
{
    this->username = username;
}
QByteArray writeMail::getusername()
{
    return this->username;
}
void writeMail::setpassword(QByteArray password)
{
    this->password = password;
}
QByteArray writeMail::getpassword()
{
    return this->password;
}
void writeMail::setreceiver(QByteArray receiver)
{
    this->receiver = receiver;
}
QByteArray writeMail::getreceiver()
{
    return this->receiver;
}
void writeMail::setsubject(QString subject)
{
    this->subject = subject;
}
QString writeMail::getsubject()
{
    return this->subject;
}
void writeMail::setcontent(QString content)
{
    this->content = content;
}
QString writeMail::getcontent()
{
    return this->content;
}
void onDataReceived(QByteArray data)
{
    qDebug() << data;
}
void onUsernameChange() {}
void onPasswordChange() {}
void onReceiverChange() {}
void onSubjectChange() {}
void onContentChange() {}
writeMail::~writeMail()
{
    delete this->socket;
}
