# Use the official Python image that matches your Django project's Python version requirement
FROM python:3.8-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Copy the Django project files into the container
COPY . /app

# Update the package list, install necessary system dependencies, and clean up
RUN apt-get update && \
    apt-get install -y libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir Django

# Expose the port the app runs on
EXPOSE 8000

# Define the command to run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
