#!/bin/sh
cd "$(dirname "$0")"
cd ..

java -jar bin/AtariWikiTool.jar --check --fix .
