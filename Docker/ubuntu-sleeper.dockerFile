FROM ubuntu:20.04

# Install Python 3
RUN apt-get update && apt-get install -y python3

# Create a directory for the application
WORKDIR /app

# Copy the app.py file into the container
COPY app.py /app/

# Original commands
RUN apt-get update && apt-get install -y some-package
CMD sleep 5
