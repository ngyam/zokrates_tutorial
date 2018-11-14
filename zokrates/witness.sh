if [ $# -eq 0 ]
  then
    echo "Please supply a name and witness params"
    exit 1
fi

filename=$1
# docker ps -aqf "name=zokrates"
containers=($(docker ps -aqf "ancestor=zokrates"))
zokratescontainer=${containers[0]}
echo Using container: $zokratescontainer..

shift
docker exec $zokratescontainer bash -c "cd /home/zokrates \
                                        && ./zokrates compute-witness -i ${filename}/out -o ${filename}/witness -a $*"