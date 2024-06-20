pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/akandeae/s3-bucket-repo.git']])
            }
        }
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }
	 stage('Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Apply') {
            steps {
                sh 'terraform apply'
            }
        }

    }
post {
        success {
            mail bcc: '',
                 body: """Build Status: SUCCESS
                         \nJob: ${env.JOB_NAME}
                         \nBuild number: ${env.BUILD_NUMBER}
                         \nBuild URL: ${env.BUILD_URL}""",
                 cc: '',
                 from: 'akande.ae@gmail.com',
                 replyTo: 'akande.ae@gmail.com',
                 subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 to: 'preciousakande@yahoo.co.uk'
        }
        failure {
            mail bcc: '',
                 body: """Build Status: FAILURE
                         \nJob: ${env.JOB_NAME}
                         \nBuild number: ${env.BUILD_NUMBER}
                         \nBuild URL: ${env.BUILD_URL}""",
                 cc: '',
                 from: 'akande.ae@gmail.com',
                 replyTo: 'akande.ae@gmail.com',
                 subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 to: 'preciousakande@yahoo.co.uk'
        }
        unstable {
            mail bcc: '',
                 body: """Build Status: UNSTABLE
                         \nJob: ${env.JOB_NAME}
                         \nBuild number: ${env.BUILD_NUMBER}
                         \nBuild URL: ${env.BUILD_URL}""",
                 cc: '',
                 from: 'akande.ae@gmail.com',
                 replyTo: 'akande.ae@gmail.com',
                 subject: "UNSTABLE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 to: 'preciousakande@yahoo.co.uk'
        }
        always {
            mail bcc: '',
                 body: """Build Status: ${currentBuild.currentResult}
                         \nJob: ${env.JOB_NAME}
                         \nBuild number: ${env.BUILD_NUMBER}
                         \nBuild URL: ${env.BUILD_URL}""",
                 cc: '',
                 from: 'akande.ae@gmail.com',
                 replyTo: 'akande.ae@gmail.com',
                 subject: "Build ${currentBuild.currentResult}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 to: 'preciousakande@yahoo.co.uk'
        }
}
}
