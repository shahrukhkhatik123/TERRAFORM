pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY_ID')
        AWS_DEFAULT_REGION = "eu-north-1"
    }
    stages {
        stage("EC2") {
            steps {
                script {
                    dir('EC2') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                        // Consider removing the 'terraform destroy' step here to avoid accidental deletion
                    }
                }
            }
        }
    }
}
