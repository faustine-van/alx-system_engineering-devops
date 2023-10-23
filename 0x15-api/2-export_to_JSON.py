#!/usr/bin/python3
"""using this REST API, for a given employee ID,
   returns information about his/her TODO list progress.
"""
import requests
from sys import argv
import json


if __name__ == '__main__':
    employee_id = argv[1]
    url = "https://jsonplaceholder.typicode.com"

    # fetching user information
    user_r = requests.get(f'{url}/users/{employee_id}')
    user_d = user_r.json()
    name = user_d.get('username')

    # fetching to do list
    todo_r = requests.get(f'{url}/todos?userId={employee_id}')
    todo_d = todo_r.json()

    task_list = []
    for record in todo_d:
        completed = record.get('completed')
        title = record.get('title')
        task = {
            "task": title,
            "completed": completed,
            "username": name
           }
        task_list.append(task)
    data = {str(employee_id): task_list}

    with open(f'{employee_id}.json', 'w') as file:
        json.dump(data, file)
