#!/bin/sh
# Purge GtkBuilder UI files: strip comments and collapse inter-tag whitespace
sed 's/<!--.*-->//' < "$1" | sed ':a;N;$!ba;s/ *\n *</</g' > "$2"
