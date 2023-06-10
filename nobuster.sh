#!/bin/bash/
GREEN='\033[32;1m'
YELLOW='\033[33;1m'
RED='\033[31;1m'
for word in $(cat $3)
do
requisicao=$(curl -s -o /dev/null -w "%{http_code}" $1/$word/)
arquivo=$(curl -s -o /dev/null -w "%{http_code}" $1/$word.$2)
if [ $requisicao == "200" ]
then
echo -e "\n${GREEN}Diretorio encontrado $1/$word/${END}\n"
fi
if [ $arquivo == "200" ]
then
echo -e "\n${YELLOW}Arquivo encontrado $1/$word.$2${END}\n"
else
echo -e "\n${RED}Arquivo nao encontrado${END}\n"
fi
done
