pipeline {
    agent any

        stage('Install Dependencies') {
            steps {
                sh 'php -r "copy(\'https://getcomposer.org/installer\', \'composer-setup.php\');"'
                sh 'php composer-setup.php'
                sh 'php composer.phar install'
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh './vendor/bin/phpunit tests/SimpleTest.php'
            }
        }

        stage('Build & Deploy with Docker') {
            steps {
                sh 'docker build -t php-ci-cd-demo .'
                sh 'docker run -d -p 8000:8000 --name php-app php-ci-cd-demo'
            }
        }
    }
}
