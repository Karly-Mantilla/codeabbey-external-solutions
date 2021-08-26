IF OBJECT_ID('dbo.Input', 'U') IS NOT NULL
    DROP TABLE dbo.Input

CREATE TABLE Input
(
    Col1 int,
    Col2 int,
    Col3 int
)

BULK INSERT Input FROM 'c:\users\synetic707\documents\sql server management studio\CodeAbbey\CodeAbbey\input.txt'
WITH (ROWTERMINATOR = '\n', FIELDTERMINATOR = ' ')

SELECT CASE WHEN Col1 < Col2
            THEN CASE WHEN Col1 < Col3
                THEN Col1
                ELSE Col3
                END
            ELSE CASE WHEN Col2 < Col3
                THEN Col2
                ELSE Col3
                END
    END
FROM Input