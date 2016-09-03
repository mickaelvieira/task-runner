#!/bin/bash

run_tests() {
    karma start --singleRun=true --autoWatch=false
}

run_tests
