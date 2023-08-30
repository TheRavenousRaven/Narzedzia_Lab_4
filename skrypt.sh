
#!/bin/bash

case "$1" in
    --date)
        date
        ;;
    --logs)
        if [ $# -eq 1 ]; then
            for i in {1..100}; do
                echo "Nazwa pliku: log$i.txt" > "log$i.txt"
                echo "Skrypt: skrypt.sh" >> "log$i.txt"
                echo "Data: $(date)" >> "log$i.txt"
            done
        elif [ $# -eq 2 ]; then
            for i in $(seq 1 $2); do
                echo "Nazwa pliku: log$i.txt" > "log$i.txt"
                echo "Skrypt: skrypt.sh" >> "log$i.txt"
                echo "Data: $(date)" >> "log$i.txt"
            done
        else
            echo "Błąd: Nieprawidłowa liczba argumentów."
        fi
        ;;
    --help)
        echo "Dostępne opcje:"
        echo "--date: Wyświetla dzisiejszą datę."
        echo "--logs [liczba]: Tworzy automatycznie pliki logx.txt z numerem i datą."
        echo "--help: Wyświetla wszystkie dostępne opcje."
        ;;
    *)
        echo "Błąd: Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
        ;;
esac
