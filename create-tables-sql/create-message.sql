-- Create Messages table if it doesn't already exist
IF OBJECT_ID('dbo.Messages', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Messages (
        MessageId INT IDENTITY(1,1) PRIMARY KEY,      -- Auto-increment primary key
        SenderId INT NOT NULL,                        -- User who sent the message
        GroupId INT NULL,                             -- Null for 1:1 chats
        ReceiverId INT NULL,                          -- Null for group chats
        MessageText NVARCHAR(MAX) NULL,               -- Text content (can be NULL for media)
        MediaUrl NVARCHAR(500) NULL,                  -- For images/videos/docs
        MessageType TINYINT NOT NULL DEFAULT 0,       -- 0=Text, 1=Image, 2=Video, 3=Doc, 4=Audio
        SentAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        Edited BIT NOT NULL DEFAULT 0,                -- 1 if message was edited
        Deleted BIT NOT NULL DEFAULT 0,               -- 1 if message was deleted
        FOREIGN KEY (SenderId) REFERENCES dbo.Users(UserId),
        FOREIGN KEY (GroupId) REFERENCES dbo.Groups(GroupId),
        FOREIGN KEY (ReceiverId) REFERENCES dbo.Users(UserId)
    );

    -- Indexes for faster querying by chat participants
    CREATE INDEX IX_Messages_Sender_Receiver ON dbo.Messages(SenderId, ReceiverId);
    CREATE INDEX IX_Messages_GroupId ON dbo.Messages(GroupId);
END;
