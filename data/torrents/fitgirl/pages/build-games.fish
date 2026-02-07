for i in *.html
    cat $i | pup 'article > div > ul#lcp_instance_0 > li > a[href] attr{href}' | sort --unique | while read msg
        set --local path (string split '/' $msg)
        echo -e "$msg\n\tout=$path[4].html"
    end
end
