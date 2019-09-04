#!/bin/sh -l

cd $(mktemp -d)
{
  echo "FROM $1"
  echo "COPY --from=$2 $3 $4"
  echo "ENTRYPOINT [\"$4\"]"
} > Dockerfile
docker build -t "$5" .
