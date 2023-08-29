FROM python:3.10

#Create directory for application and expose required port
RUN mkdir /app
COPY . /app
EXPOSE 8080
WORKDIR /app

#Run application
CMD ["python", "app.py"]
