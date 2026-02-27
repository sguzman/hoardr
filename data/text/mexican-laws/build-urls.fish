cat 'Leyes Federales de México.html' | pup 'a[href^="pdf/"] attr{href}' | while read msg
    echo "https://www.diputados.gob.mx/LeyesBiblio/$msg"
end | sort --unique
