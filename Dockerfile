# pulling the python image from the docker repository
FROM python:3.9

# enables unbuffered log messages
ENV PYTHONUNBUFFERED 1

# create a new directory
RUN mkdir /cnapp1

# copy the code contents to the directory and make it the working directory
COPY ./BLOG2SHARE /cnapp1

WORKDIR /cnapp1

# install all the necessary dependencies including upgrading pip to keep track of modules
# install django which containes an inbuilt sqlite3 database that is covered as part of the process
# install pillow that enables support for image and media files for the web application
RUN pip install --upgrade pip
RUN pip install django
RUN pip install pillow

# migrate command executes all the database related commands
# runserver command starts the server that can be accessed from 8000 port(localhost)  [CTRL+C to stop}
CMD ["python", "manage.py", "migrate"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]