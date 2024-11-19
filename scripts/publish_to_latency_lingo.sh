#!/bin/bash -e

# Baixar e extrair a versão correta do Latency Lingo CLI para Linux
curl -L https://github.com/latency-lingo/cli/releases/latest/download/latency-lingo-cli_linux_amd64.tar.gz | tar -xz

# Verificar se o arquivo de resultado está definido
if [ -z "$JTL_RESULT_FILE" ]; then
  echo "Erro: A variável JTL_RESULT_FILE não está definida."
  exit 1
fi

# Publicar o arquivo de resultado para o Latency Lingo
echo "Publicando resultado para o Latency Lingo: $JTL_RESULT_FILE"
./latency-lingo-cli publish \
  --file "$JTL_RESULT_FILE" \
  --api-key "$LATENCY_LINGO_API_KEY" \
  --label "Checkout Flow Jenkins" \
  --env "development"

# Limpeza opcional
rm -f LICENSE README.md latency-lingo-cli

