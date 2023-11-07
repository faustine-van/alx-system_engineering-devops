#!/usr/bin/python3
""" list containing the titles of all hot articles """
import json
import requests


def recurse(subreddit, hot_list=[], after=None):
    """ list containing the titles of all hot article
        for given subreddits
    """

    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    if after:
        url += f'?after={after}'
    data = requests.get(url, headers=({'User-agent': 'app'}))
    if data.status_code == 200:
        info = data.json()
        for post in info['data']['children']:
            hot_list.append(post['data']['title'])

        if 'data' in data and 'after' in info['data']:
            after = info['data']['after']
            return recurse(subreddit, hot_list)
        else:
            return (hot_list)
    else:
        return None
