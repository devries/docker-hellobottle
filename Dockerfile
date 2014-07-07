FROM devries/bottle
MAINTAINER Christopher De Vries <cdevries@t2000inc.com>

EXPOSE 8080

ADD . /app
WORKDIR /app

CMD ["gunicorn","-b","0.0.0.0:8080","-w","3","--log-level","debug","--access-logfile","-","main_app:app"]
