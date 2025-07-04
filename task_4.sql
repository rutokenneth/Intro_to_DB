-- Use the alx_book_store database
USE alx_book_store;

-- Query INFORMATION_SCHEMA.COLUMNS to get details about the 'Books' table
-- This provides a detailed description of each column, similar to DESCRIBE
SELECT
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Books'
ORDER BY
    ORDINAL_POSITION;
