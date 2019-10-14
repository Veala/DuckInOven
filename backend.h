#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QTimer>
#include <QDateTime>

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString time READ time WRITE setTime NOTIFY timeChanged)
    Q_PROPERTY(int temp READ temp WRITE setTemp NOTIFY tempChanged)
public:
    explicit BackEnd(QObject *parent = nullptr);
    QString time();
    void setTime(const QString &time);
    int temp();
    void setTemp(const int &temp);

signals:
    void sendTime(QString t);
    void sendDate(QString d);

    void timeChanged();
    void tempChanged();

public slots:
    void timerTimeout();
private:
    int timerSymbol;
    QTimer timer;
    int m_temp;
    QString m_time;
};

#endif // BACKEND_H
