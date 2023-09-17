import configuration
import requests
import data

def create_order():
    return requests.post(configuration.URL_SERVICE + configuration.CREATE_ORDER, json=data.order_body,
                         headers=data.headers)

def order_tracking_number(x):
    return requests.get(configuration.URL_SERVICE + configuration.ORDER_TRACK + str(x))




