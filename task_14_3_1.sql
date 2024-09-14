--Задание 1

--Создайте следующие запросы для таблицы с оценками студентов из предыдущего задания:

--    Отображение всей информации из таблицы со студентами и оценками;
SELECT *
FROM Students;

--    Отображение ФИО всех студентов;
SELECT FullName
FROM Students;

--    Отображение всех средних оценок;
SELECT AVG(AverageRating) AS AverageGrade
FROM Students
GROUP BY id;

--    Показать ФИО всех студентов с минимальной оценкой, больше, чем указанная;
DECLARE @MinGrade INT = 4;

SELECT FullName
FROM Students
WHERE AverageRating > @MinGrade
GROUP BY FullName
HAVING MIN(AverageRating) > @MinGrade;

--    Показать страны студентов. Названия стран должны быть уникальными;
--У меня в таблице не было столбца 'Страна'

--    Показать города студентов. Названия городов должны быть уникальными;
SELECT DISTINCT City
FROM Students;

--Показать названия групп. Названия групп должны быть уникальными;
SELECT DISTINCT GroupName
FROM Students;

--Показать название всех предметов с минимальным средними оценками. Названия предметов должн быть уникальными
SELECT DISTINCT WithMinimumGrade
FROM Students;

--В скринах есть запросы с краными подчеркиваниями: то я столбцы переименовывал из-за ошибок