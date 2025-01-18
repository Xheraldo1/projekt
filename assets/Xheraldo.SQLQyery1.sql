CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    Credits INT
);
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName NVARCHAR(100),
    Grade INT,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES
(1,'Mathematics&#39', 3),
(2, 'Physics', 4),
(3, 'Chemistry', 3),
(4, 'Computer Science', 4);
INSERT INTO Students (StudentID, StudentName, Grade, CourseID)
VALUES
(1,'Ana', 85, 1),
(2,'Ben', 75, 2),
(3, 'Carla', 88, 1),
(4, 'David', 90, 3),
(5, 'Eva', 92, 4),
(6, 'Frank', 78, 2);
SELECT COUNT(*) AS TotalStudents
FROM Students;
SELECT AVG(Grade) AS AverageGrade
FROM Students;
SELECT SUM(Grade) AS TotalGrades
FROM Students;
SELECT MAX(Grade) AS HighestGrade, MIN(Grade) AS LowestGrade
FROM Students;
SELECT COUNT(*) AS StudentsAbove80
FROM Students
WHERE Grade > 80;
SELECT COUNT(DISTINCT StudentID) AS StudentsAbove80MultipleCourses
FROM Students
WHERE Grade > 80
GROUP BY StudentID
HAVING COUNT(DISTINCT CourseID) > 1;
SELECT StudentID, StudentName
FROM Students
WHERE Grade > 80
GROUP BY StudentID, StudentName
HAVING COUNT(DISTINCT CourseID) > 1;
SELECT c.CourseName, AVG(s.Grade) AS AverageGrade
FROM Students s
JOIN Courses c ON s.CourseID = c.CourseID
GROUP BY c.CourseName;
