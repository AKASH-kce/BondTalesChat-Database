IF OBJECT_ID('dbo.Messages','U') IS NULL
CREATE TABLE Messages (
  MessageId INT IDENTITY PRIMARY KEY,
  ConversationId INT NOT NULL,
  SenderId INT NOT NULL,
  MessageText NVARCHAR(MAX) NOT NULL,
  SentAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  FOREIGN KEY (ConversationId) REFERENCES Conversations(ConversationId),
  FOREIGN KEY (SenderId) REFERENCES Users(UserId)
);
CREATE INDEX IX_Messages_Conv_SentAt ON Messages(ConversationId, SentAt DESC);