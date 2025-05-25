# auth/auth.py

from sqlalchemy.orm import Session
from fastapi import Depends, HTTPException, status
from typing import Optional
from fastapi.security import OAuth2PasswordBearer
import jwt
from jwt import InvalidTokenError

from models import User
from .security import verify_password, create_access_token, SECRET_KEY, ALGORITHM, get_password_hash
from database.db import get_db
from schemas.schemas import LoginRequest, UserCreate


# =============== АУТЕНТИФИКАЦИЯ ===============

def authenticate_user(db: Session, email: str, password: str) -> Optional[User]:
    user = db.query(User).filter(User.email == email).first()

    # print('\n verification \n', verify_password(password, user.password_hash))
    if not user or not verify_password(password, user.password_hash):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect email or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    return user

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/auth/sign-in")

# =============== РЕГИСТРАЦИЯ ===============

def create_user(db: Session, user: UserCreate) -> dict:
    existing_user = get_user_by_email(db, email=user.email)
    if existing_user:
        raise ValueError("Пользователь с таким email уже существует")


    hashed_password = get_password_hash(user.password)

    db_user = User(
        name=user.name,
        email=user.email,
        password_hash=hashed_password
    )

    db.add(db_user)
    db.commit()
    db.refresh(db_user)

    # Создаем токен
    access_token = create_access_token(data={"sub": db_user.email})

    return {
        "user": db_user,
        "access_token": access_token,
        "token_type": "bearer"
    }


def get_user_by_email(db: Session, email: str):
    return db.query(User).filter(User.email == email).first()

def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)) -> User:
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        email: str = payload.get("sub")
        if email is None:
            raise credentials_exception
    except InvalidTokenError:
        raise credentials_exception

    user = db.query(User).filter(User.email == email).first()
    if user is None:
        raise credentials_exception
    return user
