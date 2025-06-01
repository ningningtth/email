#pragma once

#include <QObject>
#include <QQmlEngine>
#include <QByteArray>
#include <QString>
#include "writemail.h"
class mailUser : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QByteArray username READ getusername WRITE setusername)
    Q_PROPERTY(QByteArray password READ getpassword WRITE setpassword)
public:
    mailUser(QObject *parent = nullptr);
    ~mailUser();
public slots:
    //Q_INVOKABLE void setusername(QByteArray username);
    Q_INVOKABLE void setusername(QByteArray username);
    Q_INVOKABLE QByteArray getusername();
    Q_INVOKABLE void setpassword(QByteArray username);
    Q_INVOKABLE QByteArray getpassword();
signals:
    void UsernameChange(QByteArray username);
    void PasswordChange(QByteArray password);

private:
    QByteArray username;
    QByteArray password;
};
