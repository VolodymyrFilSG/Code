#include <QCoreApplication>
#include <map>
#include <fstream>
#include <QDebug>
#include <iostream>
#include <string>
#include <QFile>
#include <QTime>
#include <QTextStream>

typedef std::map<std::string, int> StrIntMap;

StrIntMap reader(const char* inFile);
void printer(StrIntMap words, const char* outFile);
quint32 countWords(std::istream& in, StrIntMap& words);

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    qDebug() << QTime::currentTime();
    if(argc < 4){
        qDebug() << "Usage: text file, base file, new base file";
        return 0;
    }

    std::ifstream in(argv[1]);
    qDebug() << argv[1];
    if (!in)
        return(0);

    StrIntMap words = reader(argv[2]);

    quint32 i = countWords(in, words);
    if (i != 0){
        qDebug() << "processed" << i << "words";
        qDebug() << "beginning insertion into output file";
        printer(words, argv[3]);
    } else {
        qDebug() << "file's empty";
    }
    qDebug() << QTime::currentTime();
    return 0;
}

StrIntMap reader(const char* inFile){
    StrIntMap x;
    std::ifstream f(inFile);
    std::string buff;
    std::string out;
    bool word = true;
    while(f >> buff){
        if(word){
            out = buff;
            word = !word;
        } else {
            word = !word;
            x.insert(std::pair<std::string, int>(out, std::stoi(buff)));
        }
    }
    f.close();
    return x;
}
/*///////////////////////////////////////////////////////////////////////////////*/
void printer(StrIntMap words, const char* outFile){
    std::ofstream file;
    file.open(outFile, std::ios_base::app);
    for (StrIntMap::iterator p = words.begin();
         p != words.end(); ++p) {
        file << p->first << "\t\t" << p->second << std::endl;
    }
    file.flush();
    file.close();
}
/*///////////////////////////////////////////////////////////////////////////////*/
quint32 countWords(std::istream& in, StrIntMap& words) {
    QRegExp removeRegExp1(QString::fromUtf8(R"regexp([A-Za-z`•~°№¹²³⁴ ⁵⁶‘⁷⁸⁹\!©“”@…#´←→\$%\^&\*\(\)_\—\+=\|:;<>«»,\\\.\?\/\{\}\'\"\[\]\0-9])regexp"));
    QRegExp removeRegExp(QString::fromUtf8("[^а-яА-Я -’']"));
    std::string s;
    quint32 counter = 0;
    QString x;
    while (in >> s) {
        s = QString::fromStdString(s).remove(removeRegExp).remove(removeRegExp1).toLower().toStdString();
        if (s == "")
            continue;
        ++words[s];
        counter++;
        if ((counter % 1000) == 0){
            //qDebug() << "processed" << counter << "words";
        }
    }
    return counter;
}
