#include "mainwindow.h"

#include "readfile.h"

#include <QApplication>
#include <QLocale>
#include <QTranslator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
int main(int argc, char *argv[])
{
    QGuiApplication DingRobot(argc, argv);
    qmlRegisterType<ReadFile>("File", 1, 0, "ReadFile");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/DingRobot.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return DingRobot.exec();
}
