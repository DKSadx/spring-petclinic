#!/bin/bash

echo "=== Cloning the demo-app repository ==="
git clone $GITHUB_REPO
cd $FOLDER_NAME
git checkout $BRANCH_NAME

echo "=== Building the app ==="
mvn package

echo "=== Changing .jar UID/GID from root:root to hosts UID/GID ==="
chown $UID:$GID target/*.jar