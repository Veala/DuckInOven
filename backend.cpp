#include "backend.h"
#include <QDebug>

BackEnd::BackEnd(QObject *parent) : QObject(parent)
{
    timer.setInterval(1000);
    connect(&timer, SIGNAL(timeout()), this, SLOT(timerTimeout()));
    timer.start();
    timerSymbol = 1;
    m_temp = 425;
    m_time = "HH:MM";
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

void BackEnd::timerTimeout()
{
    QDateTime local(QDateTime::currentDateTime());
    emit sendDate(local.toString(tr("dddd, MMMM yy")));
    if (timerSymbol == 1) {
        emit sendTime(local.toString(tr("hh:mm AP")));
        timerSymbol=0;
    } else {
        emit sendTime(local.toString(tr("hh mm AP")));
        timerSymbol=1;
    }
}
