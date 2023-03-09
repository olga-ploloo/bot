import logging
import postgres_connection
from dotenv import load_dotenv

load_dotenv()
logger = logging.getLogger('bot')


def get_movies(style) -> list:
    return postgres_connection.get_query(
        'SELECT name, link FROM movie WHERE style = %s',
        style
    )
