#!/usr/bin/python3
""" extract a number of subcribers for given subreddit """
import json
import requests


def number_of_subscribers(subreddit):
    """ returns the number of subscribers
         (not active users, total subscribers)
    """
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    data = requests.get(url, headers=({'User-agent': 'app'}))
    info = data.json()
    if 'data' in info and 'subscribers' in info['data']:
        return (info['data']['subscribers'])
    return 0
