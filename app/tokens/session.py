from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, scoped_session

from ..common import config


def create_session_maker(database_uri=None):
    engine = create_engine(database_uri or config.SQLALCHEMY_DATABASE_URI, echo=False)

    return scoped_session(sessionmaker(bind=engine, autoflush=False))


session = create_session_maker()
