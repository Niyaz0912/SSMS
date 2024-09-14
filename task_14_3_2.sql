--Задание 2

--Создайте следующие запросыдля базыданных с оценками студентов из предыдущего практического задания:

    --Показать ФИО всех студентов с минимальной оценкой в указанном диапазоне;
DECLARE @MinGrade INT = 3; -- Нижняя граница
DECLARE @MaxGrade INT = 5; -- Верхняя граница

SELECT FullName
FROM Students
WHERE AverageRating BETWEEN @MinGrade AND @MaxGrade;

    --Показать информацию о студентах, которым исполнилось 20 лет;
SELECT FullName
FROM Students
WHERE DATEDIFF(YEAR, BirthdayData, GETDATE()) >= 20;

    --Показать информацию о студентах с возрастом в указанном диапазоне;
DECLARE @MinAge INT = 18; -- Минимальный возраст
DECLARE @MaxAge INT = 25; -- Максимальный возраст

SELECT FullName
FROM Students
WHERE DATEDIFF(YEAR, BirthdayData, GETDATE()) BETWEEN @MinAge AND @MaxAge;

    --Показать информацию о студентах с конкретным именем. Например, показать студентов с именем Иван
SELECT *
FROM Students
WHERE FullName LIKE 'Иван%';

    --Показать информацию о студентах, в чьем номере встречаются три восьмерки;
SELECT *
FROM Students
WHERE Phone LIKE '%888%';

    --Показать электронные адреса студентов, начинающихся с конкретной буквы
DECLARE @Letter CHAR(1) = 's';

SELECT Email
FROM Students
WHERE Email LIKE @Letter + '%';
