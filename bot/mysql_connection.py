import os
import logging
import mysql.connector as connector
import pandas as pd
from dotenv import load_dotenv

load_dotenv()
logger = logging.getLogger('bot.main')


def create_connection_pool():
    try:
        print('Start connecting to the MySQL database.')
        pool = connector.pooling.MySQLConnectionPool(
            pool_name='my_pool',
            pool_size=5,
            pool_reset_session=True,
            user=os.getenv('mysql_user'),
            password=os.getenv('mysql_password'),
            host=os.getenv('mysql_host'),
            database=os.getenv('mysql_name'),
        )
        print("MySQL connection pool initialized.")
        return pool
    except connector.Error as error:
        print(f"Failed to initialize the MySQL connection pool: {error}")


def get_connection_from_pool():
    try:
        connection = create_connection_pool().get_connection()
        if connection.is_connected():
            print("Connection acquired from the pool.")
            return connection
    except connector.Error as error:
        print(f"Failed to get connection from the pool: {error}")


def create_connection_simple():
    try:
        print('Start connecting to the MySQL database.')
        connection = connector.connect(
            user=os.getenv('mysql_user'),
            password=os.getenv('mysql_password'),
            host=os.getenv('mysql_host'),
            database=os.getenv('mysql_name'),
        )
        if connection.is_connected():
            print("Successfully connected to the MySQL database!")
            return connection
    except connector.Error as error:
        print(f"Failed to connect to the MySQL database: {error}")


def close_connection(connection):
    try:
        if connection is not None:
            connection.close()
            print("Database connection closed.")
    except connector.Error as error:
        print(f"Error closing database connection: {error}")


def query(query, params=None):
    try:
        connection = create_connection_simple()
        if connection:
            cursor = connection.cursor()
            cursor.execute(query, params)
            results = cursor.fetchall()
            cursor.close()
            close_connection(connection)
            print(results)
            return results
    except connector.Error as error:
        print(f"An error occurred while executing query: {error}")


def import_csv_to_table(file_name, table_name):
    try:
        connection = get_connection_from_pool()
        print('here')
        if connection:
            df = pd.read_csv(file_name, error_bad_lines=False)
            df.to_sql(
                name=table_name,
                con=connection,
                index_label='id',
                if_exists='replace'
            )
    except connector.Error as error:
        print(f"Failed to import csv file: {error}")


if __name__ == "__main__":
    query('select * from movies')
    # file_name = '/home/oy/Python/bot/bot/films.csv'
    # import_csv_to_table(file_name, 'movie')
    # query("LOAD DATA INFILE /home/oy/Python/bot/bot/films.csv INTO TABLE moviese FIELDS TERMINATED BY ',' ENCLOSED
    # BY '\"' " " LINES TERMINATED BY '\n' IGNORE 1 ROWS;")