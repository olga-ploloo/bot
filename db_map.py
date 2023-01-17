import logging
import psycopg2
import config

logger = logging.getLogger('bot.dp')


def get_movies(style) -> list:
    conn = None
    try:
        logger.info('Connecting to the PostgreSQL database.')
        conn = psycopg2.connect(
            dbname=config.db_name,
            user=config.db_user,
            password=config.db_password,
            host=config.db_host
        )
        cursor = conn.cursor()
        cursor.execute('SELECT name, link FROM movie WHERE style = %s', (style,))
        result = cursor.fetchall()
        cursor.close()
        return result
    except (Exception, psycopg2.DatabaseError) as error:
        # logging.exception(error)
        logger.error(error, exc_info=True)
    finally:
        if conn is not None:
            conn.close()
            logger.info('Database connection closed.')
