#!/bin/bash

set -ex

npm version minor
VERSION=$(node -p -e "require('./package.json').version")
BRANCH=$(echo "$VERSION" | (IFS="."; read a b c && echo $a.$b-stable))
echo "$BRANCH"
git checkout -b "$BRANCH"
git push origin "$BRANCH" --follow-tags
git checkout master
npm version preminor
git push origin master --follow-tags
