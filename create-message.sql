CREATE TABLE Messages (
    MessageId INT IDENTITY(1,1) PRIMARY KEY,
    SenderId INT NOT NULL FOREIGN KEY REFERENCES Users(UserId),
    ReceiverId INT NULL,            -- NULL for group messages
    GroupId INT NULL,               -- NULL for user-to-user messages
    Content NVARCHAR(MAX) NOT NULL,
    SentAt DATETIME NOT NULL,
    DeliveredAt DATETIME NULL,
    ReadAt DATETIME NULL
);