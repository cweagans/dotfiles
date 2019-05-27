#!/usr/bin/env bash

echo "📈`todoist karma`  ✓`todoist list --filter '(overdue | today)' | wc -l`"
echo "---"
todoist list --filter '(overdue|today)' | grep -o "  .*" | sed 's/^[[:space:]]*//'
