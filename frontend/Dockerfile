# Utilisez une image Node.js en tant qu'image de base pour le frontend
FROM node:14 AS frontend

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez les fichiers du frontend dans le conteneur
COPY frontend/package.json frontend/package-lock.json ./
RUN npm install

# Copiez le reste des fichiers du frontend
COPY frontend .

# Build du frontend
RUN npm run build

# Utilisez une image nginx pour héberger les fichiers build du frontend
FROM nginx:alpine

# Copiez les fichiers build du frontend dans le répertoire d'hébergement d'nginx
COPY --from=frontend /app/dist /usr/share/nginx/html

# Exposez le port 80 pour le frontend
EXPOSE 80

# Aucune commande CMD nécessaire, nginx fonctionnera automatiquement
