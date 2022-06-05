FROM node:lts-buster-slim

# создание директории приложения

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

# установка зависимостей
# символ астериск ("*") используется для того чтобы по возможности
# скопировать оба файла: package.json и package-lock.json
COPY package.json ./
USER node

RUN npm install
# Если вы создаете сборку для продакшн
# RUN npm ci --only=production

# COPY /node-js-react-npm-app /usr/src/app

# копируем исходный код
COPY --chown=node:node . .
EXPOSE 3000
CMD [ "npm", "start" ]