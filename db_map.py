import psycopg2
from sqlalchemy import create_engine
from sqlalchemy import MetaData, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
import config
import pandas as pd

Base = declarative_base()


class Movie(Base):
    __tablename__ = 'movie'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    link = Column(String)
    style = Column(String)


def create_and_fill_db():
    engine = create_engine(config.postgre_url)
    metadata = MetaData()
    Base.metadata.create_all(engine)
    file_name = 'first.csv'
    df = pd.read_csv(file_name, error_bad_lines=False)
    df.to_sql(con=engine, index_label='id', name=Movie.__tablename__, if_exists='replace')


def get_movies(style) -> list:
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
    conn.close()
    return result
