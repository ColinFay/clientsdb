FROM postgres:13

COPY ./data /var/lib/postgresql/data

ENV POSTGRES_USER superduperuser
ENV POSTGRES_PASSWORD verysecretwow
ENV POSTGRES_DB clients