# Use the official Python image
FROM python:3.13-slim

# LABEL maintainer= "kini.com"

ENV PYTHONUNBUFFERED 1

# Copy dependency definitions
COPY requirements.txt /django_comn/

# Copy the project code (all files) to the working directory
COPY . /django_comn/

# Set a working directory inside the container
WORKDIR /django_comn

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    adduser --disabled-password --no--create--home django_comn

USER django_comn

# Collect static files (optional, for production)
# RUN python manage.py collectstatic --noinput

# Expose the port that the application will run on
EXPOSE 8080

# Specify the default command to run the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
