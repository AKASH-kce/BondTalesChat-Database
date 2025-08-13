IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Groups' AND xtype='U')
BEGIN
    CREATE TABLE Groups (
        GroupId INT IDENTITY PRIMARY KEY,
        GroupName NVARCHAR(200) NOT NULL,
        CreatedBy INT NOT NULL,
        CreatedAt DATETIME DEFAULT GETDATE()
    );
END;