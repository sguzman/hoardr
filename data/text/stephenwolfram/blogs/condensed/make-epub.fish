pandoc --from=html --to=epub3 \
    --metadata title="Wolfram Blog Archive" \
    --metadata author="Stephen Wolfram" \
    --toc --toc-depth=2 \
    --output wolfram.epub \
    --split-level 2 \
    --file-scope \
    --verbose \
    --lua-filter strip_junk.lua \
    *.html
