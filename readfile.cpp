#include "readfile.h"
#include <QDebug>
#include <QCoreApplication>

ReadFile::ReadFile(QObject *parent) {

}

ReadFile::~ReadFile() {
    delete file;
}

QString ReadFile::getFileName() {
    return this->filename;
}

void ReadFile::setFileName(const QString &filename) {
    this->filename = filename;
    file = new QFile(filename);
}

QString ReadFile::getFileContent() {
    if( content.length() == 0 ) {
        file->open(QIODevice::ReadOnly | QIODevice::Text);
        QTextStream in(file);
        content = in.readAll();
        if( content.length() == 0) {
            qDebug() << "[Warning] FileContent: file " << this->filename << "is empty";
        }
    }
    qDebug() << content;
    return content;
}

void ReadFile::clearContent() {
    content.clear();
}
