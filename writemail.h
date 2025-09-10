#pragma once

#include <QByteArray>
#include <QDebug>
#include <QObject>
#include <QQmlEngine>
#include <QtNetwork/QHostInfo>
#include <QtNetwork/QSslSocket>
#include <QtNetwork/QTcpSocket>
class writeMail : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QByteArray username READ getusername WRITE setusername NOTIFY UsernameChange)
    Q_PROPERTY(QByteArray password READ getpassword WRITE setpassword NOTIFY PasswordChange)
public:
    writeMail(QObject *parent = nullptr,
              QByteArray username = nullptr,
              QByteArray password = nullptr);
    ~writeMail();
public slots:
    Q_INVOKABLE void send(QByteArray receiver, QString subject, QString content);
    Q_INVOKABLE void setusername(QByteArray username);
    Q_INVOKABLE QByteArray getusername();
    Q_INVOKABLE void setpassword(QByteArray password);
    Q_INVOKABLE QByteArray getpassword();
signals:
    void DataReceived(QByteArray data);
    void UsernameChange(QByteArray username);
    void PasswordChange(QByteArray password);

private:
    QTcpSocket *socket;
    QByteArray username;
    QByteArray password;
    QByteArray receiver;
    QString subject;
    QString content;
    QByteArray data;
    QByteArray presubject = "subject:";
    QByteArray mailfrom = "mail from:<";
    QByteArray rcptto = "rcpt to:<";
    QByteArray prefrom = "from:";
    QByteArray preto = "to:";
};
