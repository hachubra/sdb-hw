#!/usr/bin/env python
# coding=utf-8
import pika

credentials = pika.PlainCredentials('test', 'test')
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost',5672,'/',credentials))
channel = connection.channel()
channel.queue_declare(queue='zdraste')


def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)


channel.basic_consume('zdraste',callback,auto_ack=False)
channel.start_consuming()