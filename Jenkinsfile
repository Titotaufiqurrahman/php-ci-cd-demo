pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                echo '📦 Installing dependencies...'
                sh 'php -r "copy(\'https://getcomposer.org/installer\', \'composer-setup.php\');"'
                sh 'php composer-setup.php'
                sh 'php composer.phar install'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo '🧪 Running tests...'
                sh './vendor/bin/phpunit tests/SimpleTest.php'
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
                sh 'docker stop php-app || true'
                sh 'docker rm php-app || true'
                sh 'docker run -d -p 8000:8000 --name php-app php-ci-cd-demo'
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
