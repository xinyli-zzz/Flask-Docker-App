# # Use the official Python image as base image
# FROM python:3.8-slim

# # Set the working directory in the container
# WORKDIR /app

# # Copy the requirements.txt file into the container
# COPY requirements.txt .

# # Install the Python dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy the Flask app source code into the container
# COPY . .

# # Expose port 5000 to the outside world
# EXPOSE 5000

# # Command to run the Flask app
# CMD ["python", "app.py"]


FROM python:3.11.9-alpine3.19

WORKDIR /app

ENV PORT=5000

COPY ["app.py", "requirements.txt", "./"]

RUN pip install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]