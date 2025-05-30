#pragma once

#include <QByteArray>
#include <QString>
#include <QDebug>
#include <QObject>
#include <QQmlEngine>
#include <QtNetwork/QHostInfo>
#include <QtNetwork/QSslSocket>
#include <QtNetwork/QTcpSocket>
#include <QtQml/qqmlregistration.h>
#include <QFile>
#include <QFileInfo>
class writeMail : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QByteArray username READ getusername WRITE setusername NOTIFY UsernameChange)
    Q_PROPERTY(QByteArray password READ getpassword WRITE setpassword NOTIFY PasswordChange)
    Q_PROPERTY(QByteArray receiver READ getreceiver WRITE setreceiver NOTIFY ReceiverChange)
    Q_PROPERTY(QString subject READ getsubject WRITE setsubject NOTIFY SubjectChange)
    Q_PROPERTY(QString content READ getcontent WRITE setcontent NOTIFY ContentChange)
public:
    writeMail(QObject *parent = nullptr,
              QByteArray username = QByteArray(),
              QByteArray password = QByteArray());
    ~writeMail();
public slots:
    Q_INVOKABLE void send(QByteArray receiver, QString subject, QString content);
    Q_INVOKABLE void setusername(QByteArray username);
    Q_INVOKABLE QByteArray getusername();
    Q_INVOKABLE void setpassword(QByteArray password);
    Q_INVOKABLE QByteArray getpassword();
    Q_INVOKABLE void setreceiver(QByteArray receiver);
    Q_INVOKABLE QByteArray getreceiver();
    Q_INVOKABLE void setsubject(QString subject);
    Q_INVOKABLE QString getsubject();
    Q_INVOKABLE void setcontent(QString content);
    Q_INVOKABLE QString getcontent();
signals:
    void DataReceived(QByteArray data);
    void UsernameChange(QByteArray username);
    void PasswordChange(QByteArray password);
    void ReceiverChange(QByteArray receiver);
    void SubjectChange(QString subject);
    void ContentChange(QString content);

private:
    QTcpSocket *socket;
    QByteArray username;
    QByteArray password;
    QByteArray receiver;
    QString subject;
    QString content;
    QByteArray data;
    QByteArray presubject = "Subject:";
    QByteArray mailfrom = "MAIL FROM:<";
    QByteArray rcptto = "RCPT TO:<";
    QByteArray prefrom = "From:";
    QByteArray preto = "To:";
};
