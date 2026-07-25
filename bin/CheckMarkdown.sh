#!/bin/sh
cd "$(dirname "$0")"
cd ..
RESULT=CheckResult
rm -f ${RESULT}.md
markdown-checker . -f check_broken_paths -o ${RESULT} 2>${RESULT}.tmp
fgrep --ignore-case --invert-match volksFORTH ${RESULT}.tmp >${RESULT}.log

ls -l ${RESULT}.md
