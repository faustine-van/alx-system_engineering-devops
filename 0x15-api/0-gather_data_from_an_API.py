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

    # fetching to do list
    todo_r = requests.get(f'{url}/todos?userId={employee_id}')
    todo_d = todo_r.json()
    name = user_d.get('name')

    # number of all tasks
    total = len(todo_d)
    # number of done tasks
    completed = 0
    for task in todo_d:
        if task['completed']:
            completed += 1
    print(f'Employee {name} is done with tasks({completed}/{total}):')

    # complted task with title of todo list
    task_titles = [task['title'] for task in todo_d if task['completed']]
    if task_titles:
        for title in task_titles:
            print(f'	 {title}')
