FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install required system dependencies
RUN apt-get update && apt-get install -y python3-distutils python3-apt && apt-get clean

# Copy the application code to the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir django==3.2

# Expose the Django application port
EXPOSE 8000

# Run migrations and start the server at runtime
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
