import pandas as pd
from sqlalchemy import create_engine, MetaData, Column, Integer,  String
from sqlalchemy.ext.declarative import declarative_base
import config

engine = create_engine(config.postgres_url)
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
df = pd.read_csv(file_name, error_bad_lines=False)
df.to_sql(con=engine, index_label='id', name=Movie.__tablename__, if_exists='replace')