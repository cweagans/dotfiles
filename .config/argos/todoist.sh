#!/usr/bin/env bash

echo "✓ `todoist list --filter '(overdue | today)' | wc -l`"
echo "---"
todoist list --filter '(overdue|today)'
