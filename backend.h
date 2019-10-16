#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QTimer>
#include <QDateTime>

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString manualBake READ manualBake WRITE setManualBake NOTIFY manualBakeChanged)
    Q_PROPERTY(QString food READ food WRITE setFood NOTIFY foodChanged)
    Q_PROPERTY(QString time READ time WRITE setTime NOTIFY timeChanged)
    Q_PROPERTY(int temp READ temp WRITE setTemp NOTIFY tempChanged)
    Q_PROPERTY(int cooking READ cooking WRITE setCooking NOTIFY cookingChanged)
    Q_PROPERTY(QString status READ status WRITE setStatus NOTIFY statusChanged)
    Q_PROPERTY(int bluetooth READ bluetooth WRITE setBluetooth NOTIFY bluetoothChanged)
    Q_PROPERTY(int wifi READ wifi WRITE setWifi NOTIFY wifiChanged)

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
    QString manualBake();
    void setManualBake(const QString &manualBake);
    QString food();
    void setFood(const QString &food);
    int bluetooth();
    void setBluetooth(const int &bluetooth);
    int wifi();
    void setWifi(const int &wifi);

signals:
    void sendLocalTime(QString t);
    void sendLocalDate(QString d);
    void sendCookingTime(QString t, int constVal, int secs);
    void sendCookingStatus(QString s);

    void timeChanged();
    void tempChanged();
    void manualBakeChanged();
    void foodChanged();
    void cookingChanged();
    void statusChanged();
    void bluetoothChanged();
    void wifiChanged();

public slots:
    void localTimerTimeout();
    void cookingTimerTimeout();
    void fromCookingSlot();
    void foodChangedSlot();
    void bluetoothChangedSlot();
    void wifiChangedSlot();

private:
    QTimer localTimer, cookingTimer;
    QTime cookingTime;
    QString m_time, m_status, m_manualBake, m_food;
    int timerSymbol, timerSymbol2;
    int m_temp, m_cooking;
    int constValSecs, curSec;
    QString manualBakeDuck;
    QString manualBakeChicken;
    QString manualBakePartridge;
    int m_bluetooth, m_wifi;
};

#endif // BACKEND_H
