 #The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.8

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1



# Set the working directory to /drf
# NOTE: all the directives that follow in the Dockerfile will be executed in
# that directory.
WORKDIR /code

ADD . /code


# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

VOLUME /drf_src

EXPOSE 4000

# COPY ./apiglorynuts.service /etc/systemd/system/apiglorynuts.service


# CMD python manage.py runserver 0.0.0.0:4000
CMD gunicorn --workers 3 --bind 0.0.0.0:4000 -m 012 learning_users.wsgi:application