while read line || [ -n "$line" ] ; do
    cd /rust_builder/$line
    wasm-pack build --target web
done < /rust_builder/project_selector.txt