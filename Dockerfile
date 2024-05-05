# Versión de node que se va acupar en el contenedor
FROM node:18 

# Crear directorio de aplicaciones
WORKDIR /usr/src/app 

# Copiar package.json y package-lock.json si existe
COPY package*.json ./ 

# Instalar dependencias desde el package.json
RUN npm install 

# Copia tu carpeta local excluyendo el archivo en dockerignore
COPY . . 

# Exponer el puerto interno de la ventana acoplable donde se ejecuta la aplicación
EXPOSE 3000 

# Crear codigo transpilado de la APP
RUN npm run build 

# run node dist/main.js
CMD [ "node" , "dist/main.js" ]