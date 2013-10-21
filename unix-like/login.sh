source ./config.sh

school_count=${#AVAILABLE_SCHOOL[@]}
sc=0
for ((i=0; i<${school_count} ; i++)); do
  echo "[${i}] ${SCHOOL_CHINESE[$i]}"
done
read -p "選擇你的學校: " sc

source ./config_${AVAILABLE_SCHOOL[sc]}.sh

result=$(curl -i --data-urlencode $params $url 2> /dev/null | grep "${check_word}" | wc -l)

if [ $result -eq 1 ]; then
	echo "Success!!";
else
	echo "Something wrong!";
fi
