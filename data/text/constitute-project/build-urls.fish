cat con.json | jq '.[].id' | while read msg
    set --local name (echo $msg | sed -e 's@"@@g')
    echo "https://www.constituteproject.org/constitution/$name.pdf"
end
