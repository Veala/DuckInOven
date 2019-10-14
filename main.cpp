#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<BackEnd>("duckinoven.backend", 1, 0, "BackEnd");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
