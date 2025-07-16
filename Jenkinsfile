pipeline {
    agent any

    environment {
        BACKEND_IMAGE = "raja/fastapi-backend"
        FRONTEND_IMAGE = "raja/fastapi-frontend"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/RatnalaRaja/full-stack-fastapi-template.git', branch: 'master'
            }
        }

        stage('Build Backend Docker Image') {
            steps {
                dir('backend') {
                    script {
                        sh 'docker build -t $BACKEND_IMAGE .'
                    }
                }
            }
        }

        stage('Build Frontend Docker Image') {
            steps {
                dir('frontend') {
                    script {
                        sh 'docker build -t $FRONTEND_IMAGE .'
                    }
                }
            }
        }

        // Optional: Run containers (only for dev/test purposes)
        stage('Run Containers (Optional)') {
            steps {
                script {
                    sh 'docker run -d --name backend -p 8000:8000 $BACKEND_IMAGE'
                    sh 'docker run -d --name frontend -p 3000:3000 $FRONTEND_IMAGE'
                }
            }
        }
    }
}
