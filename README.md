# Task Runner

A task runner written in bash to build front-end assets

## Installation

```sh
$ git clone https://github.com/mickaelvieira/task-runner.git
$ cd task-runner
$ ./task-runner -h
$ task-runner -h
Usage: task-runner [options] -e <task> -s <source directory> -t <target directory>
Version: 0.0.1
Options:
  -h: This help
  -d: Debug mode
  -e: Executed task name
  -s: Source directory where to find the assets, default ''
  -t: Target directory where to build the assets, default 'dist'
Tasks: clean unwatch watch watch_js watch_css watch_tests run_tests build build_js build_css
```

```sh
$ sudo ln -s /path/to/task-runner /usr/local/bin/task-runner
$ cd /path/to/your/project
$ task-runner -s web/ -t web/dist/ -e build # Build the assets
$ task-runner -s web/ -t web/dist/ -e watch # Watch the assets
# task-runner -e unwatch                    # Stop watching
```


