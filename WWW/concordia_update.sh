#!/bin/bash
echo "Updating files on concordia.eastkingdom.org"
scp -rp ~/Sites/Concordia\ of\ the\ Snows\ Ver\ 2/* concordia@concordia.eastkingdom.org:/home/concordia/public_html
echo "Done"
