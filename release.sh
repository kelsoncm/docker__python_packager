#!/usr/bin/env bash
FULL_IMAGE_NAME="ctezlifrn/python_packager"

if [ $# -eq 0 ]; then
  LAST_TAG="$(git tag | tail -1 )"
  echo ''
  echo 'NAME '
  echo '       release'
  echo 'SYNOPSIS'
  echo '       ./release.sh [-l|-g|-p|-a] <version>'
  echo 'DESCRIPTION'
  echo "       Create a new release $FULL_IMAGE_NAME image."
  echo 'OPTIONS'
  echo '       -l         Build only locally'
  echo '       -g         Push to GitHub'
  echo '       <version>  Release version number'
  echo 'EXAMPLES'
  echo '       o   Build a image to local usage only:'
  echo "                  ./release.sh -l $LAST_TAG"
  echo '       o   Build and push to GitHub:'
  echo "                  ./release.sh -g $LAST_TAG"
  echo "LAST TAG: $LAST_TAG"
  exit
fi

OPTION=$1
VERSION=$2

build_docker() {
  if [[ "$OPTION" == "-l" ]]
  then
    printf "\n\nBUILD local version $FULL_IMAGE_NAME:latest\n"
    docker build -t $FULL_IMAGE_NAME:$VERSION --force-rm . && \
    docker build -t $FULL_IMAGE_NAME:latest --force-rm .
  fi
}

push_to_github() {
  if [[ "$OPTION" == "-g" ]]
  then
    printf "\n\n\GITHUB: Pushing\n"
    git tag $VERSION
    git push --tags origin main
  fi
}

build_docker \
&& push_to_github

echo $?
echo ""
echo "Done."
