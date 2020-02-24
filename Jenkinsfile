properties([pipelineTriggers([githubPush()])])

node {
  def build
  git url: 'https://github.com/DKSadx/spring-petclinic.git', branch: 'demo'

  stage('Build app') {
      // Stop and remove container if it exists
      sh "docker stop ${BUILD_CONTAINER} || true && docker rm ${BUILD_CONTAINER} || true"
      sh '''
      docker run --name ${BUILD_CONTAINER} \
                 --mount type=bind,source=\$HOME/.m2,target=/root/.m2 \
                 -e GITHUB_REPO=${GITHUB_REPO} \
                 -e FOLDER_NAME=${FOLDER_NAME} \
                 -e BRANCH_NAME=${BRANCH_NAME} \
                 -e UID=\$(id -u) \
                 -e GID=\$(id -g) \
                 build:v1
      '''
  }

  stage('Copy jar file to host') {
      sh "docker cp ${BUILD_CONTAINER}:${FOLDER_NAME}/jar ."
      sh "docker cp ${BUILD_CONTAINER}:${FOLDER_NAME}/target/${JAR_FILE}.jar jar/"
  }

  stage('Build runtime image') {
    sh "cd jar && docker build -t run:${DEPLOY_IMAGE_TAG} ."
  }

  stage('Tag and push the image to docker hub') {
      sh "docker tag run:${DEPLOY_IMAGE_TAG} localhost:5000/run:${DEPLOY_IMAGE_TAG}"
      sh "docker push localhost:5000/run:${DEPLOY_IMAGE_TAG}"
  }

    stage('Run app') {
    sh "docker stop ${DEPLOY_CONTAINER} || true && docker rm ${DEPLOY_CONTAINER} || true"
    sh "docker run -d --rm --net host --name ${DEPLOY_CONTAINER} run:${DEPLOY_IMAGE_TAG}"
  }

}