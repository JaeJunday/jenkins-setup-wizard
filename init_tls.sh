#! /bin/bash

echo "\n\n\n\n\n\n\n" | openssl req -x509 -days 365 -nodes -newkey rsa:2048 -keyout ./nginx/ssl/nginx.pem -out ./nginx/ssl/nginx.crt


echo "개인 키, CSR, 인증서 생성 완료."
