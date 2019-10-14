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
    if (cookingTime == m_time)
        cookingTimer.stop();
    QDateTime local(QDateTime::currentDateTime());
    if (timerSymbol == 1) {
        emit sendCookingTime(local.toString(tr("hh:mm AP")));
        timerSymbol=0;
    } else {
        emit sendCookingTime(local.toString(tr("hh mm AP")));
        timerSymbol=1;
    }
}

void BackEnd::fromCookingSlot()
{
    if (m_cooking == 1) {
        if(!cookingTimer.isActive()) {
            cookingTimer.start();
            cookingTime="00:00";
        }
    } else if (m_cooking == 0) {
        if(cookingTimer.isActive()) {
            cookingTimer.stop();
        }
    }

}
