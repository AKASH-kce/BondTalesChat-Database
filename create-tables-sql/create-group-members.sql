IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='GroupMembers' AND xtype='U')
BEGIN
    CREATE TABLE GroupMembers (
        GroupId INT NOT NULL,
        UserId INT NOT NULL,
        PRIMARY KEY (GroupId, UserId)
    );
    END;