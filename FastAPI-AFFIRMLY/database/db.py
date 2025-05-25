# database/db.py

from sqlmodel import create_engine, Session
from sqlmodel.sql.expression import Select, SelectOfScalar
from typing import Generator

DATABASE_URL = "postgresql://entityfrm:pP3VJsoAcX2q@ep-mute-sun-a2woi1rv-pooler.eu-central-1.aws.neon.tech/mobile_dev?sslmode=require"  # например

engine = create_engine(DATABASE_URL, echo=True)

def init_db():
    """Создаёт все таблицы при первом запуске"""
    from models import Base
    # Base.metadata.create_all(bind=engine)

def get_db() -> Generator[Session, None, None]:
    """Зависимость для получения сессии БД"""
    with Session(engine) as session:
        yield session
