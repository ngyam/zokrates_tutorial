if [ $# -eq 0 ]
  then
    echo "Please supply the name"
    exit 1
fi

filename=$1
# docker ps -aqf "name=zokrates"
containers=($(docker ps -aqf "ancestor=zokrates"))
zokratescontainer=${containers[0]}
echo Using container: $zokratescontainer..
docker exec $zokratescontainer bash -c "rm -rf /home/zokrates/${filename}/"
