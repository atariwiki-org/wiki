#!/bin/sh
cd "$(dirname "$0")"
cd ..
mkdir -p results
RESULT=results/markdown-checker
rm -f ${RESULT}.md

if ! command -v markdown-checker  >/dev/null 2>&1
then
    echo "Command 'markdown-checker' could not be found."
    if ! command -v python3  >/dev/null 2>&1
    then
        echo "Command 'python3' could not be found. Install from https://www.python.org/downloads/".
        echo "Make sure all previously installed versions, e.g. installed via brew are uninstalled first."
        echo "Also make sure that the new Python bin folder is included in the PATH."
        exit 1
    fi
    if ! command -v pip >/dev/null 2>&1
    then
        echo "Command 'pip' could not be found. Retrieving 'get-pip.py'."
        curl https://bootstrap.pypa.io/get-pip.py >get-pip.py
        python3 get-pip.py
        rm get-pip.py
    fi
    pip install markdown-checker
    exit 1
fi

markdown-checker . -f check_broken_paths -o ${RESULT} 2>${RESULT}.log
ls -l ${RESULT}.md
