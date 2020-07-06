# Тестовое задание Java: Penalty extractor

Общие сведения:
-----------------
    Тестовое задание Java: Penalty extractor
    Автор: Oleg Ustsov
    Дата выполненения: 2020-02-24

Задание:
--------------------------------------
    Разработать сервлет, представляющий из себя веб-форму параметризованного поиска штрафов 
    по владельцу и госномеру по базе ("информация о штрафах": госномер, марка автомобиля, 
    модель автомобиля, владелец, тип начисленного штрафа), а также подготовки отчета о 5 самых 
    частых штрафах. 
    Одному владельцу может принадлежать несколько автомобилей. 
    Справочник типов штрафов и пошлины по его оплате размещается в отдельной таблице-справочнике. 
    В качестве БД для хранения данных и контейнера сервлетов можно использовать любую БД, при этом, 
    для создания базы и справочника, и заполнения их данными нужно использовать flywaydb. 
    Необходимо снабдить результат инструкцией по развертыванию, включая указание используемого 
    веб-сервера (контейнер сервлетов) и БД.

Сборка и запуск:
--------------------------------------
* Автоматический запуск: запустить файл "StartAppScript.bat: в корне проекта  
* Запуск из IDE: запустить выполнение класса "penaltyextractor.boot.PenaltyExtractorApp"
* Ручная сборка и запуск (из каталога проекта):
    * gradlew.bat :clean
    * gradlew.bat :build
    * java -jar ./build/libs/PenaltyExtractor.jar
* В результате запуска проекта запускается сервлет, доступный по адресу:
    * http://localhost:8080/

Используемые в проекте средства:
--------------------------------------
* Java SDK 1.8
* IntelleJ IDEA Community Edition 2019.3
* Система сборки и управления  зависимостями: Gradle 5.2.1
* Фреймворк: Spring Boot 2.2.4
* Веб-фреймворк: Thymeleaf
* Веб-сервер: Apache Tomcat (средствами Spring Boot Web)
* СУБД, встраиваемая: H2database 1.4.200 (in-memory)
* Миграция БД: Flywaydb 6.2.4
* Работа с БД: Spring JDBC Template 5.2.2

База данных:
--------------------------------------
* БД работает в режиме in-memory, создается автоматически при запуске проекта.
* SQL-script базы данных (схема/данные): .\PenaltyExtractor\src\main\resources\db\migration\V1_1__PenaltyDB.sql

 


       