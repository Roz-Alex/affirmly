from fastapi import FastAPI
from database.db import init_db
from routers.content import router as router

app = FastAPI()

app.include_router(router)

@app.on_event("startup")
def on_startup():
    init_db()

# # Отключение при завершении работы
# @app.on_event("shutdown")
# async def shutdown():
#     await db.disconnect()


