from sqlalchemy import Column, Integer, String, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import MetaData, Table, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from config import postgre_url
import pandas as pd

Base = declarative_base()


class MediaIds(Base):
    __tablename__ = 'movie'
    id = Column(Integer, primary_key=True)
    name = Column(String(255))
    link = Column(String(255))
    style = Column(String(255))


engine = create_engine(postgre_url)

metadata = MetaData()
Base = declarative_base()


class Movie(Base):
    __tablename__ = 'movie'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    link = Column(String)
    style = Column(String)


Base.metadata.create_all(engine)
file_name = 'first.csv'
df = pd.read_csv(file_name)
df.to_sql(con=engine, index_label='id', name=Movie.__tablename__, if_exists='replace')
