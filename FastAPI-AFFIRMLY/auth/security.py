# auth/security.py

from passlib.context import CryptContext
from datetime import datetime, timedelta
from typing import Optional, Union
import jwt
from fastapi import Depends, HTTPException, status
from pydantic import BaseModel

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# Модель данных из токена
class TokenData(BaseModel):
    email: Optional[str] = None


SECRET_KEY = "f563374601d9f65e9d8fb9f3509d070fe04f27da9ca2a735fe05c5a8ffa79e5f"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)

def get_password_hash(password: str) -> str:
    return pwd_context.hash(password)

def create_access_token(data: dict, expires_delta: Optional[timedelta] = None) -> str:
    to_encode = data.copy()
    expire = datetime.utcnow() + (expires_delta or timedelta(minutes=15))
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt