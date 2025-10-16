FROM python:3.9

#instalar ssh cliente
RUN apt-get update && apt-get install -y openssh-client

#set environment variables
ENV PYTHONUNBUFFERED 1

#crear y setear el directorio de la app
WORKDIR /app

#copiar los requirements
COPY requirements.txt /app/requirements.txt

#instalar las dependencias
RUN pip install -r requirements.txt

#copiar el codigo de la app
COPY . /app

#empezar la app

CMD python manage.py runserver 0.0.0:8000