# Engine Base Image
FROM node:15.2.1

# Working Directory
WORKDIR /dist

# Environment Injects
ENV PATH /app/node_modules/.bin:$PATH
ENV NODE_ENV dev
ENV API_PREFIX v1

# Install Dependencies
COPY package.json .
RUN npm install --silent

# Duplicate All Source Code to Working Directory
ADD . /dist

# Compile TypeScript
RUN npm run tsc

# Start
CMD ["npm", "start"]
EXPOSE 8080