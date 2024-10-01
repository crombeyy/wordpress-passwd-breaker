# WordPress Password Breaker

Este script foi criado por **./crombey** para ajudar a testar a segurança de sites WordPress por meio de um ataque de bruteforce as senhas. Ele usa uma lista de possíveis senhas (*wordlist*) para tentar encontrar a senha correta de um usuário.

## Como funciona

O script faz várias tentativas de login em um site WordPress. Para cada tentativa, ele pega o nome de usuário e uma senha da *wordlist* e faz uma requisição para a página de login. Se a senha estiver correta, ele vai te avisar, caso contrário, ele segue tentando até achar a senha ou esgotar a lista.

### O que você vai precisar

1. **curl** – Essa é a ferramenta que o script usa para fazer as requisições HTTP.
2. **Uma wordlist** – Um arquivo de texto com as possíveis senhas.

### Como instalar

1. Clone este repositório:

```bash
git clone https://github.com/crombeyy/wordpress-passwd-breaker.git
cd wordpress-passwd-breaker
