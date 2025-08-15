IF OBJECT_ID('dbo.Messages','U') IS NULL
CREATE TABLE dbo.Messages (
    MessageId INT IDENTITY(1,1) PRIMARY KEY,
    ConversationId INT NOT NULL,
    SenderId INT NOT NULL,
    MessageText NVARCHAR(MAX) NULL,
    MediaUrl NVARCHAR(500) NULL,
    MessageType TINYINT NOT NULL DEFAULT 0,   -- 0=Text,1=Image,2=Video,3=Doc,4=Audio
    SentAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    Edited BIT NOT NULL DEFAULT 0,
    Deleted BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (ConversationId) REFERENCES Conversations(ConversationId),
    FOREIGN KEY (SenderId) REFERENCES Users(UserId)
);

-- Indexes for fast retrieval
CREATE INDEX IX_Messages_Conv_SentAt ON dbo.Messages(ConversationId, SentAt DESC, MessageId DESC);
CREATE INDEX IX_Messages_Sender ON dbo.Messages(SenderId);
