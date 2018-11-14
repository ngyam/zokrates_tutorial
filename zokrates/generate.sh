if [ $# -eq 0 ]
  then
    echo "No name and witness params supplied"
    exit 1
fi

filename=$1
# docker ps -aqf "name=zokrates"
containers=($(docker ps -aqf "ancestor=zokrates"))
zokratescontainer=${containers[0]}
echo Using container: $zokratescontainer..

shift
docker exec $zokratescontainer bash -c "cd /home/zokrates \
                                        && ./zokrates compile -i ${filename}/${filename}.code -o ${filename}/out \
                                        && ./zokrates setup -i ${filename}/out -m ${filename}/variables.inf -p ${filename}/proving.key -v ${filename}/verification.key \
                                        && ./zokrates compute-witness -i ${filename}/out -o ${filename}/witness -a $* \
                                        && ./zokrates generate-proof -i ${filename}/variables.inf -j ${filename}/proof.json -p ${filename}/proving.key -w ${filename}/witness \
                                        && ./zokrates export-verifier -i ${filename}/verification.key -o ${filename}/verifier.sol"
