pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "eu-north-1"
    }
    stages {
        stage("Create an EC2 instance") {
            steps {
                script {
                    dir('EC2') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
