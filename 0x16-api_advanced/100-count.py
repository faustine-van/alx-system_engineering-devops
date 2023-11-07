#!/usr/bin/python3
"""
    parses the title of all hot articles, and
    prints a sorted count of given keywords
"""
import json
import requests


def count_words(subreddit, word_list):
    """ prints a sorted count of given keywords
    """
    after = None

    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    if after:
        url += f'&after{after}'
    count_dict = {}
    data = requests.get(url, headers=({'User-agent': 'app'}))
    if data.status_code == 200:
        info = data.json()
        count = 0
        for post in info['data']['children']:
            title_words = post['data']['title'].split()
            for word in word_list:
                word.lower()
                if word in title_words:
                    count = title_words.count(word)
                    count_dict[word] = count_dict.get(word, 0) + count
        if 'data' in data and 'after' in info['data']:
            after = info['data']['after']
            count_words(subreddit, word_list)

        sorted_count_dict = sorted(count_dict.items(), key=lambda x: [1])
        for key, value in sorted_count_dict:
            print(f'{key}: {value}')
    else:
        return (None)
