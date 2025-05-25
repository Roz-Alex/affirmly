from sqlmodel import SQLModel, Field, Relationship
from typing import Optional, List
import uuid
from datetime import datetime, date


def gen_uuid():
    return str(uuid.uuid4())

class Base(SQLModel):
    # Это просто точка входа для всех моделей
    pass

# ========== USER ==========
class User(SQLModel, table=True):
    id: str = Field(default_factory=gen_uuid, primary_key=True)
    name: str
    email: str
    password_hash: str
    created_at: datetime = Field(default_factory=datetime.utcnow)
    updated_at: datetime = Field(default_factory=datetime.utcnow)

    affirmations: List["Affirmation"] = Relationship(back_populates="user")
    favorites: List["Favorite"] = Relationship(back_populates="user")
    progress: List["UserProgress"] = Relationship(back_populates="user")


# ========== CATEGORY ==========
class Category(SQLModel, table=True):
    id: str = Field(default_factory=gen_uuid, primary_key=True)
    name: str

    affirmations: List["Affirmation"] = Relationship(back_populates="category")


# ========== AFFIRMATION ==========
class Affirmation(SQLModel, table=True):
    id: str = Field(default_factory=gen_uuid, primary_key=True)
    user_id: str = Field(foreign_key="user.id")
    category_id: str = Field(foreign_key="category.id")

    text: str
    image_url: Optional[str] = None
    audio_url: Optional[str] = None
    created_at: datetime = Field(default_factory=datetime.utcnow)

    user: Optional[User] = Relationship(back_populates="affirmations")
    category: Optional[Category] = Relationship(back_populates="affirmations")

    favorites: List["Favorite"] = Relationship(back_populates="affirmation")
    progress: List["UserProgress"] = Relationship(back_populates="affirmation")
    tags: List["AffirmationTag"] = Relationship(back_populates="affirmation")


# ========== FAVORITE ==========
class Favorite(SQLModel, table=True):
    user_id: str = Field(foreign_key="user.id", primary_key=True)
    affirmation_id: str = Field(foreign_key="affirmation.id", primary_key=True)

    user: Optional[User] = Relationship(back_populates="favorites")
    affirmation: Optional[Affirmation] = Relationship(back_populates="favorites")


# ========== USER PROGRESS ==========
class UserProgress(SQLModel, table=True):
    id: str = Field(default_factory=gen_uuid, primary_key=True)
    user_id: str = Field(foreign_key="user.id")
    affirmation_id: str = Field(foreign_key="affirmation.id")

    date_used: date
    mood_note: Optional[str] = None
    times_played: int = 0

    user: Optional[User] = Relationship(back_populates="progress")
    affirmation: Optional[Affirmation] = Relationship(back_populates="progress")


# ========== TAG ==========
class Tag(SQLModel, table=True):
    id: str = Field(default_factory=gen_uuid, primary_key=True)
    name: str

    affirmations: List["AffirmationTag"] = Relationship(back_populates="tag")


# ========== AFFIRMATION-TAG ==========
class AffirmationTag(SQLModel, table=True):
    affirmation_id: str = Field(foreign_key="affirmation.id", primary_key=True)
    tag_id: str = Field(foreign_key="tag.id", primary_key=True)

    affirmation: Optional[Affirmation] = Relationship(back_populates="tags")
    tag: Optional[Tag] = Relationship(back_populates="affirmations")


# ========== EDUCATIONAL CONTENT ==========
class EducationalContent(SQLModel, table=True):
    id: str = Field(default_factory=gen_uuid, primary_key=True)
    title: str
    content_type: str  # можно сделать Enum, но пока строкой
    url: str
    description: Optional[str] = None
