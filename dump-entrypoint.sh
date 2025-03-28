
@ dump entrupoint file

image=javanile/vtiger

docker inspect --format='{{json .Config.Entrypoint}}' "${image}"

ENTRYPOINT_CMD=$(docker inspect --format='{{index .Config.Entrypoint 0}}' "${image}")


PATHS=$(docker inspect --format='{{range .Config.Env}}{{println .}}{{end}}' "${image}" | grep '^PATH=' | cut -d= -f2)



CONTAINER_ID=$(docker create "${image}")
for dir in $(echo "$PATHS" | tr ':' ' '); do
    echo "Percorso assoluto: $dir/$ENTRYPOINT_CMD"
  docker cp $CONTAINER_ID:$dir/$ENTRYPOINT_CMD ./file.txt
done

docker rm $CONTAINER_ID


