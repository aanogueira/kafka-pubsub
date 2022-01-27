import configparser
from time import sleep
from json import dumps
from kafka import KafkaProducer

parser = configparser.ConfigParser()
parser.read("config.toml")

producer = KafkaProducer(
	bootstrap_servers=[parser.get('config', 'server')],
	value_serializer=lambda x: dumps(x).encode('utf-8'))

for e in range(1000):
    data = {'number' : e}
    producer.send(parser.get('config', 'topic'), value=data)
    print('{} sent'.format(data))
    sleep(5)
