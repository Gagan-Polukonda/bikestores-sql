-- 1. Switch to master so you’re not using BikeStores yourself
USE master;
GO

-- 2. Find and kill all sessions on BikeStores (except your own)
DECLARE @spid INT;

DECLARE session_cursor CURSOR FOR
  SELECT session_id
  FROM sys.dm_exec_sessions
  WHERE database_id = DB_ID('BikeStores')
    AND session_id <> @@SPID;  -- don’t kill your own session

OPEN session_cursor;
FETCH NEXT FROM session_cursor INTO @spid;

WHILE @@FETCH_STATUS = 0
BEGIN
  EXEC('KILL ' + @spid);
  FETCH NEXT FROM session_cursor INTO @spid;
END

CLOSE session_cursor;
DEALLOCATE session_cursor;
GO

-- 3. Force BikeStores into single-user mode (roll back anything in flight)
ALTER DATABASE BikeStores
  SET SINGLE_USER
  WITH ROLLBACK IMMEDIATE;
GO

-- 4. Now drop it
DROP DATABASE BikeStores;
GO
