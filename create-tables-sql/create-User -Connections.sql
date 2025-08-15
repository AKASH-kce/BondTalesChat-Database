IF OBJECT_ID('dbo.UserConnections','U') IS NULL
CREATE TABLE dbo.UserConnections (
    ConnectionId NVARCHAR(200) PRIMARY KEY,
    UserId INT NOT NULL,
    ConnectedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
