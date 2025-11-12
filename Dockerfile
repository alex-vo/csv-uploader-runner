FROM node AS ui_build
WORKDIR /app
COPY ./csv-uploader-ui .
RUN npm install
RUN npm run build

FROM gradle:8.14.3-jdk21-alpine AS build
WORKDIR /home/gradle/project
COPY --chown=gradle:gradle ./csv-uploader .
RUN mkdir /home/gradle/project/web/src/main/resources/static
COPY --from=ui_build /app/dist/ /home/gradle/project/web/src/main/resources/static
RUN gradle --no-daemon clean build -x test

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
RUN mkdir "uploads"
COPY --from=build /home/gradle/project/web/build/libs/web-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

