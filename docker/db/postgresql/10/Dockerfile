FROM postgres:10.6

#RUN apt-get update && apt-get install -y \
#        nano \
#        mc
COPY init-db.local.sql docker-entrypoint-initdb.d/

CMD ["postgres"]
