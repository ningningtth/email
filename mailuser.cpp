#include "mailuser.h"

mailUser::mailUser(QObject *parent) {}
mailUser::~mailUser() {}

void mailUser::setusername(QByteArray username)
{
    this->username = username;
}
QByteArray mailUser::getusername()
{
    return this->username;
}
void mailUser::setpassword(QByteArray username)
{
    this->password = password;
}
QByteArray mailUser::getpassword()
{
    return this->password;
}
