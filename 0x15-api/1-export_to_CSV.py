#!/usr/bin/python3
"""using this REST API, for a given employee ID,
   returns information about his/her TODO list progress.
"""
import requests
from sys import argv


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

    # save in USER_ID.csv
    # "USER_ID","USERNAME","TASK_COMPLETED_STATUS","TASK_TITLE"
    with open(f'{employee_id}.csv', 'w') as file:
        for record in todo_d:
            user_id = record.get('userId')
            completed = record.get('completed')
            title = record.get('title')
            line = f'"{user_id}", "{name}", "{completed}", "{title}"'
            file.write(line + '\n')
