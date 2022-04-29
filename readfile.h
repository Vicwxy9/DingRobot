#ifndef READFILE_H
#define READFILE_H

#include <QObject>

#include <QFile>
#include <QTextStream>

class ReadFile : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString content READ getFileContent)
    Q_PROPERTY(QString filename READ getFileName WRITE setFileName)
    Q_INVOKABLE QString getFileContent();
    Q_INVOKABLE QString getFileName();

    ReadFile(QObject *parent = 0);
    ~ReadFile();

private:
    QFile   *file;
    QString content;
    QString filename;

public slots:
    void setFileName(const QString& filename);
    void clearContent();
};

#endif // READFILE_H
