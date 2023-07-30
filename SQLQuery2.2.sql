use AddressBookApplication

CREATE PROCEDURE AddByStoredProcedure
	@Name varchar(50),
	@Email varchar(100),
	@Phone varchar(50),
	@State varchar(50),
	@City varchar(50),
	@Zipcode varchar(50)
AS
BEGIN
	DECLARE @ContactId int
	INSERT INTO Contact VALUES (@Name, @Phone, @State, @City, @Zipcode);
	SET @ContactId = SCOPE_IDENTITY();
	INSERT INTO ContactEmail VALUES (@ContactId, @Email)
END


CREATE PROCEDURE AddBuStoredProcedureUsingTransaction
	@Name varchar(50),
	@Email varchar(100),
	@Phone varchar(50),
	@State varchar(50),
	@City varchar(50),
	@Zipcode varchar(50)
AS
BEGIN
	
	BEGIN TRANSACTION
	DECLARE @ContactId INT

	BEGIN TRY
		INSERT INTO Contact VALUES (@Name, @Phone, @State, @City, @Zipcode);
		SET @ContactId = SCOPE_IDENTITY();
		INSERT INTO ContactEmail VALUES (@ContactId, @Email)

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END
