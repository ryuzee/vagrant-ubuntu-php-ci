#!/bin/sh

mkdir -p ./application/app/webroot
FILE="./application/app/webroot/index.php"
if [ ! -f $FILE ]
then
  echo "<?php \nphpinfo();\n?>" > ./application/app/webroot/index.php
fi
