pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                echo '📦 Installing dependencies with PHP container...'
                sh '''
                    docker run --rm \
                        -v "$PWD":/app -w /app \
                        php:8.1-cli \
                        sh -c "curl -sS https://getcomposer.org/installer | php && php composer.phar install"
                '''
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo '🧪 Running tests with PHP container...'
                sh '''
                    docker run --rm \
                        -v "$PWD":/app -w /app \
                        php:8.1-cli \
                        php vendor/bin/phpunit tests/SimpleTest.php
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                sh 'docker build -t php-ci-cd-demo .'
            }
        }

        stage('Deploy Container') {
            steps {
                echo '🚀 Deploying container...'
                sh '''
                    docker stop php-app || true
                    docker rm php-app || true
                    docker run -d -p 8000:8000 --name php-app php-ci-cd-demo
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Build & deploy selesai!'
        }
        failure {
            echo '❌ Build gagal.'
        }
    }
}
