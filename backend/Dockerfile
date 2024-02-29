# Используем официальный образ Python
FROM python:3.9

# Устанавливаем рабочий каталог
WORKDIR /app

# Копируем файл pyproject.toml и poetry.lock (если есть) в рабочий каталог
COPY ./backend/app/pyproject.toml ./backend/app/poetry.lock* /app/

# Устанавливаем poetry и зависимости проекта
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

# Копируем исходный код приложения в контейнер
COPY ./backend/app /app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--reload"]
