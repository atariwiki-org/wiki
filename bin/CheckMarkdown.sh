#!/bin/sh
cd "$(dirname "$0")"
cd ..
mkdir -p results
RESULT=results/CheckResult
rm -f ${RESULT}.md

if ! command -v markdown-checker  >/dev/null 2>&1
then
    echo "Command 'markdown-checker' could not be found."
    if ! command -v python3  >/dev/null 2>&1
    then
        echo "Command 'python3' could not be found. Install from https://www.python.org/downloads/,"
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

markdown-checker . -f check_broken_paths -o ${RESULT} 2>${RESULT}.tmp
fgrep --ignore-case --invert-match volksFORTH ${RESULT}.tmp >${RESULT}.log

ls -l ${RESULT}.md
