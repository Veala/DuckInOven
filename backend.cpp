#include "backend.h"
#include <QDebug>

BackEnd::BackEnd(QObject *parent) : QObject(parent)
{
    localTimer.setInterval(1000);
    cookingTimer.setInterval(1000);
    connect(&localTimer, SIGNAL(timeout()), this, SLOT(localTimerTimeout()));
    connect(&cookingTimer, SIGNAL(timeout()), this, SLOT(cookingTimerTimeout()));
    connect(this, SIGNAL(cookingChanged()), SLOT(fromCookingSlot()));
    connect(this, SIGNAL(foodChanged()), SLOT(foodChangedSlot()));
    connect(this, SIGNAL(bluetoothChanged()), SLOT(bluetoothChangedSlot()));
    connect(this, SIGNAL(wifiChanged()), SLOT(wifiChangedSlot()));
    localTimer.start();
    timerSymbol = 1;
    timerSymbol2 = 1;
    m_temp = 450;
    //m_time = "HH:MM";
    m_time = "02:00";
    m_cooking = 0;
    m_food = "Duck";
    manualBakeDuck = "Manual.\nBake the duck for 2 hours\nat 450 degrees.";
    manualBakeChicken = "Manual.\nBake the chicken for 1 hours\nat 400 degrees.";
    manualBakePartridge = "Manual.\nBake the partridge for 1.5 hours\nat 380 degrees.";
    m_manualBake = manualBakeDuck;
    m_bluetooth = 0;
    m_wifi = 0;
}

QString BackEnd::time()
{
    return m_time;
}

void BackEnd::setTime(const QString &time)
{
    if (time == m_time)
        return;

    m_time = time;
    emit timeChanged();
}

int BackEnd::temp()
{
    return m_temp;
}

void BackEnd::setTemp(const int &temp)
{
    if (temp == m_temp)
        return;

    m_temp = temp;
    emit tempChanged();
}

int BackEnd::cooking()
{
    return m_cooking;
}

void BackEnd::setCooking(const int &cooking)
{
    if (cooking == m_cooking)
        return;

    m_cooking = cooking;
    emit cookingChanged();
}

QString BackEnd::status()
{
    return m_status;
}

void BackEnd::setStatus(const QString &status)
{
    if (status == m_status)
        return;

    m_status = status;
    emit statusChanged();
}

QString BackEnd::manualBake()
{
    return m_manualBake;
}

void BackEnd::setManualBake(const QString &manualBake)
{
    if (manualBake == m_manualBake)
        return;

    m_manualBake = manualBake;
    emit manualBakeChanged();
}

QString BackEnd::food()
{
    return m_food;
}

void BackEnd::setFood(const QString &food)
{
    if (food == m_food)
        return;

    m_food = food;
    emit foodChanged();
}

int BackEnd::bluetooth()
{
    return m_bluetooth;
}

void BackEnd::setBluetooth(const int &bluetooth)
{
    if (bluetooth == m_bluetooth)
        return;

    m_bluetooth = bluetooth;
    emit bluetoothChanged();
}

int BackEnd::wifi()
{
    return m_wifi;
}

void BackEnd::setWifi(const int &wifi)
{
    if (wifi == m_wifi)
        return;

    m_wifi = wifi;
    emit wifiChanged();
}

void BackEnd::localTimerTimeout()
{
    QDateTime local(QDateTime::currentDateTime());
    emit sendLocalDate(local.toString(tr("dddd, MMMM yy")));
    if (timerSymbol == 1) {
        emit sendLocalTime(local.toString(tr("hh:mm AP")));
        timerSymbol=0;
    } else {
        emit sendLocalTime(local.toString(tr("hh mm AP")));
        timerSymbol=1;
    }
}

void BackEnd::cookingTimerTimeout()
{
    cookingTime = cookingTime.addSecs(1);
    curSec+=1;

    if (cookingTime.toString(tr("hh:mm")) == m_time) {
        cookingTimer.stop();
        emit sendCookingTime(cookingTime.toString(tr("hh:mm")), constValSecs, curSec);
        emit sendCookingStatus(QString("Status: %1 is cooked!").arg(m_food));
        m_cooking=0;
        return;
    }

    if (timerSymbol2 == 1) {
        emit sendCookingTime(cookingTime.toString(tr("hh:mm")), constValSecs, curSec);
        timerSymbol2=0;
    } else {
        emit sendCookingTime(cookingTime.toString(tr("hh mm")), constValSecs, curSec);
        timerSymbol2=1;
    }
}

void BackEnd::fromCookingSlot()
{
    if (m_cooking == 1) {
        if(!cookingTimer.isActive()) {
            timerSymbol2=0;
            cookingTime.setHMS(0,0,0);
            QTime time = QTime::fromString(m_time,"hh:mm");
            constValSecs = time.hour()*3600 + time.minute()*60;
            curSec = 0;
            cookingTimer.start();
            emit sendCookingStatus("Status: cooking...");
        }
    } else if (m_cooking == 0) {
        if(cookingTimer.isActive()) {
            cookingTimer.stop();
            sendCookingStatus("Status: stopped");
        }
    }

}

void BackEnd::foodChangedSlot()
{
    if (m_food == "Duck") {
        m_manualBake = manualBakeDuck;
        m_time = "02:00";
        m_temp = 450;
    } else if (m_food == "Chicken") {
        m_manualBake = manualBakeChicken;
        m_time = "01:00";
        m_temp = 400;
    } else if (m_food == "Partridge") {
        m_manualBake = manualBakePartridge;
        m_time = "01:30";
        m_temp = 380;
    }
}

void BackEnd::bluetoothChangedSlot()
{
    //bluetooth working
    if (m_bluetooth == 1) {
        qDebug() << "Bluetooth On";

//        for example stop cooking from bluetooth, set time to 00:01, temp to 410 and start cooking
//        m_cooking = 0;
//        fromCookingSlot();
//        sendCookingStatus("Status: stopped");
//        m_time = "00:01";
//        m_temp = 410;
//        sendCookingStatus("Status: cooking...");
    } else {
        qDebug() << "Bluetooth Off";
    }
}

void BackEnd::wifiChangedSlot()
{
    //wifi working
    if (m_wifi == 1) {
        qDebug() << "wifi On";
    } else {
        qDebug() << "wifi Off";
    }
}
