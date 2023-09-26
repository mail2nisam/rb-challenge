# Use an official Ruby 3 image as a parent image
FROM ruby:3

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

