#include "readrobot.h"
#include <QDir>
#include <QJsonObject>
#include <QJsonDocument>
#include <QByteArray>
#include <QFile>
#include <QJsonArray>
#include <QDebug>
#include <QCoreApplication>


ReadRobot::ReadRobot(QObject *parent) {

}

ReadRobot::~ReadRobot() {
    delete file;
}

QString ReadRobot::getJson() {
    return this->json;
}

int ReadRobot::getRobotLength()
{
    return this->robotLength;
}

void ReadRobot::setFileName(const QString &filename) {
    this->json = filename;
    file = new QFile(filename);
}

std::vector<std::vector<QString>> ReadRobot::getRobots() {
    std::vector<std::vector<QString>> RobotList;
    file->open(QIODevice::ReadOnly);
    QByteArray data=file->readAll();
    file->close();
    QJsonParseError parseError;
    QJsonDocument doc=QJsonDocument::fromJson(data,&parseError);
    QJsonObject obj=doc.object();
    if(parseError.error!=QJsonParseError::NoError){
        qDebug()<<parseError.error;
        return RobotList;
    }
    if(obj.contains("Robot"))
    {
        QJsonValue arrayTemp=obj.value("Robot");
        QJsonArray array=arrayTemp.toArray();
        for(int i=0;i<array.size();i++){
            QJsonValue sub=array.at(i);
            QJsonObject subObj=sub.toObject();
            QJsonValue nameTemp=subObj.value("name");
            QString name=nameTemp.toString();
            QJsonValue tokenTemp=subObj.value("token");
            QString token=tokenTemp.toString();
            std::vector<QString> temp={};
            temp.push_back(name);
            temp.push_back(token);
            RobotList.push_back(temp);
        }
    }
    robots=RobotList;
    robotLength=RobotList.size();
    return RobotList;
}

QString ReadRobot::getRobotName(int x)
{
    return this->robots[x][0];
}

QString ReadRobot::getRobotToken(int x)
{
    return this->robots[x][1];
}

