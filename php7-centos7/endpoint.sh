#!/bin/bash

if [ r$PORT == r'' ]; then 
    port="8000"
else 
    port=$PORT
fi
if [ r$WORK_DIR == r'' ]; then 
    work_dir="/code"
else 
    work_dir=$WORK_DIR
fi
listen="0.0.0.0:${port}"
php -S ${listen} -t ${work_dir}
