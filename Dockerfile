FROM node:23-slim
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
COPY . .
RUN npm install
EXPOSE 3000
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
