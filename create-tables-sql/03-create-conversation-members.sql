-- CONVERSATION MEMBERS
IF OBJECT_ID('dbo.ConversationMembers','U') IS NULL
CREATE TABLE dbo.ConversationMembers (
    ConversationId INT NOT NULL,
    UserId INT NOT NULL,
    JoinedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    PRIMARY KEY (ConversationId, UserId),
    FOREIGN KEY (ConversationId) REFERENCES dbo.Conversations(ConversationId),
    FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId)
);
-- Index for faster lookup of user's conversations
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name='IX_ConversationMembers_User')
    CREATE INDEX IX_ConversationMembers_User ON dbo.ConversationMembers(UserId);
