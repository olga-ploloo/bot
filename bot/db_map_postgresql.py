import logging
import os
import psycopg2
from dotenv import load_dotenv

load_dotenv()
logger = logging.getLogger('bot.dp')


def get_movies(style) -> list:
    conn = None
    try:
        logger.info('Connecting to the PostgreSQL database.')
        conn = psycopg2.connect(
            dbname=os.getenv('db_name'),
            user=os.getenv('db_user'),
            password=os.getenv('db_password'),
            host=os.getenv('db_host')
        )
        cursor = conn.cursor()
        cursor.execute('SELECT name, link FROM movie WHERE style = %s', (style,))
        result = cursor.fetchall()
        cursor.close()
        return result
    except (Exception, psycopg2.Error) as error:
        logger.exception(error)
    finally:
        if conn:
            conn.close()
            logger.info('Database connection closed.')
