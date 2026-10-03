#!/bin/bash

echo "=== Git Automation ==="

echo "Checking status..."
git status

echo "Adding files..."
git add .

echo "Committing..."
git commit -m "$1"

if [ $? -ne 0 ]; then
    echo "Commit failed. Nothing was pushed."
    exit 1
fi

echo "Pushing..."
git push

if [ $? -ne 0 ]; then
    echo "Push failed."
    exit 1
fi

echo "=== Done ==="