pipeline {
    agent any

    environment {
        BACKEND_IMAGE = "fastapi-backend"
        FRONTEND_IMAGE = "fastapi-frontend"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'master', url: 'https://github.com/RatnalaRaja/full-stack-fastapi-template.gitt'
            }
        }

        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Build Backend Docker Image') {
            steps {
                dir('backend') {
                    sh 'docker build -t $BACKEND_IMAGE .'
                }
            }
        }

        stage('Build Frontend Docker Image') {
            steps {
                dir('frontend') {
                    sh 'docker build -t $FRONTEND_IMAGE .'
                }
            }
        }

        stage('Run Containers') {
            steps {
                sh '''
                docker rm -f fastapi-backend || true
                docker rm -f fastapi-frontend || true

                docker run -d --name fastapi-backend -p 8000:8000 fastapi-backend
                docker run -d --name fastapi-frontend -p 80:80 fastapi-frontend
                '''
            }
        }
    }

    post {
        success {
            echo '🚀 Deployed Successfully!'
        }
        failure {
            echo '❌ Deployment Failed.'
        }
    }
}
