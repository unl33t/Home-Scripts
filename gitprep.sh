#!/bin/bash
git pull
echo -n "Was anything sucked down? (y/n):   "
read updates

if [ $updates -eq y ] ; then
    echo "Make sure nothing was overwritten!"
    exit
fi

git commit -a
git push
echo "ignored files: "
git ls-files . --ignored --exclude-standard --others
echo "untracked files: "
git ls-files . --exclude-standard --others
echo "all done"
