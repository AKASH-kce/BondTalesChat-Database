IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Messages' AND xtype='U')
BEGIN
    CREATE TABLE Messages (
        MessageId INT IDENTITY PRIMARY KEY,
        SenderId INT NOT NULL,
        GroupId INT NULL, -- NULL for 1:1 chats
        ReceiverId INT NULL, -- NULL for group chats
        MessageText NVARCHAR(MAX) NOT NULL,
        SentAt DATETIME DEFAULT GETDATE()
    );
END;