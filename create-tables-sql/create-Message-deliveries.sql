-- Per-recipient delivery/receipt (Sent/Delivered/Read)
IF OBJECT_ID('dbo.MessageDeliveries','U') IS NULL
CREATE TABLE MessageDeliveries (
  MessageId INT NOT NULL,
  UserId INT NOT NULL,                   -- recipient (not sender)
  Status TINYINT NOT NULL,               -- 0=Sent,1=Delivered,2=Read
  DeliveredAt DATETIME2 NULL,
  ReadAt DATETIME2 NULL,
  PRIMARY KEY (MessageId, UserId),
  FOREIGN KEY (MessageId) REFERENCES Messages(MessageId),
  FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
CREATE INDEX IX_MessageDeliveries_User_Status ON MessageDeliveries(UserId, Status);