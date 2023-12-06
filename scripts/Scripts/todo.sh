#!/bin/bash

# Depends on gh (github.com/cli/cli)

todo_list_path=$HOME/dev/todo-list
todo_file="todo.md"
current_dir="$(pwd)"

function check_connection() {
	echo "Checking Connection"
	ret="$(curl -Is 'https://www.google.com' | head -n 1)"
	if [ -z "$ret" ]; then
		echo "Error: No Network Connection"
		exit 1
	fi
}

function fetch_file() {
	echo "Fetching"
	gh issue view "https://github.com/bojle/todo-list/issues/1#issue-1604396469" > /tmp/todo_tmp_
}

function open_file() {
	sed 's/\r//g' /tmp/todo_tmp_ > $todo_file
	vim $todo_file
	# quit if vim err'ed
	if (( $? == 1 )); then
		echo "Exit without write_back"
		exit 1
	fi
}

function write_back() {
	echo "Writing"
	gh issue edit 1 -F $todo_file
}

cd $todo_list_path
check_connection
fetch_file
open_file
write_back
cd "$current_dir"
