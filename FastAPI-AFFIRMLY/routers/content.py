# routers/content.py

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

# Локальные импорты
from auth.auth import authenticate_user, get_current_user, create_user
from auth.security import create_access_token
from database.db import get_db
from models import User
from schemas.schemas import LoginRequest, UserCreate

router = APIRouter(prefix="/affirmations", tags=["Affirmations"])

# ========== АФФИРМАЦИИ ==========
@router.get("/")
def get_all_affirmations():
    # TODO: заменить на реальные данные из БД
    return {"message": "Список всех аффирмаций"}

# ========== ПОЛЬЗОВАТЕЛЬ ==========
@router.get("/me")
def read_users_me(current_user: User = Depends(get_current_user)):
    return current_user


# ========== АВТОРИЗАЦИЯ ===========
@router.post("/sign-in")
def login(data: LoginRequest, db: Session = Depends(get_db)):
    user = authenticate_user(db, data.email, data.password)
    token = create_access_token(data={"sub": user.email})

    ret = {
        "accessToken": token,
        "tokenType": "bearer",
        "user": {
            "id": user.id,
            "email": user.email,
            "name": user.name,
        }
    }

    print(ret)

    return ret

@router.post("/register")
def register_user(user: UserCreate, db: Session = Depends(get_db)):
    try:
        result = create_user(db=db, user=user)
        return result  # включает user и access_token
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))