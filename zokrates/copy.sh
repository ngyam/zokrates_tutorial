# create folder with the .code filename in container
# copy .code into the running container
#

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
docker exec $zokratescontainer bash -c "mkdir /home/zokrates/${filename}"
docker cp ${filename}.code ${zokratescontainer}:/home/zokrates/${filename}/${filename}.code
