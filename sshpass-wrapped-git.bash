#!/bin/bash
set -e

echo "Running with parameters: " && echo "$@";

exec git "$@";
