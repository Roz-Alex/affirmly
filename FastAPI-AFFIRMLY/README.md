# Affirmly API

## ключ и работа с ним

Вы можете увидеть в коде файла `security.py`
используется секретный ключ:

```python
SECRET_KEY = "f563374601d9f65e9d8fb9f3509d070fe04f27da9ca2a735fe05c5a8ffa79e5f"
```

Чтобы создать новый ключ запустите:

```bash
python -c "import secrets; print(secrets.token_hex(32))"
```

ВАЖНО!

Если вы поменяете секрет, то другие
приложения, которые обращаются к бэку со старым кодом перестанут работать

Строго говоря использовать ключ в коде небезопасно
но так как у нас просто практика остаемся с этим

## Описание API

Обратите внимание, что во всем апи в качестве base_url используется `http://localhost:8000/affirmations/` поэтому все запросы которые вы будете писать чтобы протестить апи должны начинаться с этого, иначе будете получать 404

### /

Пока еще в разработке, здесь будет начальная страница 

### /me

Выводит информацию о юзере, в приложении не используется но может быть полезно при тестировании апи

### /sign-in

Вход пользователя, апи настроен из приложения работает

на вход ожидается:

```json
{
	"email": "example@exampl3.com",
	"password": "password"
}
```

в ответ возвращается:

```json
}
    "accessToken": "token-long-string",
    "tokenType": "bearer",
    "user": {
        "id": "long-string",
        "email": "example@exampl3.com",
        "name": "Иванов Иван",
    }
}
```

### /register

Регистрация пользователя, апи настроен, из приложения пока не работает

вход:

```json
{
  "name": "Иван Иванов",
  "email": "ivan1@example.com",
  "password": "securepassword123"
}

````

ответ:

```json
{
    "user": {
        "name": "Иван Иванов",
        "password_hash": "$2b$12$8gHN9zx8XBJQR8IF3WSL8.GJCbwPJ/Ywm99Qx2LgeQg7g1oHwRcDe",
        "created_at": "2025-05-25T15:17:35.436242",
        "id": "b02da5b5-74f2-4ae3-8568-7bcd2a7e7b6b",
        "email": "ivan1@example.com",
        "updated_at": "2025-05-25T15:17:35.436261"
    },
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJpdmFuMUBleGFtcGxlLmNvbSIsImV4cCI6MTc0ODE4NzE1NX0.kQP3eC_ji_B9HDclYVzVxa69ccvBW_vkAawBK5aFYrI",
    "token_type": "bearer"
}
```









