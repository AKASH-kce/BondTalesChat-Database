IF OBJECT_ID('dbo.Conversations','U') IS NULL
CREATE TABLE Conversations (
  ConversationId INT IDENTITY PRIMARY KEY,
  IsGroup BIT NOT NULL DEFAULT 0,
  Title NVARCHAR(200) NULL,           -- for groups
  CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);