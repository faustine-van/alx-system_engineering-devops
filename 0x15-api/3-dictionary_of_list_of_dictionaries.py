#!/usr/bin/python3
"""using this REST API, for a given employee ID,
   returns information about his/her TODO list progress.
"""
import json
import requests


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com"

    # fetching user information
    user_r = requests.get(f'{url}/users')
    user_d = user_r.json()

    all_todo_task = {}
    for user in user_d:
        user_id = user['id']
        user_name = user['username']

        url_todo = requests.get(f'{url}/todos?userId={user_id}')
        todo_d = url_todo.json()

        task_list = []
        for record in todo_d:
            completed = record.get('completed')
            title = record.get('title')
            task = {
               "username": user_name,
               "task": title,
               "completed": completed
            }
            task_list.append(task)
        all_todo_task[user_id] = task_list

    with open('todo_all_employees.json', 'w') as file:
        json.dump(all_todo_task, file)
