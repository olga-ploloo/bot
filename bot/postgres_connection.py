import os
import logging
import psycopg2
from dotenv import load_dotenv

load_dotenv()
logger = logging.getLogger('bot')


def create_connection():
    try:
        logger.info('Start connecting to the MySQL database.')
        connection = psycopg2.connect(
            dbname=os.getenv('POSTGRES_DB'),
            user=os.getenv('POSTGRES_USER'),
            password=os.getenv('POSTGRES_PASSWORD'),
        )
        if connection:
            logger.info("Successfully connected to the MySQL database!")
            return connection
    except psycopg2.Error as error:
        logger.error(f"Failed to connect to the MySQL database: {error}")


def close_connection(connection):
    try:
        if connection is not None:
            connection.close()
            logger.info("Database connection closed.")
    except psycopg2.Error as error:
        logger.error(f"Error closing database connection: {error}")


def get_query(query, params=None):
    try:
        connection = create_connection()
        if connection:
            cursor = connection.cursor()
            cursor.execute(query, params)
            results = cursor.fetchall()
            cursor.close()
            return results
    except psycopg2.Error as error:
        logger.error(f"An error occurred while executing query: {error}")
    finally:
        if connection:
            close_connection(connection)
            logger.info('Database connection closed.')
