pipeline {
    agent any

    environment {
        SSH_USER = 'ec2-user'  // Update based on your EC2 setup
        EC2_INSTANCE_IP = '54.90.170.47'  // Replace with your EC2 instance's public IP or DNS
        SSH_KEY = credentials('my-ec2-ssh-key')  // Jenkins credential ID for SSH key
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone your Git repository
                git url: 'https://github.com/FRED2030/new-itgenius-project.git', branch: 'main'
            }
        }

        stage('Transfer docker-compose.yml to EC2') {
            steps {
                // Copy docker-compose.yml to EC2
                sh """
                    scp -i ${SSH_KEY} -o StrictHostKeyChecking=no docker-compose.yml ${SSH_USER}@${EC2_INSTANCE_IP}:/home/${SSH_USER}/docker-compose.yml
                """
            }
        }

        stage('Deploy with Docker Compose on EC2') {
            steps {
                // SSH into EC2 and deploy using docker-compose
                script {
                    sh """
                        ssh -i ${SSH_KEY} -o StrictHostKeyChecking=no ${SSH_USER}@${EC2_INSTANCE_IP} '
                        cd /home/${SSH_USER}
                        docker-compose down
                        docker-compose pull
                        docker-compose up -d
                        '
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
