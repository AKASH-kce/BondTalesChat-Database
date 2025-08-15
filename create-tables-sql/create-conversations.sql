IF OBJECT_ID('dbo.Conversations','U') IS NULL
CREATE TABLE dbo.Conversations (
    ConversationId INT IDENTITY PRIMARY KEY,
    IsGroup BIT NOT NULL DEFAULT 0,     -- 0=1:1, 1=Group
    Title NVARCHAR(200) NULL,           -- Group name
    CreatedBy INT NULL,                 -- Creator for group
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserId)
);
