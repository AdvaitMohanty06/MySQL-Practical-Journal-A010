CREATE PROCEDURE 'ErrorHandler' ()
BEGIN
	SELECT * FROM AccountDetails
END

CREATE DEFINER = 'root@localhost' PROCEDURE 'ErrorHandler' ()
BEGIN 
	DECLARE CONTINUE HANDLER FOR 1146
	BEGIN
		SELECT 'Check Table Name' as Message;
	END
    select * from AccountDetails;
END

CREATE PROCEDURE 'ErrorHandler2' ()
BEGIN 
	DECLARE CONTINUE HANDLER FOR 1146
    BEGIN 
		SELECT 'Check Table Name' as Message;
	END
    SELECT * FROM AccountDetails;
    SELECT * FROM TransactionDetails;
END

CREATE PROCEDURE 'ExceptionHandling' ()
BEGIN
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
		SELECT 'Something went wrong, please try again' as Message;
	END
	select * from AccountDetails;
    select * from Transaction Details;
END

CREATE PROCEDURE 'ExceptionHandling1' ()
BEGIN
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
		SELECT 'Something went wrong, please try again' as Message;
	END
	select * from AccountDetails;
    select * from Transaction Details;
END

