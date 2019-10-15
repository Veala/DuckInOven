#include "backend.h"
#include <QDebug>

BackEnd::BackEnd(QObject *parent) : QObject(parent)
{
    localTimer.setInterval(1000);
    cookingTimer.setInterval(1000);
    connect(&localTimer, SIGNAL(timeout()), this, SLOT(localTimerTimeout()));
    connect(&cookingTimer, SIGNAL(timeout()), this, SLOT(cookingTimerTimeout()));
    connect(this, SIGNAL(cookingChanged()), SLOT(fromCookingSlot()));
    localTimer.start();
    timerSymbol = 1;
    timerSymbol2 = 1;
    m_temp = 425;
    m_time = "HH:MM";
    m_cooking = 0;
}

QString BackEnd::time()
{
    qDebug() << "int BackEnd::time()";
    return m_time;
}

void BackEnd::setTime(const QString &time)
{
    qDebug() << "void BackEnd::setTime(const int &time)";
    if (time == m_time)
        return;

    m_time = time;
    emit timeChanged();
}

int BackEnd::temp()
{
    qDebug() << "int BackEnd::temp()";
    return m_temp;
}

void BackEnd::setTemp(const int &temp)
{
    qDebug() << "void BackEnd::setTemp(const int &temp)";
    if (temp == m_temp)
        return;

    m_temp = temp;
    emit tempChanged();
}

int BackEnd::cooking()
{
    qDebug() << "int BackEnd::cooking()";
    return m_cooking;
}

void BackEnd::setCooking(const int &cooking)
{
    qDebug() << "void BackEnd::setCooking(const int &cooking)";
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
        emit sendCookingStatus("Status: Duck is cooked!");
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
        }
    }

}
