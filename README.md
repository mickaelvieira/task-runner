# Task Runner

A task runner written in bash to build front-end assets

## Installation

```sh
$ git clone https://github.com/mickaelvieira/task-runner.git
$ cd task-runner
$ ./task-runner -h
```

```sh
$ sudo ln -s /path/to/task-runner /usr/local/bin/task-runner
$ cd /path/to/your/project
$ task-runner -s web/ -t web/dist/ -e build # Build the assets
$ task-runner -s web/ -t web/dist/ -e watch # Watch the assets
$ task-runner -e unwatch                    # Stop watching
```


