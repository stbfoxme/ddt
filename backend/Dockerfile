# Используем официальный образ Python
FROM python:3.9

# Устанавливаем рабочий каталог
WORKDIR /app

# Копируем зависимости проекта
COPY ./backend/pyproject.toml /app/

# Устанавливаем зависимости
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

# Копируем исходный код в контейнер
COPY ./backend /app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--reload"]
