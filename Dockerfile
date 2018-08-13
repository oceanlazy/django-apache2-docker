FROM ubuntu

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y apache2 libapache2-mod-wsgi-py3 python3 python3-pip

COPY . /opt/django_apache2_docker/
WORKDIR /opt/django_apache2_docker/

RUN rm -rf dockerfiles
COPY ./dockerfiles/000-default.conf /etc/apache2/sites-available
COPY ./dockerfiles/alias.conf /etc/apache2/mods-enabled

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN sh -c '/bin/echo -e "yes" | python3 manage.py collectstatic'

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]