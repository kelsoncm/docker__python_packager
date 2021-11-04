#!/usr/bin/env bash
FULL_IMAGE_NAME="ifrn/python_packager"

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
  echo '       -r         Registry on DockerHub'
  echo '       -a         Build, Push and Registry'
  echo '       <version>  Release version number'
  echo 'EXAMPLES'
  echo '       o   Build a image to local usage only:'
  echo '                  ./release.sh -l 1.0.0'
  echo '       o   Build and push to GitHub:'
  echo "                  ./release.sh -g $LAST_TAG"
  echo '       o   Build and registry on DockerHub:'
  echo "                  ./release.sh -r $LAST_TAG"
  echo '       o   Build, Push and Registry:'
  echo "                  ./release.sh -a $LAST_TAG"
  echo "LAST TAG: $LAST_TAG"
  exit
fi

OPTION=$1
VERSION=$2

build_docker() {
  if [[ "$OPTION" == "-l" || "$OPTION" == "-a" ]]
  then
    printf "\n\nBUILD local version $FULL_IMAGE_NAME:latest\n"
    docker build -t $FULL_IMAGE_NAME:$VERSION --force-rm . && \
    docker build -t $FULL_IMAGE_NAME:latest --force-rm .
  fi
}

push_to_github() {
  if [[ "$OPTION" == "-g" || "$OPTION" == "-a" ]]
  then
    printf "\n\n\GITHUB: Pushing\n"
    git add setup.py
    git commit -m "Release $FULL_IMAGE_NAME $VERSION"
    git tag $VERSION
    git push --tags origin master
  fi
}


registry_to_dockerhub() {
  if [[ "$OPTION" == "-r" || "$OPTION" == "-a" ]]
  then
    printf "\n\n\PYPI: Uploading\n"
    docker login && \
    docker push $FULL_IMAGE_NAME:$VERSION && \
    docker push $FULL_IMAGE_NAME
  fi
}

build_docker \
&& push_to_github \
&& registry_to_dockerhub

echo $?
echo ""
echo "Done."
