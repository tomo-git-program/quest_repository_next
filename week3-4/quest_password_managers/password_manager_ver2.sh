#!/bin/bash

# パスワードの情報を保存するファイル名
password_file="passwords.txt"

# Add Password の処理
# functionとつけても付けなくてもよい
add_password() {
    echo "サービス名を入力してください："
    read service
    echo "ユーザー名を入力してください："
    read username
    echo "パスワードを入力してください："
    read password

    # パスワードの情報をファイルに追加
    echo "$service:$username:$password" >> $password_file

    echo "パスワードの追加は成功しました。"
}

# Get Password の処理
get_password() {
    echo "サービス名を入力してください："
    read service

    # パスワードの情報をファイルから取得
    password_info=$(grep "^$service:" $password_file)

    # -z 文字列が空白なら真を返すオプション
    # password_infoが空なら真を返せ
    if [ -z "$password_info" ]; then
        echo "そのサービスは登録されていません。"
    else
        # パスワードの情報からサービス名、ユーザー名、パスワードを取得
        # cut テキストから指定したフィールドを抜き出す
        # -d: 文字列をコロンで区切った時
        #-f2 二つ目のフィールドを返せ
        username=$(echo "$password_info" | cut -d: -f2)
        password=$(echo "$password_info" | cut -d: -f3)

        echo "サービス名：$service"
        echo "ユーザー名：$username"
        echo "パスワード：$password"
    fi
}

# パスワードマネージャーのメイン処理
# 一番下に書かないとメソッドが読み込まれない
while true; do
    echo "パスワードマネージャーへようこそ！"
    echo "次の選択肢から入力してください(Add_Password/Get_Password/Exit):"
    read input

    # ;;はbreakと同じ意味を持つ
    case "$input" in
        "Add Password")
            add_password
            ;;
        "Get Password")
            get_password
            ;;
        "Exit")
            echo "Thank you!"
            exit 0
            ;;
        *)
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac
done
