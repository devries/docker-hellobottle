FROM devries/bottle
MAINTAINER Christopher De Vries <devries@idolstarastronomer.com>

RUN pip install gevent

EXPOSE 8080

ADD . /app
WORKDIR /app

RUN chown -R apprunner:apprunner /app
USER apprunner

CMD ["gunicorn","-b","0.0.0.0:8080","-w","3","-k","gevent","--log-file","-","--log-level","debug","--access-logfile","-","main_app:app"]
