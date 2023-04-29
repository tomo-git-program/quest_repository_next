#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo -n "サービス名を入力してください"
read service
echo -n "ユーザー名を入力してください"
read user_name
echo -n "パスワードを入力してください"
read passward
echo "$service:$user_name:$passward" >> personal_information.txt
echo "Thank you!"