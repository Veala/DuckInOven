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
    Q_PROPERTY(int cooking READ cooking WRITE setCooking NOTIFY cookingChanged)
    Q_PROPERTY(QString status READ status WRITE setStatus NOTIFY statusChanged)
public:
    explicit BackEnd(QObject *parent = nullptr);
    QString time();
    void setTime(const QString &time);
    int temp();
    void setTemp(const int &temp);
    int cooking();
    void setCooking(const int &cooking);
    QString status();
    void setStatus(const QString &status);


signals:
    void sendLocalTime(QString t);
    void sendLocalDate(QString d);
    void sendCookingTime(QString t);

    void timeChanged();
    void tempChanged();
    void cookingChanged();
    void statusChanged();

public slots:
    void localTimerTimeout();
    void cookingTimerTimeout();
    void fromCookingSlot();
private:
    int timerSymbol;
    QTimer localTimer, cookingTimer;
    int m_temp;
    QString m_time, m_status, cookingTime;
    int m_cooking;
};

#endif // BACKEND_H
