-- USERS table
IF OBJECT_ID('dbo.Users', 'U') IS NULL
CREATE TABLE dbo.Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(200) NOT NULL,
    email NVARCHAR(200) NOT NULL,
    userpassword NVARCHAR(200) NOT NULL,
    ProfilePicture NVARCHAR(500) NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    phoneNumber NVARCHAR(10) NOT NULL
        CHECK (LEN(phoneNumber) = 10)
);
