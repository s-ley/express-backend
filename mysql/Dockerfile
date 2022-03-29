FROM mysql:8.0
ARG DB_NAME

ENV MYSQL_DATABASE=${DB_NAME}

COPY scripts/ /docker-entrypoint-initdb.d