#!/usr/bin/env bash

# I used this script to bring the CSV files into a more standard form which
# required less fixing for learners. I did not want them to focus on data
# cleaning but instead focus on data visualization.

# safe bash settings
set -euo pipefail

for file in tromso*.csv oslo*.csv; do
    sed -i 's/,/./g' $file
done

for file in tromso*.csv oslo*.csv; do
    sed -i 's/;/,/g' $file
done

for file in tromso*.csv oslo*.csv; do
    sed -i 's/,-,/,0,/g' $file
done
