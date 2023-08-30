
#!/bin/bash

#Wyświetlanie danych
display_help() {
    echo "Usage: skrypt.sh [OPTION] [ARG]"
    echo "--date, -d              Display today's date"
    echo "--logs, -l [NUM]        Create log files"
    echo "--help, -h              Display this help message"
    echo "--init                  Clone the repository and set PATH"
    echo "--error, -e [NUM]       Create error files"
}

#Tworzenie plików
create_logs() {
    local num_logs=${1:-100}
    for ((i=1; i<=$num_logs; i++)); do
        filename="log${i}.txt"
        echo "Filename: $filename" > $filename
        echo "Created by: skrypt.sh" >> $filename
        echo "Date: $(date)" >> $filename
    done
    echo "$num_logs log files created."
}

#Tworzenie errorów
create_errors() {
    local num_errors=${1:-100}
    mkdir -p errorx
    for ((i=1; i<=$num_errors; i++)); do
        filename="errorx/error${i}.txt"
        echo "Error file ${i}" > $filename
    done
    echo "$num_errors error files created."
}

#Skrypt główny
if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date

elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    create_logs "$2"

elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    display_help

elif [[ "$1" == "--init" ]]; then
    git clone <https://github.com/TheRavenousRaven/Narzedzia_Lab_4/.git> Narzedzia_Lab_4
    export PATH=$PATH:$(pwd)/Narzedzia_Lab_4

elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    create_errors "$2"

else
    echo "Invalid option. Use --help to see available options."
fi
