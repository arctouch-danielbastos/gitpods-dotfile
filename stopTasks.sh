#!/usr/bin/env bash

# Define an array of task names to stop
tasks_to_stop=("Python" "Data Services" "Devheh" "KMP	")

# Run the command to list the tasks and store the output
tasks_list=$(gp tasks list)

# Loop through each task name in the array
for task_name in "${tasks_to_stop[@]}"; do
    # Extract the Terminal ID for the current task name
    task_id=$(echo "$tasks_list" | grep "$task_name" | awk '{print $1}')
    
    # If a task ID is found, stop the task
    if [ -n "$task_id" ]; then
        echo "Stopping task: $task_name with ID: $task_id"
        gp tasks stop "$task_id"
    else
        echo "Task: $task_name not found"
    fi
done
