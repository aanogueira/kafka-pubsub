FROM python

ENV PYTHONUNBUFFERED=1

WORKDIR /app

ADD requirements.txt .
ADD producer.py .
ADD config.toml .

RUN pip install -r requirements.txt

CMD [ "python", "producer.py" ]
