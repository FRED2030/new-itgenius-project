pipeline {
    agent any

    environment {
        JAVA_HOME = tool 'JDK 11' // Update with your JDK installation name
        MAVEN_HOME = tool 'Maven 3.6.3' // Update with your Maven installation name
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git url: 'https://github.com/FRED2030/new-itgenius-project.git', branch: 'main' // Update with your repo URL and branch
            }
        }

        stage('Build') {
            steps {
                // Clean and package the application
                sh "'${MAVEN_HOME}/bin/mvn' clean package"
            }
        }

        stage('Test') {
            steps {
                // Run tests
                sh "'${MAVEN_HOME}/bin/mvn' test"
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application (modify this step based on your deployment strategy)
                echo 'Deploying to server...'
                // Example of using SCP or any deployment command
                // sh "scp target/itgenuine-0.0.1-SNAPSHOT.jar user@yourserver:/path/to/deploy/"
            }
        }
    }

    post {
        always {
            // Archive the artifacts for later access
            archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
