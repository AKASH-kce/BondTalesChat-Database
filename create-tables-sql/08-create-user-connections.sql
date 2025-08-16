-- Create ConversationMembers table if not exists
IF OBJECT_ID('dbo.ConversationMembers','U') IS NULL
BEGIN
    CREATE TABLE dbo.ConversationMembers (
        ConversationId INT NOT NULL,
        UserId INT NOT NULL,
        JoinedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        PRIMARY KEY (ConversationId, UserId),
        FOREIGN KEY (ConversationId) REFERENCES Conversations(ConversationId),
        FOREIGN KEY (UserId) REFERENCES Users(UserId)
    );
END
GO

-- Create index if not exists
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_ConversationMembers_User')
BEGIN
    CREATE INDEX IX_ConversationMembers_User ON dbo.ConversationMembers(UserId);
END
GO
