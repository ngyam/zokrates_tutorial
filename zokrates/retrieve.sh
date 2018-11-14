
if [ $# -eq 0 ]
  then
    echo "No name supplied"
    exit 1
fi

filename=$1
echo $1
containers=($(docker ps -aqf "ancestor=zokrates"))
zokratescontainer=${containers[0]}
echo Using container: $zokratescontainer..
# mkdir ./${filename}/
docker cp ${zokratescontainer}:/home/zokrates/${filename} .
