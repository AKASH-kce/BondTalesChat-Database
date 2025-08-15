-- MESSAGE DELIVERIES (per-recipient read/delivery status)
IF OBJECT_ID('dbo.MessageDeliveries','U') IS NULL
CREATE TABLE dbo.MessageDeliveries (
    MessageId INT NOT NULL,
    UserId INT NOT NULL,         -- recipient (not sender)
    Status TINYINT NOT NULL,     -- 0=Sent,1=Delivered,2=Read
    DeliveredAt DATETIME2 NULL,
    ReadAt DATETIME2 NULL,
    PRIMARY KEY (MessageId, UserId),
    FOREIGN KEY (MessageId) REFERENCES dbo.Messages(MessageId),
    FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId)
);

-- Index for fast delivery queries
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name='IX_MessageDeliveries_User_Status')
    CREATE INDEX IX_MessageDeliveries_User_Status ON dbo.MessageDeliveries(UserId, Status);
