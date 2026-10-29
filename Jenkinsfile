pipeline {
    agent any

    environment {
        STUDENT = 'Zholdas Bekassyl'
        IMAGE   = 'zholdas-bekassyl-student-api'
        TAG     = 'v1.0-zholdas-bekassyl'
    }

    triggers { pollSCM('H/2 * * * *') }

    stages {
        stage('Checkout') {
            steps {
                echo "Student: ${STUDENT}"
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'chmod +x gradlew && ./gradlew clean build -x test --no-daemon'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test --no-daemon'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: 'build/test-results/test/*.xml'
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE}:${TAG} .'
            }
        }
        stage('Verify') {
            steps {
                sh 'docker image inspect ${IMAGE}:${TAG} --format "Image exists: {{.RepoTags}} size={{.Size}}"'
                echo "Pipeline for ${STUDENT} finished successfully"
            }
        }
    }
}
