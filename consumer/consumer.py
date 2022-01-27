import configparser
from kafka import KafkaConsumer
from json import loads

parser = configparser.ConfigParser()
parser.read("config.toml")

consumer = KafkaConsumer(
	parser.get('config', 'topic'),
	bootstrap_servers=[parser.get('config', 'server')],
	auto_offset_reset='earliest',
	enable_auto_commit=True,
	group_id=parser.get('config', 'group'),
	value_deserializer=lambda x: loads(x.decode('utf-8')))

for message in consumer:
    message = message.value
    print('{} received'.format(message))
