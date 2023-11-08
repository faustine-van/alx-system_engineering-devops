#!/usr/bin/python3
import requests
from os import sys
import json

if __name__ == "__main__":
    
    args = sys.argv
    headers = ({'DD-API-KEY': args[1], 'DD-APPLICATION-KEY': args[2]})

    url = "https://api.datadoghq.com/api/v1/dashboard"
    res = requests.get(url, headers=headers)
    data = res.json()

    print(data)
