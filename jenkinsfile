pipeline {
    agent any

    environment {
        IMAGE_NAME = "website"
        CONTAINER_NAME = "c1"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Running build for branch: ${env.BRANCH_NAME}"
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "sudo docker build . -t ${IMAGE_NAME}"
            }
        }

        stage('Deploy (only if master)') {
            when {
                branch 'master'
            }
            steps {
                sh "sudo docker rm -f ${CONTAINER_NAME} 2>/dev/null || true"
                sh "sudo docker run -itd -p 82:80 --name=${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }
    }

    post {
        always {
            echo "Pipeline completed for branch: ${env.BRANCH_NAME}"
        }
    }
}
