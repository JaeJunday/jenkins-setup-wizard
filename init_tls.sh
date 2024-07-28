#! /bin/bash

mkdir -p ./nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./nginx/ssl/cert.key -out ./nginx/ssl/cert.pem -subj "/C=KR/ST=Seoul/L=Seoul/O=MyCompany/OU=MyDepartment/CN=www.mywebsite.com/emailAddress=admin@mywebsite.com"


echo "개인 키, CSR, 인증서 생성 완료."
