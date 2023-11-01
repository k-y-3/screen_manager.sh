#!/bin/bash

# 定义一个函数来获取并解析 screen 会话列表
get_sessions() {
    screen -ls | awk '/[0-9]+\./ {print $1}'
}

while true; do
    choice=$(whiptail --title "Screen Manager" --menu "Choose an option" 16 78 5 \
        "list" "List sessions" \
        "new" "New session" \
        "attach" "Attach to a session" \
        "delete" "Delete a session" \
        "quit" "Quit" 3>&1 1>&2 2>&3)

    case $choice in
        list)
            screen -ls > sessions.txt
            whiptail --textbox sessions.txt 16 78
            rm sessions.txt
            ;;
        new)
            session_name=$(whiptail --inputbox "Enter session name" 8 78 --title "New Session" 3>&1 1>&2 2>&3)
            screen -S $session_name -d -m
            screen -r $session_name
            exit  # 退出 screen_manager.sh 脚本
            ;;
        attach|delete)
            # 获取会话列表并提供给用户
            session_list=($(get_sessions))
            radiolist_options=()
            for session in "${session_list[@]}"; do
                radiolist_options+=("$session" "" "OFF")
            done
            session_name=$(whiptail --title "Select a session" --radiolist "Choose a session to $choice" 16 78 ${#session_list[@]} "${radiolist_options[@]}" 3>&1 1>&2 2>&3)
            if [[ -n $session_name ]]; then
                if [[ $choice == "attach" ]]; then
                    screen -r $session_name
                    exit  # 退出 screen_manager.sh 脚本
                else
                    screen -S $session_name -X quit
                fi
            fi
            ;;
        quit)
            break
            ;;
    esac
done
