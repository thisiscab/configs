#!/bin/bash
# Set maildirs
maildirs="$HOME/.mail/*/INBOX/new/"

string=$(echo $(find $maildirs -type f | wc -l))

if [ "$string" -ne "0" ]; then
    echo $"[ ✉ $string ]"
fi

