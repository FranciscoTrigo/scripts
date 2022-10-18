while true; do
    # Log stderror to a file 
    ck-launch-session dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done

