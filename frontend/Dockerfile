# Используем Node.js как базовый образ
FROM node:14

# Устанавливаем рабочий каталог
WORKDIR /app

# Копируем файлы проекта
COPY ./frontend/package*.json ./

# Устанавливаем зависимости проекта
RUN npm install

# Копируем остальные файлы проекта
COPY ./frontend .

# Собираем приложение
RUN npm run build

# Устанавливаем Nginx для раздачи статики
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
