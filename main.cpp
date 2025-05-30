#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "writemail.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<writeMail>("writeMail", 1, 0, "WriteMail");

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
