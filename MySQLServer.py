import mysql.connector
from mysql.connector import Error

def create_database():
    """
    Connects to the MySQL server and creates the 'alx_book_store' database.
    """
    # --- Configuration for your MySQL server ---
    # IMPORTANT: Replace 'your_username' and 'your_password' with your actual MySQL credentials.
    # The 'host' might be 'localhost' or an IP address depending on your setup.
    DB_CONFIG = {
        'host': 'localhost',  # e.g., '127.0.0.1' or 'your_mysql_host'
        'user': 'your_username',
        'password': 'your_password'
    }
    # -------------------------------------------

    connection = None
    cursor = None
    try:
        # Establish a connection to the MySQL server
        # We don't specify a database here because we are creating one
        connection = mysql.connector.connect(
            host=DB_CONFIG['host'],
            user=DB_CONFIG['user'],
            password=DB_CONFIG['password']
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # SQL query to create the database if it doesn't already exist
            db_creation_query = "CREATE DATABASE IF NOT EXISTS alx_book_store;"

            print(f"Attempting to create database: alx_book_store")
            cursor.execute(db_creation_query)
            print("Database 'alx_book_store' created successfully or already exists.")

    except Error as e:
        print(f"Error connecting to MySQL or creating database: {e}")
    finally:
        # Close the cursor and connection
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()
