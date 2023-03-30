#!/bin/bash

todo_list_path=$HOME/dev/todo-list
current_dir="$(pwd)"
issue_no=1
todo_file="todo.md"
cd $todo_list_path
if [[ $issue_no = 1 ]]; then
	echo "Fetching..."
	gh issue view "https://github.com/bojle/todo-list/issues/1#issue-1604396469" > /tmp/todo_tmp_
fi
sed 's/\r//g' /tmp/todo_tmp_ > $todo_file
vim $todo_file
echo "Writing..."
gh issue edit "$issue_no" -F $todo_file
cd "$current_dir"
