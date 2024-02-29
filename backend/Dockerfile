# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./app /app

# Install any needed packages specified in pyproject.toml
COPY pyproject.toml ./
RUN pip install poetry && poetry config virtualenvs.create false && poetry install --no-dev

# Make port 5454 available to the world outside this container
EXPOSE 5454

# Define environment variable
ENV MODULE_NAME=app.main
ENV VARIABLE_NAME=app
ENV PORT=5454

# Run app.py when the container launches
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5454"]
