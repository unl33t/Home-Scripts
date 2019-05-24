#!/bin/bash
read -r -p "Did you 'git pull' first? [Y/n] " updates

if [[ "$updates" =~ ^([yY][eE][sS]|[yY])+$ ]] ; then
    echo "Good, carry on!"
else
    echo "Bailing! do a pull, asses damage then get back to me"
    exit
fi

git commit -a
git push
#echo "ignored files: "
#git ls-files . --ignored --exclude-standard --others
echo "untracked files: "
git ls-files . --exclude-standard --others
echo "all done"
