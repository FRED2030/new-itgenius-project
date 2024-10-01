pipeline {
    agent any

    environment {
        REGISTRY_CREDENTIAL = "dockerhub"
    }

    stages {

        stage('Git') {
            steps {
                git branch: 'main',
                url: 'https://github.com/FRED2030/new-itgenius-project.git'
            }
        }

        stage('Test'){
            steps{
                echo 'test'
            }
        }

        stage('Docker build and push'){
            steps{
                script {
                    docker.withRegistry('', REGISTRY_CREDENTIAL) {
                sh """
                chmod +x ./mvnw
                ./mvnw clean install
                docker rmi -f fredking/itgenius &>/dev/null && echo 'Removed old container'
                docker build -t fredking/itgenius .
                docker push fredking/itgenius
                """
                
                }
            }
        }
        }


/*
        stage('Deploy to server'){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'test-server',
                transfers: [sshTransfer(cleanRemote: false, excludes: '',
                execCommand: '''cd /home/ec2-user/
                sh deployment.sh''',
                execTimeout: 120000,
                flatten: false,
                makeEmptyDirs: false,
                noDefaultExcludes: false,
                patternSeparator: '[, ]+',
                remoteDirectory: '',
                remoteDirectorySDF: false,
                removePrefix: '',
                sourceFiles: '')],
                usePromotionTimestamp: false,
                useWorkspaceInPromotion: false,
                verbose: false)])
            }
        } */
    }
}
