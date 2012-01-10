#!/bin/bash
git commit -a
git format-patch origin/master
git push
