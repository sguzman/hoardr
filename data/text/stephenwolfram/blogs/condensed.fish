for html in *.html
    cat $html | pup 'article[id] text{}' >condensed/$html
end
