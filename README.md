# Проект Affirmly

## Работа с гито

Рекомендую каждому работать в своей ветке если будем писать одновременно код

1. Клонируете репо к себе целиком с помощью `git clone`

2. создаете ветку с помощью `git checkout -b <branch_name>`

3. На всякий случай рекомендую проверить что это нужная ветка с помощью `git branch`

должно вывестись две ветки - main и ваша ветка

### ОЧЕНЬ ВАЖНО

Если вы уже клонировали репо и хотите продолжить работу с ним, **ОБЯЗАТЕЛЬНО** сделайте фетч последних правок с помощью `git pull origin main`. Если будет ругаться можно сделать хард пулл, погуглите или напишите мне

## Работа с кодом

Если коротко то в корне гита лежат две папки:

* `Affirmly project` содержит весь код приложения на свифте
* `FastAPI-AFFIRMLY` содержит бэк на питоне

Чтобы работать с приложением в xcode откройте нужную папку и выберите использовать проект из того что там

Чтобы работать с питоном сделайте все то же самое только в PyCharm

Обратите внимание на реквайрментс и на ридми - я постарался описать эндпоинты апи которые успел сделать, а в реквайрментс должны быть все библиотеки которые нам нужны. Это супер важно потому что если библиотек нет или стоит другая версия бэк может не работать (особенно важно `bcrypt` строго указанная версия)

Для нашего удобства в репо лежит сразу целиком виртуальное окружение и когда вы его откроете поидее все должно быть уже на месте, но на всякий предупреждаю

### Доп инфо для удобства

В базе уже есть пользователь:

```json
{
    "email": "ivan1@example.com",
    "password": "securepassword123"
}
```

имейл сделал не регистрочуствительным, в пароле регистр важен






