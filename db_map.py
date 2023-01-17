import logging
import psycopg2
from dotenv import dotenv_values

logger = logging.getLogger('bot.dp')


def get_movies(style) -> list:
    conn = None
    try:
        logger.info('Connecting to the PostgreSQL database.')
        conn = psycopg2.connect(
            dbname=dotenv_values().get('db_name'),
            user=dotenv_values().get('db_user'),
            password=dotenv_values().get('db_password'),
            host=dotenv_values().get('db_host')
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
