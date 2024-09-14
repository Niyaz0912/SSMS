--Задание 3

--Создайте следующие запросыдля базыданных с оценками студентов из предыдущего практического задания:

    --Показать минимальную среднюю оценку по всем студентам;
SELECT MIN(AverageGrade) AS MinAverageGrade
FROM (
    SELECT AVG(AverageRating) AS AverageGrade
    FROM Students
    GROUP BY id
) AS SubQuery;

    --Показать максимальную среднюю оценку по всем студентам;
SELECT MAX(AverageGrade) AS MaxAverageGrade
FROM (
    SELECT AVG(AverageRating) AS AverageGrade
    FROM Students
    GROUP BY id
) AS SubQuery;

    --Показать статистику городов студентов. Нужно отображать название города и количество студентов из этого города;
SELECT City, COUNT(*) AS StudentCount
FROM Students
GROUP BY City;

    --Показать статистику стран студентов. Нужно отображать название страны и количество студентов из этой страны;
--В моей таблице нету графы Страна

    --Показать количество студентов, у которых минимальная средняя оценка по математике;
SELECT COUNT(*) AS StudentsWithMinAlgebraGrade
FROM (
  SELECT id
  FROM Students
  WHERE WithMinimumGrade = 'Алгебра'
  GROUP BY id
  HAVING MIN(WithMinimumGrade) = (
    SELECT MIN(MinGrade)
    FROM (
      SELECT MIN(WithMinimumGrade) AS MinGrade
      FROM Students
      WHERE WithMinimumGrade = 'Алгебра'
      GROUP BY id
    ) AS SubQuery
  )
) AS MinAlgebraGradeStudents;

    --Показать количество студентов, у которых максимальная средняя оценка по математике;
SELECT COUNT(*) AS StudentsWithMinAlgebraGrade
FROM (
  SELECT id
  FROM Students
  WHERE WithMaximumGrade = 'Алгебра'
  GROUP BY id
  HAVING MAX(WithMaximumGrade) = (
    SELECT MAX(MinGrade)
    FROM (
      SELECT MIN(WithMaximumGrade) AS MinGrade
      FROM Students
      WHERE WithMaximumGrade = 'Алгебра'
      GROUP BY id
    ) AS SubQuery
  )
) AS MinAlgebraGradeStudents;

    --Показать количество студентов в каждой группе;
SELECT GroupName, COUNT(*) AS StudentCount
FROM Students
GROUP BY GroupName;

--Показать среднюю оценку по группе
SELECT GroupName, AVG(AverageRating) AS AverageGrade
FROM Students
GROUP BY GroupName;