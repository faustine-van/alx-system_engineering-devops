#!/usr/bin/python3
""" titles of the first 10 hot posts  """
import json
import requests


def top_ten(subreddit):
    """ titles of the first 10 hot posts
        for given subreddits
    """

    url = f'https://www.reddit.com/r/{subreddit}/hot.json?limit=10'
    data = requests.get(url, headers=({'User-agent': 'app'}))
    info = data.json()
    if data.status_code == 200:
        for post in info['data']['children']:
            print(post['data']['title'])
    else:
        print(None)
