if [ $# -eq 0 ]
  then
    echo "No name supplied"
    exit 1
fi

filename=$1
# docker ps -aqf "name=zokrates"
containers=($(docker ps -aqf "ancestor=zokrates"))
zokratescontainer=${containers[0]}
echo Using container: $zokratescontainer..

shift
docker exec $zokratescontainer bash -c "cd /home/zokrates \
                                        && ./zokrates generate-proof -i ${filename}/variables.inf -j ${filename}/proof.json -p ${filename}/proving.key -w ${filename}/witness"
                                        