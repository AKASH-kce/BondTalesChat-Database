IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Users' AND xtype='U')
BEGIN
    CREATE TABLE Users (
        UserId INT IDENTITY PRIMARY KEY,
        UserName NVARCHAR(100) NOT NULL,
        Email NVARCHAR(200) UNIQUE NOT NULL,
        PasswordHash NVARCHAR(500) NOT NULL
    );
END;