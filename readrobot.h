#ifndef READROBOT_H
#define READROBOT_H

#include <QObject>

#include <QFile>
#include <QTextStream>

class ReadRobot : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString json READ getJson WRITE setFileName)
    Q_PROPERTY(int robotLength READ getRobotLength)
    Q_PROPERTY(std::vector<std::vector<QString>> robots READ getRobots)
    Q_INVOKABLE std::vector<std::vector<QString>> getRobots();
    Q_INVOKABLE QString getRobotName(int x);
    Q_INVOKABLE QString getRobotToken(int x);
    Q_INVOKABLE QString getJson();
    Q_INVOKABLE int getRobotLength();

    ReadRobot(QObject *parent = 0);
    ~ReadRobot();

private:
    QFile                              *file;
    std::vector<std::vector<QString>>  robots;
    int                                robotLength;

    QString json;

public slots:
    void setFileName(const QString& filename);
};

#endif // READROBOT_H
