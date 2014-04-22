#!/bin/bash
git commit -a
git push
echo "ignored files: "
git ls-files . --ignored --exclude-standard --others
echo "untracked files: "
git ls-files . --exclude-standard --others
echo "all done"
