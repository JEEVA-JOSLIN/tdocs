FROM python:3.11

# Install libmagic
RUN apt-get update && apt-get install -y libmagic1

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Command to run the application
CMD ["gunicorn", "--worker-class", "uvicorn.workers.UvicornWorker", "--timeout", "600", "--access-logfile", "-", "--error-logfile", "-", "main:app"]
