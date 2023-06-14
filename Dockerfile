FROM python:3.10
ADD . /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN apt update
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000 
CMD exec gunicorn app.wsgi:application --bind 0.0.0.0:8000 --workers 5