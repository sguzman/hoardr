cat all.html | pup 'div#content a[href] attr{href}' | sort --unique | while read msg
    set --local many (string split "/" $msg)
    set --local name (basename $msg)
    set --local fullname "$many[4]-$many[5]-$name"
    echo -e "$msg\n\tout=$fullname.html"
end
