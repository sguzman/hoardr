for i in *.html
    cat $i | pup 'article > div > ul#lcp_instance_0 > li > a[href] attr{href}'
end | sort --unique
