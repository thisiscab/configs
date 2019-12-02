for f in **/*.js ;do
    fp=$(dirname "$f")
    ext="tsx"

    file_name=$(basename "$f" .js)
    first_char=${file_name:0:1}

    len=$(expr length `echo $first_char | tr -d "A-Z"` 2>/dev/null)

    if [ ! -z $len ]; then
        mv "$f" "$fp"/"$file_name.$ext"
    fi
done

